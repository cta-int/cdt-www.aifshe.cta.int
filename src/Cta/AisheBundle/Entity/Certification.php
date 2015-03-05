<?php

namespace Cta\AisheBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Certification
 */
class Certification extends Base
{
    /**
     * @var integer
     */
    private $id;

    /**
     * @var string
     */
    private $name;

    /**
     * @var \Doctrine\Common\Collections\Collection
     */
    private $certificationRequirements;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->certificationRequirements = new \Doctrine\Common\Collections\ArrayCollection();
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
     * @return Certification
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
     * Add certificationRequirements
     *
     * @param \Cta\AisheBundle\Entity\CertificationRequirement $certificationRequirements
     * @return Certification
     */
    public function addCertificationRequirement(\Cta\AisheBundle\Entity\CertificationRequirement $certificationRequirements)
    {
        $this->certificationRequirements[] = $certificationRequirements;
    
        return $this;
    }

    /**
     * Remove certificationRequirements
     *
     * @param \Cta\AisheBundle\Entity\CertificationRequirement $certificationRequirements
     */
    public function removeCertificationRequirement(\Cta\AisheBundle\Entity\CertificationRequirement $certificationRequirements)
    {
        $this->certificationRequirements->removeElement($certificationRequirements);
    }

    /**
     * Get certificationRequirements
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getCertificationRequirements()
    {
        return $this->certificationRequirements;
    }
}
