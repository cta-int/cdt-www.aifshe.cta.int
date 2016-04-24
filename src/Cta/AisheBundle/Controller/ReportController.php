<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 8/27/13
 * Time: 9:17 AM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\AisheBundle\Controller;

use Cta\AisheBundle\Entity\Chart;
use Cta\AisheBundle\Model\Criteria;
use Doctrine\ORM\EntityNotFoundException;
use Doctrine\ORM\EntityRepository;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Config\Definition\Exception\Exception;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use Cta\AisheBundle\Entity\Report as ReportEntity;
use Cta\AisheBundle\Entity\ReportItem;
use Cta\AisheBundle\Model\Data;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;

class ReportController extends Controller
{
    const ITEMS_PER_PAGE = 20;

    /**
     * @param $id
     * @param $action
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     * @throws \Doctrine\ORM\EntityNotFoundException
     * @throws \Symfony\Component\Security\Core\Exception\AccessDeniedException
     */
    public function changeStatusAction($id, $action)
    {
        $actions = array(
            'request'  => ReportEntity::ST_APPROVAL_REQUESTED,
            'approve'  => ReportEntity::ST_APPROVED,
            'deny'     => ReportEntity::ST_APPROVAL_DENIED,
        );

        if (array_key_exists($action, $actions)) {
            $em = $this->getDoctrine()->getManager();

            $report = $em->getRepository(ReportEntity::class)->findNotDeletedById($id);

            if (!$report) {
                throw new EntityNotFoundException();
            }

            if (false === $this->isGranted('ROLE_ADMIN')) {
                if (true === $this->isGranted('ROLE_AUDITOR')) {
                    if ($report->getCreatedBy() != $this->getUser() &&
                        $report->getInstitution() != $this->getUser()->getInstitution()) {
                        throw new AccessDeniedException('Auditor is not allowed to view this report');
                    }
                } else {
                    if (!in_array($this->getUser(), $report->getUsers()->toArray()) &&
                        $report->getCreatedBy() != $this->getUser()) {
                        throw new AccessDeniedException('User is not allowed to change status for this report');
                    }
                }
            }

            $report->setStatus($actions[$action]);
            $em->flush();

            $this->addFlash(
                'notice',
                $this->get('translator')->trans('report.status.changed')
            );
        }

        return $this->redirect($this->generateUrl('cta_aishe_report_view', array('id' => $id)));
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Symfony\Component\HttpFoundation\RedirectResponse|\Symfony\Component\HttpFoundation\Response
     * @throws \Symfony\Component\Security\Core\Exception\AccessDeniedException
     */
    public function dataAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();
        $report = $em->getRepository(ReportEntity::class)->findNotDeletedById($id);
        $newReport = false;
        if (!$report) {
            $report = new ReportEntity();
            $newReport = true;
        } else {
            if (false === $this->isGranted('ROLE_ADMIN')) {
                if (!in_array($this->getUser(), $report->getUsers()->toArray()) &&
                    $report->getCreatedBy() != $this->getUser()) {
                    throw new AccessDeniedException('User is not allowed to edit this report');
                }
            }
        }

        $form = $this->createForm('report', $report);
        $form->handleRequest($request);
        if ($form->isValid()) {
            if (!$report->getInstitution()) {
                $report->setInstitution($this->getUser()->getInstitution());
            }
            if (is_null($report->getIsOfficial())) {
                if ($this->isGranted('ROLE_AUDITOR')) {
                    $report->setIsOfficial(true);
                } else {
                    $report->setIsOfficial(false);
                }
            }
            $em->persist($report);

            if (!$report->getChartSettings()) {
                $chartRepository = new Chart();
                $chartRepository->setReport($report);
                $chartRepository->setModifiedAt(new \DateTime());
                $chartRepository->setModifiedBy($this->getUser());
                $chartRepository->setCreatedBy($this->getUser());
                $chartRepository->setType(Chart::TYPE_AREA);
                $chartRepository->setShowCriterion1(true);
                $chartRepository->setShowCriterion2(true);
                $chartRepository->setShowCriterion3(true);
                $chartRepository->setShowCriterion4(true);
                $chartRepository->setShowHighPriority(true);
                $chartRepository->setShowCurrentSituation(true);
                $chartRepository->setShowDesiredSituation(true);
                $em->persist($chartRepository);
            }

            $em->flush();

            $this->addFlash(
                'notice',
                $this->get('translator')->trans(
                    'form.flash.notice',
                    array('%subject%' => $report->getName())
                )
            );
            if($newReport && $this->isGranted('ROLE_AUDITOR')){
                $message = $this->get('devart.mail')->getMessage('CtaAisheBundle:Mails:Report/new.html.twig', array(
                    'user'     => $this->getUser(),
                    'reportId' => $report->getId(),
                ));

                $userManager = $this->get('fos_user.user_manager');
                $adminsGroup = $userManager->findOverviewByGroup('ADMIN');

                foreach($adminsGroup['items'] as $admin){
                    $message->addTo($admin->getEmail());
                }

                $this->get('mailer')->send($message);
            }
            return $this->redirect($this->generateUrl('cta_aishe_report_view', array('id' => $report->getId())));
        }

        return $this->render('CtaAisheBundle:Report:data.html.twig', array(
            'form' => $form->createView(),
            'report' => $report,
        ));
    }

    /**
     * @param $id
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     * @throws \Doctrine\ORM\EntityNotFoundException
     * @throws \Symfony\Component\Security\Core\Exception\AccessDeniedException
     */
    public function deleteAction($id)
    {
        $em = $this->getDoctrine()->getManager();
        $report = $em->getRepository(ReportEntity::class)->findNotDeletedById($id);

        if (!$report) {
            throw new EntityNotFoundException();
        }

        if (false === $this->isGranted('ROLE_ADMIN')) {
            if ($report->getCreatedBy() != $this->getUser()) {
                throw new AccessDeniedException('User is not allowed to delete this report');
            }
        }

        $em->getRepository(ReportEntity::class)->delete($id);

        $this->addFlash(
            'notice',
            $this->get('translator')->trans('report.deleted')
        );

        return $this->redirect($this->generateUrl('cta_aishe_report_overview'));
    }


    /**
     * @param Request $request
     * @param $id
     * @param $chapter
     * @param $paragraph
     * @return JsonResponse|\Symfony\Component\HttpFoundation\RedirectResponse|\Symfony\Component\HttpFoundation\Response
     * @throws \Symfony\Component\Config\Definition\Exception\Exception
     * @throws \Doctrine\ORM\EntityNotFoundException
     * @throws \Symfony\Component\Security\Core\Exception\AccessDeniedException
     */
    public function editAction(Request $request, $id, $chapter, $paragraph)
    {
        $em = $this->getDoctrine()->getManager();
        $report = $em->getRepository(ReportEntity::class)->findNotDeletedById($id);

        if (!$report) {
            throw new EntityNotFoundException();
        }

        if (false === $this->isGranted('ROLE_ADMIN')) {
            if (!in_array($this->getUser(), $report->getUsers()->toArray()) &&
                $report->getCreatedBy() != $this->getUser()) {
                throw new AccessDeniedException('User is not allowed to edit this report');
            }
        }

        $criteria = $em->getRepository('CtaAisheBundle:Criterion')->findOverview(Data::getLanguageCodes($request->getLocale()));
        $criterion = Criteria::getCurrentCriterion($criteria, $chapter, $paragraph);

        if (is_null($criterion)) {
            throw new Exception('Criterion not found.');
        }

        $reportItem = $em->getRepository('CtaAisheBundle:ReportItem')->findByReportAndCriterionItem((int)$id, $criterion['criterionItem']['id']);
        if (!$reportItem) {
            $reportItem = new ReportItem();
            $reportItem->setReport($report);
            $reportItem->setCriterionItem($em->getRepository('CtaAisheBundle:CriterionItem')->findById($criterion['criterionItem']['id']));
        }

        if ($request->isXmlHttpRequest()) {
            // Ajax request
            if ($formData = $request->request->get('formdata')) {
                foreach ($formData as $key => $value) {
                    if ($value == '') {
                        $value = null;
                    }

                    switch ($key) {
                        case 'startflag':
                            $reportItem->setCurrentSituationRating($value);
                            break;
                        case 'endflag':
                            $reportItem->setDesiredSituationRating($value);
                            break;
                        case 'priority':
                            $reportItem->setHasHighPriority($value);
                            break;
                    }
                }
                $em->persist($reportItem);

                $report->setModifiedAt(new \DateTime());
                $report->setModifiedBy($this->getUser());

                $em->flush();
            }

            $response['success'] = true;
            $return = new JsonResponse($response);
        } else {
            // Submit request
            $form = $this->createForm('reportItem', $reportItem);
            $form->handleRequest($request);
            if ($form->isValid()) {
                $em->persist($reportItem);

                $report->setModifiedAt(new \DateTime());
                $report->setModifiedBy($this->getUser());

                $em->flush();

                $this->addFlash(
                    'notice',
                    $this->get('translator')->trans(
                        'form.flash.notice',
                        array('%subject%' => "{$chapter}.{$paragraph}." . $criterion['criterionItem']['criterionItemTranslations'][0]['value'])
                    )
                );

                if ($form->get('saveAndNext')->isClicked()) {
                    $nextCriterion = Criteria::getParamsForNextCriterion($criteria, $id, $chapter, $paragraph);
                    return $this->redirect($this->generateUrl($nextCriterion['route'], $nextCriterion['params']));
                }
            }

            $return = $this->render('CtaAisheBundle:Report:edit.html.twig', array(
                'form' => $form->createView(),
                'report' => $report,
                'criteria' => $criteria,
                'currentCriterion' => $criterion,
            ));
        }

        return $return;
    }

    /**
     * @param $page
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function overviewAction($page)
    {
        $em = $this->getDoctrine()->getManager();

        $params = array(
            'user'      => $this->getUser(),
            'isAuditor' => $this->isGranted('ROLE_AUDITOR'),
            'isAdmin'   => $this->isGranted('ROLE_ADMIN'),
            'start'     => ($page - 1) * self::ITEMS_PER_PAGE,
            'limit'     => self::ITEMS_PER_PAGE,
        );

        $reports = $em->getRepository(ReportEntity::class)->findOverview($params);

        if ($page > 1 && $reports['count'] < 1) {
            return $this->redirect($this->generateUrl('cta_aishe_report_overview'));
        }

        return $this->render('CtaAisheBundle:Report:overview.html.twig', array(
            'reports'   => $reports['items'],
            'page'      => $page,
            'lastPage'  => ceil($reports['count'] / self::ITEMS_PER_PAGE),
        ));
    }

    /**
     * @param Request $request
     * @param         $id
     * @param         $print
     *
     * @return \Symfony\Component\HttpFoundation\Response
     * @throws EntityNotFoundException
     */
    public function showAction(Request $request, $id, $print)
    {
        $em = $this->getDoctrine()->getManager();
        $report = $em->getRepository(ReportEntity::class)->findForShow($id, Data::getLanguageCodes($request->getLocale()));

        if (!$report) {
            throw new EntityNotFoundException();
        }

        if (false === $this->isGranted('ROLE_ADMIN')) {
            if (true === $this->isGranted('ROLE_AUDITOR')) {
                if ($report['createdBy']['id'] != $this->getUser()->getId() &&
                    $report['institution']['id'] != $this->getUser()->getInstitution()->getId()) {
                    throw new AccessDeniedException('Auditor is not allowed to view this report');
                }
            } else {
                if ($report['createdBy']['id'] != $this->getUser()->getId()) {
                    $specialAccess = false;
                    foreach ($report['users'] as $privilegedUser) {
                        if ($privilegedUser['id'] ==  $this->getUser()->getId()) {
                            $specialAccess = true;
                        }
                    }
                    if (!$specialAccess) {
                        throw new AccessDeniedException('User is not allowed to view this report');
                    }
                }
            }
        }

        return $this->render('CtaAisheBundle:Report:show.html.twig', array(
            'report' => $report,
            'criteria' => $em->getRepository('CtaAisheBundle:Criterion')->findOverview(Data::getLanguageCodes($request->getLocale())),
            'info' => $em->getRepository('CtaAisheBundle:Page')->findByIdentifier('report_info', Data::getLanguageCodes($request->getLocale())),
            'generalData' => Data::getGeneralData($report, $em->getRepository('CtaAisheBundle:Certification')->findForShow()),
            'print' => $print,
        ));
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Symfony\Component\HttpFoundation\Response
     * @throws \Doctrine\ORM\EntityNotFoundException
     * @throws \Symfony\Component\Security\Core\Exception\AccessDeniedException
     */
    public function usersAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();
        $report = $em->getRepository(ReportEntity::class)->findNotDeletedById($id);

        if (!$report) {
            throw new EntityNotFoundException();
        }

        if (false === $this->isGranted('ROLE_ADMIN')) {
            if ($report->getCreatedBy() != $this->getUser()) {
                throw new AccessDeniedException('User is not allowed to edit this report');
            }
        }


        $userId = $this->getUser()->getId(); // needed for anonymous function
        $form = $this->createFormBuilder($report)
            ->add('users', 'entity', array(
                'class' => 'CtaAisheBundle:User',
                'query_builder' => function(EntityRepository $er) use ($userId) {
                        return $er->createQueryBuilder('u')
                            ->join('u.groups', 'g')
                            ->andWhere('u.id != :id')
                            ->andWhere('g.name = :auditor OR g.name = :user')
                            ->setParameter('id', $userId)
                            ->setParameter('auditor', 'AUDITOR')
                            ->setParameter('user', 'USER')
                            ->orderBy('u.username', 'ASC');
                    },
                'property'  => 'username',
                'required'  => false,
                'multiple'  => true,
                'label'     => 'report.allowedUsers',
            ))
            ->add('save', 'submit', array('label' => 'form.save'))
            ->getForm();

        $form->handleRequest($request);
        if ($form->isValid()) {
            $em->flush();

            $this->addFlash(
                'notice',
                $this->get('translator')->trans(
                    'form.flash.notice',
                    array('%subject%' => $report->getName())
                )
            );

            return $this->redirect($this->generateUrl('cta_aishe_report_users', array('id' => $report->getId())));
        }

        return $this->render('CtaAisheBundle:Report:users.html.twig', array(
            'form' => $form->createView(),
            'report' => $report,
        ));
    }

    /**
     * @param Request $request
     * @param         $id
     *
     * @return \Symfony\Component\HttpFoundation\Response
     * @throws EntityNotFoundException
     */
    public function viewAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();
        $report = $em->getRepository(ReportEntity::class)->findNotDeletedById($id);

        if (!$report) {
            throw new EntityNotFoundException();
        }

        if (false === $this->isGranted('ROLE_ADMIN')) {
            if (true === $this->isGranted('ROLE_AUDITOR')) {
                if ($report->getCreatedBy() != $this->getUser() &&
                    $report->getInstitution() != $this->getUser()->getInstitution()) {
                    throw new AccessDeniedException('Auditor is not allowed to view this report');
                }
            } else {
                if (!in_array($this->getUser(), $report->getUsers()->toArray()) &&
                    $report->getCreatedBy() != $this->getUser()) {
                    throw new AccessDeniedException('User is not allowed to view this report');
                }
            }
        }

        return $this->render('CtaAisheBundle:Report:view.html.twig', array(
            'report' => $report,
            'criteria' => $em->getRepository('CtaAisheBundle:Criterion')->findOverview(Data::getLanguageCodes($request->getLocale())),
        ));
    }

}