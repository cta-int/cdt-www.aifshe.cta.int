<?php

namespace Cta\AisheBundle\Controller;

use Cta\AisheBundle\Entity\ReportItem;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Cta\AisheBundle\Model\Data;
use Cta\AisheBundle\Entity\Chart;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;


class ChartController extends Controller
{
    public function indexAction($id)
    {
        $em = $this->getDoctrine()->getManager();
        $report = $em->getRepository('CtaAisheBundle:Report')->findNotDeletedById($id);

        if (!$report) {
            throw new EntityNotFoundException();
        }

        if (false === $this->get('security.context')->isGranted('ROLE_ADMIN')) {
            if (!in_array($this->get('security.context')->getToken()->getUser(), $report->getUsers()->toArray()) &&
                $report->getCreatedBy() != $this->get('security.context')->getToken()->getUser()) {
                throw new AccessDeniedException('User is not allowed to view this report');
            }
        }

        $certifications = $em->getRepository('CtaAisheBundle:Certification')->findForShow(Data::getLanguageCodes($this->getRequest()->getLocale()));
        $chartRepository = $em->getRepository('CtaAisheBundle:Chart')->findOneByReport($id);

        $chart = $this->container->get('cta.aishe.service.Chart');

        $chart->setSpiderChart($id, Data::getLanguageCodes($this->getRequest()->getLocale()), $this->get('translator'));
        $charts['spider'] = json_encode($chart->getChart());

        $chart->setInvertedAxisChart($id, Data::getLanguageCodes($this->getRequest()->getLocale()), $this->get('translator'));
        $charts['invertedAxis'] = json_encode($chart->getChart());

        $hiddenSeries = array();
        foreach ($certifications as $certification) {
            $getShowCriterion = sprintf("getShowCriterion%s", $certification['id']);
            if (method_exists($chartRepository, $getShowCriterion)) {
                if ($chartRepository->$getShowCriterion() == 0) {
                    $hiddenSeries[] = $this->get('translator')->trans($certification['name']);
                }
            }
        }
        if ($chartRepository->getShowCurrentSituation() == 0) {
            $hiddenSeries[] = $this->get('translator')->trans('report.item.currentSituation');
        }
        if ($chartRepository->getShowDesiredSituation() == 0) {
            $hiddenSeries[] = $this->get('translator')->trans('report.item.desiredSituation');
        }
        if ($chartRepository->getShowHighPriority() == 0) {
            $hiddenSeries[] = $this->get('translator')->trans('report.item.hasHighPriority');
        }

        return $this->render('CtaAisheBundle:Chart:index.html.twig', array(
//            'report' => $em->getRepository('CtaAisheBundle:Report')->findById($id),
            'hiddenSeries' => json_encode($hiddenSeries),
            'report' => $report,
            'charts' => $charts, // this array is now filled with json data so we can use that data to build our chart
            'chartSettings' => $chartRepository,
        ));
    }

    public function getHiddenSeriesAction($id)
    {
        $em = $this->getDoctrine()->getManager();
        $report = $em->getRepository('CtaAisheBundle:Report')->findNotDeletedById($id);

        if (!$report) {
            throw new EntityNotFoundException();
        }

        if (false === $this->get('security.context')->isGranted('ROLE_ADMIN')) {
            if (!in_array($this->get('security.context')->getToken()->getUser(), $report->getUsers()->toArray()) &&
                $report->getCreatedBy() != $this->get('security.context')->getToken()->getUser()) {
                throw new AccessDeniedException('User is not allowed to view this report');
            }
        }

//        $certifications = $em->getRepository('CtaAisheBundle:Certification')->findForShow(Data::getLanguageCodes($this->getRequest()->getLocale()));
        $chartRepository = $em->getRepository('CtaAisheBundle:Chart')->findOneByReport($id);

        $hiddenSeries = array();
//        foreach ($certifications as $certification) {
//            $getShowCriterion = sprintf("getShowCriterion%s", $certification['id']);
//            if (method_exists($chartRepository, $getShowCriterion)) {
//                if ($chartRepository->$getShowCriterion() == 0) {
//                    $hiddenSeries[] = $this->get('translator')->trans($certification['name']);
//                }
//            }
//        }
        if ($chartRepository->getShowCurrentSituation() == 0) {
            $hiddenSeries[] = $this->get('translator')->trans('report.item.currentSituation');
        }
        if ($chartRepository->getShowDesiredSituation() == 0) {
            $hiddenSeries[] = $this->get('translator')->trans('report.item.desiredSituation');
        }
        if ($chartRepository->getShowHighPriority() == 0) {
            $hiddenSeries[] = $this->get('translator')->trans('report.item.hasHighPriority');
        }

        $response = json_encode($hiddenSeries);
        return new Response($response, 200, array('Content-Type' => 'application/json'));
    }

    public function toggleChartTypeAction($id)
    {
        $em = $this->getDoctrine()->getManager();
        $report = $em->getRepository('CtaAisheBundle:Report')->findNotDeletedById($id);

        if (!$report) {
            throw new EntityNotFoundException();
        }

        if (false === $this->get('security.context')->isGranted('ROLE_ADMIN')) {
            if (!in_array($this->get('security.context')->getToken()->getUser(), $report->getUsers()->toArray()) &&
                $report->getCreatedBy() != $this->get('security.context')->getToken()->getUser()) {
                throw new AccessDeniedException('User is not allowed to view this report');
            }
        }

        //$certifications = $em->getRepository('CtaAisheBundle:Certification')->findForShow(Data::getLanguageCodes($this->getRequest()->getLocale()));
        $chartRepository = $em->getRepository('CtaAisheBundle:Chart')->findOneByReport($id);

        $type = $this->get('request')->request->get('type');

        $chartRepository->setType($type);

        $em->persist($chartRepository);
        $chartRepository->setModifiedAt(new \DateTime());
        $chartRepository->setModifiedBy($this->container->get('security.context')->getToken()->getUser());
        $em->flush();

        $response = json_encode(array());
        return new Response($response, 200, array('Content-Type' => 'application/json'));
    }

    public function toggleLegendItemAction($id)
    {
        $em = $this->getDoctrine()->getManager();
        $report = $em->getRepository('CtaAisheBundle:Report')->findNotDeletedById($id);

        if (!$report) {
            throw new EntityNotFoundException();
        }

        if (false === $this->get('security.context')->isGranted('ROLE_ADMIN')) {
            if (!in_array($this->get('security.context')->getToken()->getUser(), $report->getUsers()->toArray()) &&
                $report->getCreatedBy() != $this->get('security.context')->getToken()->getUser()) {
                throw new AccessDeniedException('User is not allowed to view this report');
            }
        }

        $certifications = $em->getRepository('CtaAisheBundle:Certification')->findForShow(Data::getLanguageCodes($this->getRequest()->getLocale()));
        $chartRepository = $em->getRepository('CtaAisheBundle:Chart')->findOneByReport($id);

        $name = $this->get('request')->request->get('name');
        $translator = $this->get('translator');

        switch ($name) {
            case $translator->trans('report.item.currentSituation'):
                $this->_toggleLegendItem($chartRepository, 'getShowCurrentSituation', 'setShowCurrentSituation');
                break;
            case $translator->trans('report.item.desiredSituation'):
                $this->_toggleLegendItem($chartRepository, 'getShowDesiredSituation', 'setShowDesiredSituation');
                break;
            case $translator->trans('report.item.hasHighPriority'):
                $this->_toggleLegendItem($chartRepository, 'getShowHighPriority', 'setShowHighPriority');
                break;
            default:
                foreach ($certifications as $certification) {
                    if ($this->get('request')->request->get('name') === $this->get('translator')->trans($certification['name'])) {
                        $getShowCriterion = sprintf("getShowCriterion%s", $certification['id']);
                        $setShowCriterion = sprintf("setShowCriterion%s", $certification['id']);
                        if (method_exists($chartRepository, $getShowCriterion)) {
                            switch ($chartRepository->$getShowCriterion()) {
                                case 0:
                                    if (method_exists($chartRepository, $setShowCriterion)) {
                                        $chartRepository->$setShowCriterion(1);
                                    }
                                    break;
                                case 1:
                                    if (method_exists($chartRepository, $setShowCriterion)) {
                                        $chartRepository->$setShowCriterion(0);
                                    }
                                    break;
                            }
                        }
                    }
                }
        }

        $response = json_encode(array());
        return new Response($response, 200, array('Content-Type' => 'application/json'));
    }

    private function _toggleLegendItem($chartRepository, $get, $set)
    {
        $em = $this->getDoctrine()->getManager();
        if (method_exists($chartRepository, $get)) {
            switch ($chartRepository->$get()) {
                case 0:
                    if (method_exists($chartRepository, $set)) {
                        $chartRepository->$set(1);
                    }
                    break;
                case 1:
                    if (method_exists($chartRepository, $set)) {
                        $chartRepository->$set(0);
                    }
                    break;
            }
        }

        $em->persist($chartRepository);
        $chartRepository->setModifiedAt(new \DateTime());
        $chartRepository->setModifiedBy($this->container->get('security.context')->getToken()->getUser());
        $em->flush();
    }
}