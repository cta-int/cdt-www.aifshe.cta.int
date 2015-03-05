<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 9/5/13
 * Time: 2:36 PM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\AisheBundle\Model;

use Symfony\Component\HttpFoundation\File\UploadedFile;
use Cta\AisheBundle\Service\Report;

class Import
{
    private $_reportId = null;

    private $_reportService = null;

    private $_errors = array();

    private $_allowed_extensions = array('aishe');

    private $_aishe_lines = array(
        1   => null,
        2   => null,
        3   => null,
        4   => null,
        5   => 'institution',
        6   => 'department',
        7   => 'auditor',
        8   => 'coordinator',
        9   => 'nrOfParticipants',
        10  => 'secretary',
        11  => 'dateAssessment',
        12  => 'dateLatestAssessment',
        13  => 'dateDesiredSituation',
        14  => null,
    );

    public function __construct(Report $reportService)
    {
        $this->_reportService = $reportService;
    }

    public function aisheToReport($name, UploadedFile $file)
    {
        if (!in_array($file->getClientOriginalExtension(), $this->_allowed_extensions)) {
            $this->_errors[] = 'Only files with the [' . implode(',', $this->_allowed_extensions) . '] extensions are allowed.';
            return false;
        }

        $report = array();

        $openfile = $file->openFile();
        if (!$openfile->isReadable()) {
            $this->_errors[] = 'File could not be opened.';
        } else {
            $currentCriterion           = null;
            $currentCriterionItem       = null;
            $getCurrentSituationRating  = false;
            $getCurrentSituationComment = false;
            $getDesiredSituationRating  = false;
            $getDesiredSituationComment = false;

            $report['name']             = $name;
            $report['criteria']         = array();

            $lineNr = 0;
            foreach ($openfile as $line) {
                $lineNr++;
                $pb = chr(12);
                $line = preg_replace( "/\r|\n|$pb/", "", $line);

                if (array_key_exists($lineNr, $this->_aishe_lines)) { // general report data
                    if (!is_null($this->_aishe_lines[$lineNr])) {
                        $line = trim($line);
                        if (strpos($this->_aishe_lines[$lineNr], 'date') !== false) {
                            $line = $this->_getDate($line);
                        }
                        $report[$this->_aishe_lines[$lineNr]] = $line;
                    }
                } else { // criteria

                    if (!$getCurrentSituationRating && !$getCurrentSituationComment && !$getDesiredSituationRating &&
                        ! $getDesiredSituationComment && trim($line) == "") {
                        $currentCriterion           = null;
                        $currentCriterionItem       = null;
                        continue;
                    }

                    if (substr($line, 0, 9) == 'criterium') {
                        list($currentCriterion, $currentCriterionItem) = explode('.', substr($line, 10, 3));
                        $getCurrentSituationRating  = true;
                        continue;
                    }
                    if ($getCurrentSituationRating) {
                        $report['criteria'][$currentCriterion][$currentCriterionItem]['current']['rating'] = $this->_getRating($line);
                        $getCurrentSituationRating  = false;
                        $getCurrentSituationComment = true;
                        continue;
                    }
                    if ($getCurrentSituationComment) {
                        if (!array_key_exists('comment', $report['criteria'][$currentCriterion][$currentCriterionItem]['current'])) {
                            $report['criteria'][$currentCriterion][$currentCriterionItem]['current']['comment'] = $line;
                        } else {
                            $report['criteria'][$currentCriterion][$currentCriterionItem]['current']['comment'] .= PHP_EOL . $line;
                        }
                        if (trim($line) == "") {
                            $getCurrentSituationComment = false;
                            $getDesiredSituationRating  = true;
                        }
                        continue;
                    }
                    if ($getDesiredSituationRating) {
                        $report['criteria'][$currentCriterion][$currentCriterionItem]['hasHighPriority'] = (
                            strpos($line, 'High Priority') !== false ||
                            strpos($line, 'Hoge Prioriteit') !== false ||
                            strpos($line, 'Haute Priorité') !== false
                        );

                        $report['criteria'][$currentCriterion][$currentCriterionItem]['desired']['rating'] = $this->_getRating($line);
                        $getDesiredSituationRating  = false;
                        $getDesiredSituationComment = true;
                        continue;
                    }
                    if ($getDesiredSituationComment) {
                        if (!array_key_exists('comment', $report['criteria'][$currentCriterion][$currentCriterionItem]['desired'])) {
                            $report['criteria'][$currentCriterion][$currentCriterionItem]['desired']['comment'] = $line;
                        } else {
                            $report['criteria'][$currentCriterion][$currentCriterionItem]['desired']['comment'] .= PHP_EOL . $line;
                        }
                        if (trim($line) == "") {
                            $getDesiredSituationComment = false;
                        }
                        continue;
                    }
                }

            }

            $this->_reportId = $this->_reportService->saveCompleteReport($report);
        }

        return !count($this->_errors);
    }

    public function getErrors()
    {
        return $this->_errors;
    }

    public function getReportId()
    {
        return $this->_reportId;
    }

    public function jsonToReport($json)
    {
        $reportData = json_decode($json);
        if (json_last_error() != JSON_ERROR_NONE || is_null($reportData)) {
            $this->_errors[] = 'Could not decode input (Json error code: [' . json_last_error() . ']).';
            return false;
        }

        if (!$this->_reportService->isCurrentVersion($reportData->version)) {
            $this->_errors[] = 'The version of the offline tool you\'re using is outdated. Please update to a newer version.';
            return false;
        }

        $report = array();
        $report['criteria'] = array();

        $report['name']                 = $reportData->name;
        $report['department']           = $reportData->department;
        $report['coordinator']          = $reportData->coordinator;
        $report['nrOfParticipants']     = $reportData->nrOfParticipants;
        $report['secretary']            = $reportData->secretary;
        $report['dateAssessment']       = $reportData->dateAssessment;
        $report['dateLatestAssessment'] = $reportData->dateLatestAssessment;
        $report['dateDesiredSituation'] = $reportData->dateDesiredSituation;
        $report['comment']              = $reportData->comment;

        foreach ($reportData->reportItems as $criteria) {
            if (!array_key_exists($criteria->chapterNr, $report['criteria'])) {
                $report['criteria'][$criteria->chapterNr] = array();
            }

            foreach ($criteria->children as $criterion) {
                $criterionData = array();
                $criterionData['current'] = array();
                $criterionData['desired'] = array();

                if (property_exists($criterion, 'priority')) {
                    $criterionData['hasHighPriority'] = 1;
                }
                if (property_exists($criterion, 'currentSituation')) {
                    $criterionData['current']['rating'] = $criterion->currentSituation;
                }
                if (property_exists($criterion, 'currentSituationComment')) {
                    $criterionData['current']['comment'] = $criterion->currentSituationComment;
                }
                if (property_exists($criterion, 'desiredSituation')) {
                    $criterionData['desired']['rating'] = $criterion->desiredSituation;
                }
                if (property_exists($criterion, 'desiredSituationComment')) {
                    $criterionData['desired']['comment'] = $criterion->desiredSituationComment;
                }

                $report['criteria'][$criteria->chapterNr][$criterion->paragraphNr] = $criterionData;
            }
        }

        $this->_reportId = $this->_reportService->saveCompleteReport($report);
        return !count($this->_errors);
    }

    private function _getRating($line)
    {
        preg_match('/\d/', $line, $m, PREG_OFFSET_CAPTURE);
        $rating = 0.0;
        if (isset($m[0]) && isset($m[0][0])) {
            $rating = (float) $m[0][0] . '.0';
        }

        if (    strpos($line, 'going to') !== false ||
                strpos($line, 'onderweg naar') !== false ||
                strpos($line, 'aller à') !== false
        ) {
            $rating += 0.5;
        }

        return $rating;
    }

    private function _getDate($line)
    {
        if ($line == "") {
            return null;
        }

        $timestamp = strtotime($line);
        if (!$timestamp) {
            return null;
        }

        // we know the tool is running since the year 2000, so anything earlier will be most likely a faulty timestamp
        if (date('Y', $timestamp) < 2000) {
            return null;
        }

        return new \DateTime(date('Y-m-d', $timestamp));
    }

}