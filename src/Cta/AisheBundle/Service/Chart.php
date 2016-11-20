<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 9/6/13
 * Time: 11:36 AM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\AisheBundle\Service;

use Doctrine\ORM\EntityManager;
use Symfony\Component\Translation\Translator;

class Chart
{
    public $chart = array();

    /**
     * @param EntityManager $em
     */
    public function __construct(EntityManager $em)
    {
        $this->_em = $em;
    }

    public function setInvertedAxisChart($id, $language, Translator $translator)
    {
        $em = $this->_em;
        $report = $em->getRepository('CtaAisheBundle:Report')->findNotDeletedById($id);
        $criterion = $em->getRepository('CtaAisheBundle:Criterion')->findOverview($language);

        /**
         * Build current/desired situation series arrays
         */
        $chartPriorityData = array();
        $chartCurrentSituationRatingData = array();
        $chartDesiredSituationRatingData = array();
        $i = 0;
        foreach ($report->getReportItems() as $reportItem) {
            if ($reportItem->getHasHighPriority()) {
                $chartPriorityData[$i] = 0;
            } else {
                $chartPriorityData[] = array(
                    'marker' => array(
                        'enabled' => 0
                    )
                );
            }
            $chartCurrentSituationRatingData[] = floatval($reportItem->getCurrentSituationRating());
            $chartDesiredSituationRatingData[] = floatval($reportItem->getDesiredSituationRating());
            $i++;
        }
        unset($i);

        $chart = \Cta\AisheBundle\Model\Chart::invertedAxisChart();
        $chart['chart']['renderTo'] = 'lineChart';
        $chart['yAxis']['title'] = '';

        $i = 0;
        foreach ($criterion as $criteria) {
            foreach ($criteria['criterionItems'] as $criterionItem) {
                if (array_key_exists($i, $chartPriorityData)) {
                    if ($chartPriorityData[$i] === 1) {
                        $chart['xAxis']['categories'][] = sprintf('<img src="/bundles/ctaaishe/img/priority.png"/> %s.%s', $criteria['chapterNr'], $criterionItem['paragraphNr']);
                    } else {
                        $chart['xAxis']['categories'][] = sprintf('%s.%s', $criteria['chapterNr'], $criterionItem['paragraphNr']);
                    }
                }
                $i++;
            }
        }
        unset($i);

        /**
         * Build series
         */
        $chart['series'] = array(
            array(
                'name' => $translator->trans('report.item.currentSituation'),
                'color' => '#e74739',
                'data' => $chartCurrentSituationRatingData,
                'fillOpacity' => 0,
                'marker' => array(
                    'symbol' => 'circle',
                    'radius' => 8
                ),
                'pointPlacement' => 'on'
            ),
            array(
                'name' => $translator->trans('report.item.desiredSituation'),
                'color' => '#52859e',
                'data' => $chartDesiredSituationRatingData,
                'fillOpacity' => 0,
                'marker' => array(
                    'symbol' => 'circle',
                    'radius' => 8
                ),
                'pointPlacement' => 'on'
            ),
            array(
                'name' => $translator->trans('report.item.hasHighPriority'),
                'data' => $chartPriorityData,
                'lineWidth' => 0,
                'fillOpacity' => 0,
                'marker' => array(
                    'symbol' => sprintf('url(%s)', '/bundles/ctaaishe/img/priority-90.png')
                ),
            )
        );

        $this->chart = $chart;
    }


    public function setSpiderChart($id, $language, Translator $translator)
    {
        $em = $this->_em;
        $report = $em->getRepository('CtaAisheBundle:Report')->findNotDeletedById($id);
        $criterion = $em->getRepository('CtaAisheBundle:Criterion')->findOverview($language);

        /**
         * Build current/desired situation series arrays
         */
        $chartPriorityData = array();
        $chartCurrentSituationRatingData = array();
        $chartDesiredSituationRatingData = array();
        foreach ($report->getReportItems() as $reportItem) {
            if ($reportItem->getHasHighPriority()) {
                $chartPriorityData[] = 5.6;
            } else {
                $chartPriorityData[] = array(
                    'marker' => array(
                        'enabled' => 0
                    )
                );
            }
            $chartCurrentSituationRatingData[] = floatval($reportItem->getCurrentSituationRating());
            $chartDesiredSituationRatingData[] = floatval($reportItem->getDesiredSituationRating());
        }

        $chart = \Cta\AisheBundle\Model\Chart::spider();
        $chart['chart']['renderTo'] = 'radialChart';

        /**
         * Build xAxis array for our radialChart
         */
        foreach ($criterion as $criteria) {
            foreach ($criteria['criterionItems'] as $criterionItem) {
                $chart['xAxis']['categories'][] = sprintf("%s.%s", $criteria['chapterNr'], $criterionItem['paragraphNr']);
            }
        }

        /**
         * Build series
         */
        $chart['series'] = array(
            array(
                'name' => $translator->trans('report.item.currentSituation'),
                'color' => '#e74739',
                'data' => $chartCurrentSituationRatingData,
                'marker' => array(
                    'symbol' => 'circle',
                    'radius' => 8
                ),
                'pointPlacement' => 'on'
            ),
            array(
                'name' => $translator->trans('report.item.desiredSituation'),
                'color' => '#52859e',
                'data' => $chartDesiredSituationRatingData,
                'marker' => array(
                    'symbol' => 'circle',
                    'radius' => 8
                ),
                'pointPlacement' => 'on'
            ),
            array(
                'name' => $translator->trans('report.item.hasHighPriority'),
                'data' => $chartPriorityData,
                'lineWidth' => 0,
                'marker' => array(
                    'symbol' => sprintf('url(%s)', '/bundles/ctaaishe/img/priority.png')
                )
            )
        );

        unset($i);

        $this->chart = $chart;
    }

    public function getChart()
    {
        return $this->chart;
    }
}