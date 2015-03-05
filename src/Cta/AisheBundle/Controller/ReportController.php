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
use Cta\AisheBundle\Model\Indicators;
use Doctrine\ORM\EntityNotFoundException;
use Doctrine\ORM\EntityRepository;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Config\Definition\Exception\Exception;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use Cta\AisheBundle\Entity\Report;
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
            'request'  => Report::ST_APPROVAL_REQUESTED,
            'approve'  => Report::ST_APPROVED,
            'deny'     => Report::ST_APPROVAL_DENIED,
        );

        if (array_key_exists($action, $actions)) {
            $em = $this->getDoctrine()->getManager();

            $report = $em->getRepository('CtaAisheBundle:Report')->findNotDeletedById($id);

            if (!$report) {
                throw new EntityNotFoundException();
            }

            if (false === $this->get('security.context')->isGranted('ROLE_ADMIN')) {
                if (true === $this->get('security.context')->isGranted('ROLE_AUDITOR')) {
                    if ($report->getCreatedBy() != $this->get('security.context')->getToken()->getUser() &&
                        $report->getInstitution() != $this->get('security.context')->getToken()->getUser()->getInstitution()) {
                        throw new AccessDeniedException('Auditor is not allowed to view this report');
                    }
                } else {
                    if (!in_array($this->get('security.context')->getToken()->getUser(), $report->getUsers()->toArray()) &&
                        $report->getCreatedBy() != $this->get('security.context')->getToken()->getUser()) {
                        throw new AccessDeniedException('User is not allowed to change status for this report');
                    }
                }
            }

            $report->setStatus($actions[$action]);
            $em->flush();

            $this->get('session')->getFlashBag()->add(
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
        $report = $em->getRepository('CtaAisheBundle:Report')->findNotDeletedById($id);
        $newReport = false;
        if (!$report) {
            $report = new Report();
            $newReport = true;
        } else {
            if (false === $this->get('security.context')->isGranted('ROLE_ADMIN')) {
                if (!in_array($this->get('security.context')->getToken()->getUser(), $report->getUsers()->toArray()) &&
                    $report->getCreatedBy() != $this->get('security.context')->getToken()->getUser()) {
                    throw new AccessDeniedException('User is not allowed to edit this report');
                }
            }
        }

        $form = $this->createForm('report', $report);
        $form->handleRequest($request);
        if ($form->isValid()) {
            if (!$report->getInstitution()) {
                $report->setInstitution($this->container->get('security.context')->getToken()->getUser()->getInstitution());
            }
            if (is_null($report->getIsOfficial())) {
                if (false !== $this->get('security.context')->isGranted('ROLE_AUDITOR')) {
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
                $chartRepository->setModifiedBy($this->container->get('security.context')->getToken()->getUser());
                $chartRepository->setCreatedBy($this->container->get('security.context')->getToken()->getUser());
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

            $this->get('session')->getFlashBag()->add(
                'notice',
                $this->get('translator')->trans(
                    'form.flash.notice',
                    array('%subject%' => $report->getName())
                )
            );
            if($newReport && $this->get('security.context')->isGranted('ROLE_AUDITOR')){
                $message = $this->get('devart.mail')->getMessage('CtaAisheBundle:Mails:Report/new.html.twig', array(
                    'user' => $this->get('security.context')->getToken()->getUser()
                ));

                $userManager = $this->container->get('fos_user.user_manager');
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
        $report = $em->getRepository('CtaAisheBundle:Report')->findNotDeletedById($id);

        if (!$report) {
            throw new EntityNotFoundException();
        }

        if (false === $this->get('security.context')->isGranted('ROLE_ADMIN')) {
            if ($report->getCreatedBy() != $this->get('security.context')->getToken()->getUser()) {
                throw new AccessDeniedException('User is not allowed to delete this report');
            }
        }

        $em->getRepository('CtaAisheBundle:Report')->delete($id);

        $this->get('session')->getFlashBag()->add(
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
        $report = $em->getRepository('CtaAisheBundle:Report')->findNotDeletedById($id);

        if (!$report) {
            throw new EntityNotFoundException();
        }

        if (false === $this->get('security.context')->isGranted('ROLE_ADMIN')) {
            if (!in_array($this->get('security.context')->getToken()->getUser(), $report->getUsers()->toArray()) &&
                $report->getCreatedBy() != $this->get('security.context')->getToken()->getUser()) {
                throw new AccessDeniedException('User is not allowed to edit this report');
            }
        }

        $criteria = $em->getRepository('CtaAisheBundle:Criterion')->findOverview(Data::getLanguageCodes($this->getRequest()->getLocale()));
        $criterion = \Cta\AisheBundle\Model\Criteria::getCurrentCriterion($criteria, $chapter, $paragraph);

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
                $report->setModifiedBy($this->container->get('security.context')->getToken()->getUser());

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
                $report->setModifiedBy($this->container->get('security.context')->getToken()->getUser());

                $em->flush();

                $this->get('session')->getFlashBag()->add(
                    'notice',
                    $this->get('translator')->trans(
                        'form.flash.notice',
                        array('%subject%' => "{$chapter}.{$paragraph}." . $criterion['criterionItem']['criterionItemTranslations'][0]['value'])
                    )
                );

                if ($form->get('saveAndNext')->isClicked()) {
                    $nextCriterion = \Cta\AisheBundle\Model\Criteria::getParamsForNextCriterion($criteria, $id, $chapter, $paragraph);
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

        if (false !== $this->get('security.context')->isGranted('ROLE_ADMIN')) {
            $params = array();
        } else {
            $params = array(
                'user'      => $this->container->get('security.context')->getToken()->getUser(),
                'isAuditor' => (false !== $this->get('security.context')->isGranted('ROLE_AUDITOR')),
            );
        }

        $params['start']    = ($page - 1) * self::ITEMS_PER_PAGE;
        $params['limit']    = self::ITEMS_PER_PAGE;

        $reports = $em->getRepository('CtaAisheBundle:Report')->findOverview($params);

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
     * @param $id
     * @param $print
     * @return \Symfony\Component\HttpFoundation\Response
     * @throws \Doctrine\ORM\EntityNotFoundException
     * @throws \Symfony\Component\Security\Core\Exception\AccessDeniedException
     */
    public function showAction($id, $print)
    {
        $em = $this->getDoctrine()->getManager();
        $report = $em->getRepository('CtaAisheBundle:Report')->findForShow($id, Data::getLanguageCodes($this->getRequest()->getLocale()));
        //$chartRepository = $em->getRepository('CtaAisheBundle:Chart')->findOneByReport($id);

        if (!$report) {
            throw new EntityNotFoundException();
        }

        if (false === $this->get('security.context')->isGranted('ROLE_ADMIN')) {
            if (true === $this->get('security.context')->isGranted('ROLE_AUDITOR')) {
                if ($report['createdBy']['id'] != $this->get('security.context')->getToken()->getUser()->getId() &&
                    $report['institution']['id'] != $this->get('security.context')->getToken()->getUser()->getInstitution()->getId()) {
                    throw new AccessDeniedException('Auditor is not allowed to view this report');
                }
            } else {
                if ($report['createdBy']['id'] != $this->get('security.context')->getToken()->getUser()->getId()) {
                    $specialAccess = false;
                    foreach ($report['users'] as $privilegedUser) {
                        if ($privilegedUser['id'] ==  $this->get('security.context')->getToken()->getUser()->getId()) {
                            $specialAccess = true;
                        }
                    }
                    if (!$specialAccess) {
                        throw new AccessDeniedException('User is not allowed to view this report');
                    }
                }
            }
        }
//
//        $chart = $this->container->get('cta.aishe.service.Chart');
//        switch ($chartRepository->getType()) {
//            case \Cta\AisheBundle\Entity\Chart::TYPE_SPIDER:
//                $chart->setSpiderChart($id, Data::getLanguageCodes($this->getRequest()->getLocale()), $this->get('translator'));
//                break;
//            case \CTA\AisheBundle\Entity\Chart::TYPE_AREA:
//                $chart->setInvertedAxisChart($id, Data::getLanguageCodes($this->getRequest()->getLocale()), $this->get('translator'));
//                break;
//            default:
//                $chart->setInvertedAxisChart($id, Data::getLanguageCodes($this->getRequest()->getLocale()), $this->get('translator'));
//        }
//        $series = $chart->chart['series'];
//        foreach ($series as $key => $serie) {
//            if ($serie['name'] === $this->get('translator')->trans('report.item.currentSituation')) {
//                if (!$chartRepository->getShowCurrentSituation()) {
//                    unset($series[$key]);
//                }
//            }
//            if ($serie['name'] === $this->get('translator')->trans('report.item.desiredSituation')) {
//                if (!$chartRepository->getShowDesiredSituation()) {
//                    unset($series[$key]);
//                }
//            }
//            if ($serie['name'] === $this->get('translator')->trans('report.item.hasHighPriority')) {
//                if (!$chartRepository->getShowHighPriority()) {
//                    unset($series[$key]);
//                }
//            }
//        }
//        $chart->chart['series'] = array_values($series);
//        unset($series);

        return $this->render('CtaAisheBundle:Report:show.html.twig', array(
            'report' => $report,
//            'disableChart' => (count($chart->chart['series']) ? false : true),
//            'chart' => json_encode($chart->getChart()),
//            'chartSettings' => $chartRepository,
            'criteria' => $em->getRepository('CtaAisheBundle:Criterion')->findOverview(Data::getLanguageCodes($this->getRequest()->getLocale())),
            'info' => $em->getRepository('CtaAisheBundle:Page')->findByIdentifier('report_info', Data::getLanguageCodes($this->getRequest()->getLocale())),
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
        $report = $em->getRepository('CtaAisheBundle:Report')->findNotDeletedById($id);

        if (!$report) {
            throw new EntityNotFoundException();
        }

        if (false === $this->get('security.context')->isGranted('ROLE_ADMIN')) {
            if ($report->getCreatedBy() != $this->get('security.context')->getToken()->getUser()) {
                throw new AccessDeniedException('User is not allowed to edit this report');
            }
        }


        $userId = $this->get('security.context')->getToken()->getUser()->getId(); // needed for anonymous function
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

            $this->get('session')->getFlashBag()->add(
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
     * @param $id
     * @return \Symfony\Component\HttpFoundation\Response
     * @throws \Doctrine\ORM\EntityNotFoundException
     * @throws \Symfony\Component\Security\Core\Exception\AccessDeniedException
     */
    public function viewAction($id)
    {
        $em = $this->getDoctrine()->getManager();
        $report = $em->getRepository('CtaAisheBundle:Report')->findNotDeletedById($id);

        if (!$report) {
            throw new EntityNotFoundException();
        }

        if (false === $this->get('security.context')->isGranted('ROLE_ADMIN')) {
            if (true === $this->get('security.context')->isGranted('ROLE_AUDITOR')) {
                if ($report->getCreatedBy() != $this->get('security.context')->getToken()->getUser() &&
                    $report->getInstitution() != $this->get('security.context')->getToken()->getUser()->getInstitution()) {
                    throw new AccessDeniedException('Auditor is not allowed to view this report');
                }
            } else {
                if (!in_array($this->get('security.context')->getToken()->getUser(), $report->getUsers()->toArray()) &&
                    $report->getCreatedBy() != $this->get('security.context')->getToken()->getUser()) {
                    throw new AccessDeniedException('User is not allowed to view this report');
                }
            }
        }

        return $this->render('CtaAisheBundle:Report:view.html.twig', array(
            'report' => $report,
            'criteria' => $em->getRepository('CtaAisheBundle:Criterion')->findOverview(Data::getLanguageCodes($this->getRequest()->getLocale())),
        ));
    }

}