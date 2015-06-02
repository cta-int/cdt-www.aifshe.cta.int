<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 9/3/13
 * Time: 9:37 AM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\AisheBundle\Model;


class Criteria {

    /**
     * @param array $criteria
     * @param $chapter
     * @param $paragraph
     * @return null
     */
    public static function getCurrentCriterion(array $criteria, $chapter, $paragraph)
    {
        if (count($criteria)) {
            foreach ($criteria as $criterion) {
                if (array_key_exists('chapterNr', $criterion) && $criterion['chapterNr'] == $chapter) {
                    $c = $criterion;
                    foreach ($criterion['criterionItems'] as $criterionItem) {
                        if (array_key_exists('paragraphNr', $criterionItem) && $criterionItem['paragraphNr'] == $paragraph) {
                            unset($c['criterionItems']);
                            $c['criterionItem'] = $criterionItem;
                            return $c;
                        }
                    }
                }
            }
        }
        return null;
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
            'chapterNr'     => $chapter,
            'paragraphNr'   => $paragraph + 1,
        );
        $nextChapter = array(
            'chapterNr'     => $chapter + 1,
            'paragraphNr'   => 1,
        );

        if (count($criteria)) {
            foreach ($criteria as $criterion) {
                if (array_key_exists('chapterNr', $criterion)) {
                    if ($criterion['chapterNr'] == $nextParagraph['chapterNr']) {
                        foreach ($criterion['criterionItems'] as $criterionItem) {
                            if (array_key_exists('paragraphNr', $criterionItem)) {
                                if ($criterionItem['paragraphNr'] == $nextParagraph['paragraphNr']) {
                                    return array(
                                        'route'     => 'cta_aishe_report_edit',
                                        'params'    => array(
                                            'id'        => $id,
                                            'chapter'   => $criterion['chapterNr'],
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
                                        'route'     => 'cta_aishe_report_edit',
                                        'params'    => array(
                                            'id' => $id,
                                            'chapter'   => $criterion['chapterNr'],
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
            'route'     => 'cta_aishe_report_view',
            'params'    => array('id' => $id),
        );
    }
}