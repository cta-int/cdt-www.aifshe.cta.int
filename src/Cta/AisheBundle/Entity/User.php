<?php

namespace Cta\AisheBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use FOS\UserBundle\Model\User as BaseUser;

/**
 * User
 */
class User extends BaseUser
{
    /**
     * @var \Cta\AisheBundle\Entity\Institution
     */
    private $institution;

    /**
     * @var boolean
     */
    private $requestAuditor;

    /**
     * @var \Doctrine\Common\Collections\Collection
     */
    private $reports;

    /**
     * Constructor
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Set institution
     *
     * @param \Cta\AisheBundle\Entity\Institution $institution
     * @return User
     */
    public function setInstitution(\Cta\AisheBundle\Entity\Institution $institution = null)
    {
        $this->institution = $institution;

        return $this;
    }

    /**
     * Get institution
     *
     * @return \Cta\AisheBundle\Entity\Institution
     */
    public function getInstitution()
    {
        return $this->institution;
    }

    /**
     * Set requestAuditor
     *
     * @param boolean $requestAuditor
     * @return User
     */
    public function setRequestAuditor($requestAuditor)
    {
        $this->requestAuditor = $requestAuditor;

        return $this;
    }

    /**
     * Get requestAuditor
     *
     * @return boolean
     */
    public function getRequestAuditor()
    {
        return $this->requestAuditor;
    }

    /**
     * Add reports
     *
     * @param \Cta\AisheBundle\Entity\Report $reports
     * @return User
     */
    public function addReport(\Cta\AisheBundle\Entity\Report $reports)
    {
        $this->reports[] = $reports;

        return $this;
    }

    /**
     * Remove reports
     *
     * @param \Cta\AisheBundle\Entity\Report $reports
     */
    public function removeReport(\Cta\AisheBundle\Entity\Report $reports)
    {
        $this->reports->removeElement($reports);
    }

    /**
     * Get reports
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getReports()
    {
        return $this->reports;
    }

}