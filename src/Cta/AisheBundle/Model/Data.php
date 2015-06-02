<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 8/29/13
 * Time: 10:22 AM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\AisheBundle\Model;


class Data
{
    const LANG_ENGLISH   = 1;
    const LANG_DUTCH     = 2;
    const LANG_FRENCH    = 3;

    const TYPE_PLAN     = 1;
    const TYPE_DO       = 2;
    const TYPE_CHECK    = 3;

    private static $_languages = array(
        self::LANG_ENGLISH   => 'en',
//        self::LANG_DUTCH     => 'nl',
        self::LANG_FRENCH    => 'fr'
    );

    private static $_criterionTypes = array(
        self::TYPE_PLAN     => 'Plan',
        self::TYPE_DO       => 'Do',
        self::TYPE_CHECK    => 'Check'
    );

    /**
     * @param null $key
     * @return array
     */
    public static function getLanguages($key=null)
    {
        if (!is_null($key) && array_key_exists($key, self::$_languages)) {
            return self::$_languages[$key];
        } else {
            return self::$_languages;
        }
    }

    /**
     * @param null $key
     * @return array
     */
    public static function getLanguageCodes($key=null)
    {
        $languageCodes = array_flip(self::$_languages);
        if (!is_null($key) && array_key_exists($key, $languageCodes)) {
            return $languageCodes[$key];
        } else {
            return $languageCodes;
        }
    }

    /**
     * @param null $key
     * @return array
     */
    public static function getCriterionTypes($key=null)
    {
        if (!is_null($key) && array_key_exists($key, self::$_criterionTypes)) {
            return self::$_criterionTypes[$key];
        } else {
            return self::$_criterionTypes;
        }
    }

    /**
     * @param $report
     * @param $certifications
     * @return array
     */
    public static function getGeneralData($report, $certifications)
    {
        $generalData    = array();

        $currentRatings     = array();
        $currentTotal       = 0;
        $currentPlanTotal   = 0;
        $currentDoTotal     = 0;
        $desiredRatings     = array();
        $desiredTotal       = 0;
        $desiredPlanTotal   = 0;
        $desiredDoTotal     = 0;

        if (is_array($report['reportItems'])) {
            foreach ($report['reportItems'] as $reportItem) {
                $currentRatings[] = (float)$reportItem['currentSituationRating'];
                $desiredRatings[] = (float)$reportItem['desiredSituationRating'];

                $currentTotal += (float)$reportItem['currentSituationRating'];
                $desiredTotal += (float)$reportItem['desiredSituationRating'];

                switch ($reportItem['criterionItem']['criterion']['type']) {
                    case Data::TYPE_PLAN:
                        $currentPlanTotal += (float)$reportItem['currentSituationRating'];
                        $desiredPlanTotal += (float)$reportItem['desiredSituationRating'];
                        break;
                    case Data::TYPE_DO:
                        $currentDoTotal += (float)$reportItem['currentSituationRating'];
                        $desiredDoTotal += (float)$reportItem['desiredSituationRating'];
                        break;
                }
            }
        }

        $certificationTotals = array();
        foreach ($certifications as $cert) {
            foreach ($cert['certificationRequirements'] as $certReq) {
                if (!array_key_exists($cert['name'], $certificationTotals)) {
                    $certificationTotals[$cert['name']] = 0;
                }
                $certificationTotals[$cert['name']] += $certReq['stage'];
            }
        }

        $qualifications = array();
//        Disable certifications
//        foreach ($certificationTotals as $certificationKey => $certificationTotal) {
//            $qualifications[$certificationKey] = array(
//                'current' => $currentTotal - $certificationTotal,
//                'desired' => $desiredTotal - $certificationTotal,
//            );
//        }

        return array_merge(array(
            'median'            => array(
                'current'   => self::_calculateMedian($currentRatings),
                'desired'   => self::_calculateMedian($desiredRatings),
            ),
            'planDoBalance'     => array(
                'current'   => $currentDoTotal - $currentPlanTotal,
                'desired'   => $desiredDoTotal - $desiredPlanTotal,
            ),
            'policyAmbition'   => array(
                'current'   => null,
                'desired'   => $desiredTotal - $currentTotal,
            ),
        ), $qualifications);
    }

    /**
     * @param $ratings
     * @return float
     */
    private static function _calculateMedian(array $ratings)
    {
        if (!count($ratings)) {
            return 0;
        }

        sort($ratings);

        $n = count($ratings);
        $h = intval($n / 2);

        if($n % 2 == 0) {
            return ($ratings[$h] + $ratings[$h-1]) / 2;
        }
        return $ratings[$h];
    }
}