<?php

namespace Cta\AisheBundle\Model;

class Chart
{
    /**
     * @return array
     */
    public static function spider()
    {
        return array(
            'chart' => array(
                'marginTop' => 80,
                'ignoreHiddenSeries' => 0,
                'height' => 990,
                'width' => 990,
                'animation' => 0,
                'polar' => 1,
                'type' => 'line'
            ),
            'exporting' => array(
                'enabled' => 0
            ),
            'title' => array(
                'text' => ''
            ),
            'pane' => array(
                'size' => '90%',
                'startAngle' => 0,
                'endAngle' => 360
            ),
            'plotOptions' => array(
                'series' => array(
                    'animation' => 0
                ),
            ),
            'xAxis' => array(
                'categories' => array(),
                'tickmarkPlacement' => 'on',
                'lineWidth' => 0
            ),
            'yAxis' => array(
                'gridLineInterpolation' => 'polygon',
                'lineWidth' => 0,
                'min' => 0 - 1,
                'max' => 5,
                'offset' => 6
            ),
            'tooltip' => array(
                'enabled' => 0,
            ),
            'legend' => array(
                'padding' => 16,
                'margin' => 50,
                'layout' => 'horizontal'
            ),
            'series' => array(),
            'credits' => array(
                'enabled' => 0
            )
        );
    }

    public static function invertedAxisChart()
    {
        return array(
            'chart' => array(
                'marginTop' => 30,
                'ignoreHiddenSeries' => 0,
                'animation' => 0,
                'height' => 990,
                'width' => 990,
                'inverted' => 1,
                'type' => 'area'
            ),
            'exporting' => array(
                'enabled' => 0
            ),
            'title' => array(
                'text' => ''
            ),
            'xAxis' => array(
                'categories' => array(),
                'tickmarkPlacement' => 'on',
                'lineWidth' => 1,
                'offset' => 9
            ),
            'yAxis' => array(
                'opposite' => 1,
                'lineWidth' => 1,
                'min' => 0,
                'max' => 5,
                'tickInterval' => 0.5,
                'offset' => 9
            ),
            'tooltip' => array(
                'enabled' => 0,
            ),
            'plotOptions' => array(
                'area' => array(
                    'fillOpacity' => 0
                ),
                'series' => array(
                    'animation' => 0
                )
            ),
            'legend' => array(
                'padding' => 16,
                'margin' => 30,
                'layout' => 'horizontal'
            ),
            'series' => array(),
            'credits' => array(
                'enabled' => 0
            )
        );
    }

    /**
     * @param array $criteria
     * @param $id
     * @param $chapter
     * @param $paragraph
     * @return array
     */
    public static function getParamsForNextCriterion(array $criteria, $id, $chapter, $paragraph)
    {
        $nextParagraph = array(
            'chapterNr' => $chapter,
            'paragraphNr' => $paragraph + 1,
        );
        $nextChapter = array(
            'chapterNr' => $chapter + 1,
            'paragraphNr' => 1,
        );

        if (count($criteria)) {
            foreach ($criteria as $criterion) {
                if (array_key_exists('chapterNr', $criterion)) {
                    if ($criterion['chapterNr'] == $nextParagraph['chapterNr']) {
                        foreach ($criterion['criterionItems'] as $criterionItem) {
                            if (array_key_exists('paragraphNr', $criterionItem)) {
                                if ($criterionItem['paragraphNr'] == $nextParagraph['paragraphNr']) {
                                    return array(
                                        'route' => 'cta_aishe_report_edit',
                                        'params' => array(
                                            'id' => $id,
                                            'chapter' => $criterion['chapterNr'],
                                            'paragraph' => $criterionItem['paragraphNr'],
                                        ),
                                    );
                                }
                            }
                        }
                    } else if ($criterion['chapterNr'] == $nextChapter['chapterNr']) {
                        foreach ($criterion['criterionItems'] as $criterionItem) {
                            if (array_key_exists('paragraphNr', $criterionItem)) {
                                if ($criterionItem['paragraphNr'] == $nextChapter['paragraphNr']) {
                                    return array(
                                        'route' => 'cta_aishe_report_edit',
                                        'params' => array(
                                            'id' => $id,
                                            'chapter' => $criterion['chapterNr'],
                                            'paragraph' => $criterionItem['paragraphNr'],
                                        ),
                                    );
                                }
                            }
                        }
                    }
                }
            }
        }
        return array(
            'route' => 'cta_aishe_report_view',
            'params' => array('id' => $id),
        );
    }
}