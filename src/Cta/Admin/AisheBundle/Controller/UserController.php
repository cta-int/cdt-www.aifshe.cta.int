<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 9/9/13
 * Time: 8:46 AM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\Admin\AisheBundle\Controller;

use Cta\AisheBundle\Entity\User;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;

class UserController extends Controller
{
    const ITEMS_PER_PAGE = 20;

    /**
     * @param $page
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function overviewAction($page)
    {
        $params                 = array();
        $params['start']        = ($page - 1) * self::ITEMS_PER_PAGE;
        $params['limit']        = self::ITEMS_PER_PAGE;
        $params['blockGroups']  = array('DEVART');

        $userManager = $this->get('fos_user.user_manager');
        $users = $userManager->findOverview($params);

        if ($page > 1 && $users['count'] < 1) {
            return $this->redirect($this->generateUrl('cta_admin_aishe_security_user'));
        }

        return $this->render('CtaAdminAisheBundle:User:overview.html.twig', array(
            'users' => $users['items'],
            'page'      => $page,
            'lastPage'  => ceil($users['count'] / self::ITEMS_PER_PAGE),
        ));
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Symfony\Component\HttpFoundation\RedirectResponse|\Symfony\Component\HttpFoundation\Response
     */
    public function editAction(Request $request, $id)
    {
        $userManager    = $this->get('fos_user.user_manager');
        $user           = $userManager->findUserBy(array('id' => $id));

        if (!$user) {
            $user = $userManager->createUser();
            $user->setRequestAuditor(false);
        }

        $form = $this->createForm('user', $user);
        $form->handleRequest($request);
        if ($form->isValid()) {
            $userManager->updateUser($user);

            $this->addFlash(
                'notice',
                $this->get('translator')->trans(
                    'form.flash.notice',
                    array('%subject%' => $user->getUsername())
                )
            );

            return $this->redirect($this->generateUrl('cta_admin_aishe_security_user'));
        }

        return $this->render('CtaAdminAisheBundle:User:edit.html.twig', array(
            'form'  => $form->createView(),
        ));
    }

    /**
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function pendingAuditorsAction(Request $request)
    {
        $userManager = $this->get('fos_user.user_manager');
        $users = $userManager->findUsersBy(array(
            'requestAuditor'  => true,
        ));

        if ($request->isXmlHttpRequest()) {
            return new JsonResponse(count($users));
        } else {
            return $this->render('CtaAdminAisheBundle:User:pending_auditors.html.twig', array(
                'users' => $users,
            ));
        }
    }

    /**
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function pendingActivationAction(Request $request)
    {
        $userManager = $this->get('fos_user.user_manager');
        $users = $userManager->findUsersBy(array(
            'enabled' => true,
            'locked'  => true,
            'expired' => false,
        ));

        if ($request->isXmlHttpRequest()) {
            return new JsonResponse(count($users));
        } else {
            return $this->render('CtaAdminAisheBundle:User:pending.html.twig', array(
                'users' => $users,
            ));
        }
    }

    /**
     * @param $action
     * @param $id
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function activatePendingAuditorAction($action, $id)
    {
        if ($action == 'accept' || $action == 'decline') {
            $userManager = $this->get('fos_user.user_manager');
            $user = $userManager->findUserBy(array(
                'id'    => $id,
            ));

            if ($user) {
                if ($action == 'accept') {
                    // add auditing group to this user
                    $groupManager = $this->get('fos_user.group_manager');
                    $auditorGroup = $groupManager->findGroupByName('AUDITOR');
                    if ($auditorGroup) {
                        $user->addGroup($auditorGroup);

                        foreach ($user->getReports() as $report) {
                            $report->setIsOfficial(true);
                        }
                    }

                    $message = $this->get('devart.mail')->getMessage('CtaAdminAisheBundle:Mails:Fos/Registration/Auditor/accept.html.twig', array(
                        'user' => $user
                    ));

                    $message->addTo($user->getEmail());

                    $this->get('mailer')->send($message);
                }

                // permissions have been granted or denied; The user request has been handled
                $user->setRequestAuditor(false);
                $userManager->updateUser($user);


                $this->addFlash(
                    'notice',
                    $this->get('translator')->trans(
                        'form.flash.notice',
                        array('%subject%' => $user->getUsername())
                    )
                );
            } else {
                $this->addFlash(
                    'error',
                    $this->get('translator')->trans(
                        'form.flash.error',
                        array('%subject%' => 'loading id ' . $id)
                    )
                );
            }
        }
        return $this->redirect($this->generateUrl('cta_admin_aishe_security_user_pending'));
    }

    /**
     * @param $action
     * @param $id
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function activateUserAction($action, $id)
    {
        if ($action == 'accept' || $action == 'decline') {
            $userManager = $this->get('fos_user.user_manager');
            /** @var User $user */
            $user = $userManager->findUserBy(array(
                'id'    => $id,
            ));

            if ($user) {
                if ($action == 'accept') {
                    // unlock user
                    $user->setLocked(false);
                    $user->setExpired(false);
                    $userManager->updateUser($user);

                    $mailTemplate = 'CtaAdminAisheBundle:Mails:Fos/Registration/accept.html.twig';
                } else {
                    // unlock user, but expire the credentials
                    $user->setLocked(false);
                    $user->setExpired(true);
                    $userManager->updateUser($user);

                    $mailTemplate = 'CtaAdminAisheBundle:Mails:Fos/Registration/reject.html.twig';
                }

                // send user the email with the result of the review
                $message = $this->get('devart.mail')
                    ->getMessage($mailTemplate, ['user' => $user])
                    ->addTo($user->getEmail());

                $this->get('mailer')
                    ->send($message);

                $this->addFlash(
                    'notice',
                    $this->get('translator')->trans(
                        'form.flash.notice',
                        array('%subject%' => $user->getUsername())
                    )
                );
            } else {
                $this->addFlash(
                    'error',
                    $this->get('translator')->trans(
                        'form.flash.error',
                        array('%subject%' => 'loading id ' . $id)
                    )
                );
            }
        }

        return $this->redirect($this->generateUrl('cta_admin_aishe_security_user_pending'));
    }
}