<?php

namespace Cta\AisheBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;

/**
 * Report
 */
class Report extends Base
{
    const ST_APPROVED           = 8;
    const ST_APPROVAL_DENIED    = 7;
    const ST_APPROVAL_REQUESTED = 6;

    /**
     * @var integer
     */
    private $id;

    /**
     * @var string
     */
    private $name;

    /**
     * @var string
     */
    private $department;

    /**
     * @var string
     */
    private $coordinator;

    /**
     * @var integer
     */
    private $nrOfParticipants;

    /**
     * @var string
     */
    private $secretary;

    /**
     * @var \DateTime
     */
    private $dateAssessment;

    /**
     * @var \DateTime
     */
    private $dateLatestAssessment;

    /**
     * @var \DateTime
     */
    private $dateDesiredSituation;

    /**
     * @var string
     */
    private $comment;

    /**
     * @var boolean
     */
    private $isOfficial;

    /**
     * @var Chart
     */
    private $chartSettings;

    /**
     * @var \Doctrine\Common\Collections\Collection
     */
    private $reportItems;

    /**
     * @var Institution
     */
    private $institution;

    /**
     * @var \Doctrine\Common\Collections\Collection
     */
    private $users;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->reportItems = new ArrayCollection();
        $this->users = new ArrayCollection();
    }
    
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
     * Set name
     *
     * @param string $name
     * @return Report
     */
    public function setName($name)
    {
        $this->name = $name;
    
        return $this;
    }

    /**
     * Get name
     *
     * @return string 
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set department
     *
     * @param string $department
     * @return Report
     */
    public function setDepartment($department)
    {
        $this->department = $department;
    
        return $this;
    }

    /**
     * Get department
     *
     * @return string 
     */
    public function getDepartment()
    {
        return $this->department;
    }

    /**
     * Set coordinator
     *
     * @param string $coordinator
     * @return Report
     */
    public function setCoordinator($coordinator)
    {
        $this->coordinator = $coordinator;
    
        return $this;
    }

    /**
     * Get coordinator
     *
     * @return string 
     */
    public function getCoordinator()
    {
        return $this->coordinator;
    }

    /**
     * Set nrOfParticipants
     *
     * @param integer $nrOfParticipants
     * @return Report
     */
    public function setNrOfParticipants($nrOfParticipants)
    {
        $this->nrOfParticipants = $nrOfParticipants;
    
        return $this;
    }

    /**
     * Get nrOfParticipants
     *
     * @return integer 
     */
    public function getNrOfParticipants()
    {
        return $this->nrOfParticipants;
    }

    /**
     * Set secretary
     *
     * @param string $secretary
     * @return Report
     */
    public function setSecretary($secretary)
    {
        $this->secretary = $secretary;
    
        return $this;
    }

    /**
     * Get secretary
     *
     * @return string 
     */
    public function getSecretary()
    {
        return $this->secretary;
    }

    /**
     * Set dateAssessment
     *
     * @param \DateTime $dateAssessment
     * @return Report
     */
    public function setDateAssessment($dateAssessment)
    {
        $this->dateAssessment = $dateAssessment;
    
        return $this;
    }

    /**
     * Get dateAssessment
     *
     * @return \DateTime 
     */
    public function getDateAssessment()
    {
        return $this->dateAssessment;
    }

    /**
     * Set dateLatestAssessment
     *
     * @param \DateTime $dateLatestAssessment
     * @return Report
     */
    public function setDateLatestAssessment($dateLatestAssessment)
    {
        $this->dateLatestAssessment = $dateLatestAssessment;
    
        return $this;
    }

    /**
     * Get dateLatestAssessment
     *
     * @return \DateTime 
     */
    public function getDateLatestAssessment()
    {
        return $this->dateLatestAssessment;
    }

    /**
     * Set dateDesiredSituation
     *
     * @param \DateTime $dateDesiredSituation
     * @return Report
     */
    public function setDateDesiredSituation($dateDesiredSituation)
    {
        $this->dateDesiredSituation = $dateDesiredSituation;
    
        return $this;
    }

    /**
     * Get dateDesiredSituation
     *
     * @return \DateTime 
     */
    public function getDateDesiredSituation()
    {
        return $this->dateDesiredSituation;
    }

    /**
     * Set comment
     *
     * @param string $comment
     * @return Report
     */
    public function setComment($comment)
    {
        $this->comment = $comment;
    
        return $this;
    }

    /**
     * Get comment
     *
     * @return string 
     */
    public function getComment()
    {
        return $this->comment;
    }

    /**
     * Set isOfficial
     *
     * @param boolean $isOfficial
     * @return Report
     */
    public function setIsOfficial($isOfficial)
    {
        $this->isOfficial = $isOfficial;
    
        return $this;
    }

    /**
     * Get isOfficial
     *
     * @return boolean 
     */
    public function getIsOfficial()
    {
        return $this->isOfficial;
    }

    /**
     * Set chartSettings
     *
     * @param Chart $chartSettings
     * @return Report
     */
    public function setChartSettings(Chart $chartSettings = null)
    {
        $this->chartSettings = $chartSettings;
    
        return $this;
    }

    /**
     * Get chartSettings
     *
     * @return Chart 
     */
    public function getChartSettings()
    {
        return $this->chartSettings;
    }

    /**
     * Add reportItems
     *
     * @param ReportItem $reportItems
     * @return Report
     */
    public function addReportItem(ReportItem $reportItems)
    {
        $this->reportItems[] = $reportItems;
    
        return $this;
    }

    /**
     * Remove reportItems
     *
     * @param ReportItem $reportItems
     */
    public function removeReportItem(ReportItem $reportItems)
    {
        $this->reportItems->removeElement($reportItems);
    }

    /**
     * Get reportItems
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getReportItems()
    {
        return $this->reportItems;
    }

    /**
     * Set institution
     *
     * @param Institution $institution
     * @return Report
     */
    public function setInstitution(Institution $institution = null)
    {
        $this->institution = $institution;
    
        return $this;
    }

    /**
     * Get institution
     *
     * @return Institution 
     */
    public function getInstitution()
    {
        return $this->institution;
    }

    /**
     * Add users
     *
     * @param User $users
     * @return Report
     */
    public function addUser(User $users)
    {
        $this->users[] = $users;
    
        return $this;
    }

    /**
     * Remove users
     *
     * @param User $users
     */
    public function removeUser(User $users)
    {
        $this->users->removeElement($users);
    }

    /**
     * Get users
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getUsers()
    {
        return $this->users;
    }
}
