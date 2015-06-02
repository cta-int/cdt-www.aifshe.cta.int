<?php

namespace Cta\AisheBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * ReportItem
 */
class ReportItem extends Base
{
    /**
     * @var integer
     */
    private $id;

    /**
     * @var float
     */
    private $currentSituationRating;

    /**
     * @var float
     */
    private $desiredSituationRating;

    /**
     * @var string
     */
    private $currentSituationComment;

    /**
     * @var string
     */
    private $desiredSituationComment;

    /**
     * @var boolean
     */
    private $hasHighPriority;

    /**
     * @var \Cta\AisheBundle\Entity\Report
     */
    private $report;

    /**
     * @var \Cta\AisheBundle\Entity\CriterionItem
     */
    private $criterionItem;


    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set currentSituationRating
     *
     * @param float $currentSituationRating
     * @return ReportItem
     */
    public function setCurrentSituationRating($currentSituationRating)
    {
        $this->currentSituationRating = $currentSituationRating;
    
        return $this;
    }

    /**
     * Get currentSituationRating
     *
     * @return float 
     */
    public function getCurrentSituationRating()
    {
        return $this->currentSituationRating;
    }

    /**
     * Set desiredSituationRating
     *
     * @param float $desiredSituationRating
     * @return ReportItem
     */
    public function setDesiredSituationRating($desiredSituationRating)
    {
        $this->desiredSituationRating = $desiredSituationRating;
    
        return $this;
    }

    /**
     * Get desiredSituationRating
     *
     * @return float 
     */
    public function getDesiredSituationRating()
    {
        return $this->desiredSituationRating;
    }

    /**
     * Set currentSituationComment
     *
     * @param string $currentSituationComment
     * @return ReportItem
     */
    public function setCurrentSituationComment($currentSituationComment)
    {
        $this->currentSituationComment = $currentSituationComment;
    
        return $this;
    }

    /**
     * Get currentSituationComment
     *
     * @return string 
     */
    public function getCurrentSituationComment()
    {
        return $this->currentSituationComment;
    }

    /**
     * Set desiredSituationComment
     *
     * @param string $desiredSituationComment
     * @return ReportItem
     */
    public function setDesiredSituationComment($desiredSituationComment)
    {
        $this->desiredSituationComment = $desiredSituationComment;
    
        return $this;
    }

    /**
     * Get desiredSituationComment
     *
     * @return string 
     */
    public function getDesiredSituationComment()
    {
        return $this->desiredSituationComment;
    }

    /**
     * Set hasHighPriority
     *
     * @param boolean $hasHighPriority
     * @return ReportItem
     */
    public function setHasHighPriority($hasHighPriority)
    {
        $this->hasHighPriority = $hasHighPriority;
    
        return $this;
    }

    /**
     * Get hasHighPriority
     *
     * @return boolean 
     */
    public function getHasHighPriority()
    {
        return $this->hasHighPriority;
    }

    /**
     * Set report
     *
     * @param \Cta\AisheBundle\Entity\Report $report
     * @return ReportItem
     */
    public function setReport(\Cta\AisheBundle\Entity\Report $report = null)
    {
        $this->report = $report;
    
        return $this;
    }

    /**
     * Get report
     *
     * @return \Cta\AisheBundle\Entity\Report 
     */
    public function getReport()
    {
        return $this->report;
    }

    /**
     * Set criterionItem
     *
     * @param \Cta\AisheBundle\Entity\CriterionItem $criterionItem
     * @return ReportItem
     */
    public function setCriterionItem(\Cta\AisheBundle\Entity\CriterionItem $criterionItem = null)
    {
        $this->criterionItem = $criterionItem;
    
        return $this;
    }

    /**
     * Get criterionItem
     *
     * @return \Cta\AisheBundle\Entity\CriterionItem 
     */
    public function getCriterionItem()
    {
        return $this->criterionItem;
    }
}
