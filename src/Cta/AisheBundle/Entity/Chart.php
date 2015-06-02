<?php

namespace Cta\AisheBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Chart
 */
class Chart extends Base
{

    const TYPE_SPIDER  = 1;
    const TYPE_AREA    = 2;

    /**
     * @var integer
     */
    private $id;

    /**
     * @var boolean
     */
    private $showCriterion1;

    /**
     * @var boolean
     */
    private $showCriterion2;

    /**
     * @var boolean
     */
    private $showCriterion3;

    /**
     * @var boolean
     */
    private $showCriterion4;

    /**
     * @var \Cta\AisheBundle\Entity\Report
     */
    private $report;


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
     * Set showCriterion1
     *
     * @param boolean $showCriterion1
     * @return Chart
     */
    public function setShowCriterion1($showCriterion1)
    {
        $this->showCriterion1 = $showCriterion1;
    
        return $this;
    }

    /**
     * Get showCriterion1
     *
     * @return boolean 
     */
    public function getShowCriterion1()
    {
        return $this->showCriterion1;
    }

    /**
     * Set showCriterion2
     *
     * @param boolean $showCriterion2
     * @return Chart
     */
    public function setShowCriterion2($showCriterion2)
    {
        $this->showCriterion2 = $showCriterion2;
    
        return $this;
    }

    /**
     * Get showCriterion2
     *
     * @return boolean 
     */
    public function getShowCriterion2()
    {
        return $this->showCriterion2;
    }

    /**
     * Set showCriterion3
     *
     * @param boolean $showCriterion3
     * @return Chart
     */
    public function setShowCriterion3($showCriterion3)
    {
        $this->showCriterion3 = $showCriterion3;
    
        return $this;
    }

    /**
     * Get showCriterion3
     *
     * @return boolean 
     */
    public function getShowCriterion3()
    {
        return $this->showCriterion3;
    }

    /**
     * Set showCriterion4
     *
     * @param boolean $showCriterion4
     * @return Chart
     */
    public function setShowCriterion4($showCriterion4)
    {
        $this->showCriterion4 = $showCriterion4;
    
        return $this;
    }

    /**
     * Get showCriterion4
     *
     * @return boolean 
     */
    public function getShowCriterion4()
    {
        return $this->showCriterion4;
    }

    /**
     * Set report
     *
     * @param \Cta\AisheBundle\Entity\Report $report
     * @return Chart
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
     * @var integer
     */
    private $type;


    /**
     * Set type
     *
     * @param integer $type
     * @return Chart
     */
    public function setType($type)
    {
        $this->type = $type;
    
        return $this;
    }

    /**
     * Get type
     *
     * @return integer 
     */
    public function getType()
    {
        return $this->type;
    }
    /**
     * @var boolean
     */
    private $showCurrentSituation;

    /**
     * @var boolean
     */
    private $showDesiredSituation;

    /**
     * @var boolean
     */
    private $showHighPriority;


    /**
     * Set showCurrentSituation
     *
     * @param boolean $showCurrentSituation
     * @return Chart
     */
    public function setShowCurrentSituation($showCurrentSituation)
    {
        $this->showCurrentSituation = $showCurrentSituation;
    
        return $this;
    }

    /**
     * Get showCurrentSituation
     *
     * @return boolean 
     */
    public function getShowCurrentSituation()
    {
        return $this->showCurrentSituation;
    }

    /**
     * Set showDesiredSituation
     *
     * @param boolean $showDesiredSituation
     * @return Chart
     */
    public function setShowDesiredSituation($showDesiredSituation)
    {
        $this->showDesiredSituation = $showDesiredSituation;
    
        return $this;
    }

    /**
     * Get showDesiredSituation
     *
     * @return boolean 
     */
    public function getShowDesiredSituation()
    {
        return $this->showDesiredSituation;
    }

    /**
     * Set showHighPriority
     *
     * @param boolean $showHighPriority
     * @return Chart
     */
    public function setShowHighPriority($showHighPriority)
    {
        $this->showHighPriority = $showHighPriority;
    
        return $this;
    }

    /**
     * Get showHighPriority
     *
     * @return boolean 
     */
    public function getShowHighPriority()
    {
        return $this->showHighPriority;
    }
}