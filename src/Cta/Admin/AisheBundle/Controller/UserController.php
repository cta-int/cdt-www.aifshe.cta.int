<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 9/9/13
 * Time: 8:46 AM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\Admin\AisheBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;

class UserController extends Controller
{
    const ITEMS_PER_PAGE = 20;

    /**
     * @return \Symfony\Component\HttpFoundation\Response
     */
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

        $userManager = $this->container->get('fos_user.user_manager');
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
        $userManager    = $this->container->get('fos_user.user_manager');
        $user           = $userManager->findUserBy(array('id' => $id));

        if (!$user) {
            $user = $userManager->createUser();
            $user->setRequestAuditor(false);
        }

        $form = $this->createForm('user', $user);
        $form->handleRequest($request);
        if ($form->isValid()) {
            $userManager->updateUser($user);

            $this->get('session')->getFlashBag()->add(
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
        $userManager = $this->container->get('fos_user.user_manager');
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
     * @param $action
     * @param $id
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function activatePendingAuditorAction($action, $id)
    {
        if ($action == 'accept' || $action == 'decline') {
            $userManager = $this->container->get('fos_user.user_manager');
            $user = $userManager->findUserBy(array(
                'id'    => $id,
            ));

            if ($user) {
                if ($action == 'accept') {
                    // add auditing group to this user
                    $groupManager = $this->container->get('fos_user.group_manager');
                    $auditorGroup = $groupManager->findGroupByName('AUDITOR');
                    if ($auditorGroup) {
                        $user->addGroup($auditorGroup);

                        foreach ($user->getReports() as $report) {
                            $report->setIsOfficial(true);
                        }
                    }

                    $message = $this->get('devart.mail')->getMessage('CtaAdminAisheBundle:Mails:FOS/Registration/Auditor/accept.html.twig', array(
                        'user' => $user
                    ));

                    $message->addTo($user->getEmail());

                    $this->get('mailer')->send($message);
                }

                // permissions have been granted or denied; The user request has been handled
                $user->setRequestAuditor(false);
                $userManager->updateUser($user);


                $this->get('session')->getFlashBag()->add(
                    'notice',
                    $this->get('translator')->trans(
                        'form.flash.notice',
                        array('%subject%' => $user->getUsername())
                    )
                );
            } else {
                $this->get('session')->getFlashBag()->add(
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