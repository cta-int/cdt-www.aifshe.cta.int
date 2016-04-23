<?php
namespace Cta\AisheBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use FOS\UserBundle\Model\User as BaseUser;
use Symfony\Component\Security\Core\User\AdvancedUserInterface;

/**
 * User
 */
class User extends BaseUser implements AdvancedUserInterface
{
    /**
     * @var Institution
     */
    private $institution = null;

    /**
     * @var boolean
     */
    private $requestAuditor = false;

    /**
     * @var ArrayCollection
     */
    private $reports;

    /**
     * Constructor
     */
    public function __construct()
    {
        parent::__construct();

        $this->reports = new ArrayCollection();
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
     * Set institution
     *
     * @param Institution $institution
     *
     * @return User
     */
    public function setInstitution(Institution $institution = null)
    {
        $this->institution = $institution;

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
     * Set requestAuditor
     *
     * @param boolean $requestAuditor
     *
     * @return User
     */
    public function setRequestAuditor($requestAuditor = false)
    {
        $this->requestAuditor = $requestAuditor;

        return $this;
    }

    /**
     * Add reports
     *
     * @param Report $reports
     *
     * @return User
     */
    public function addReport(Report $reports)
    {
        $this->reports[] = $reports;

        return $this;
    }

    /**
     * Remove reports
     *
     * @param Report $reports
     */
    public function removeReport(Report $reports)
    {
        $this->reports->removeElement($reports);
    }

    /**
     * Get reports
     *
     * @return ArrayCollection
     */
    public function getReports()
    {
        return $this->reports;
    }

}