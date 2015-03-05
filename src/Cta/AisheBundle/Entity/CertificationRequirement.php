<?php

namespace Cta\AisheBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CertificationRequirement
 */
class CertificationRequirement extends Base
{
    /**
     * @var integer
     */
    private $id;

    /**
     * @var integer
     */
    private $stage;

    /**
     * @var \Cta\AisheBundle\Entity\Certification
     */
    private $certification;

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
     * Set stage
     *
     * @param integer $stage
     * @return CertificationRequirement
     */
    public function setStage($stage)
    {
        $this->stage = $stage;
    
        return $this;
    }

    /**
     * Get stage
     *
     * @return integer 
     */
    public function getStage()
    {
        return $this->stage;
    }

    /**
     * Set certification
     *
     * @param \Cta\AisheBundle\Entity\Certification $certification
     * @return CertificationRequirement
     */
    public function setCertification(\Cta\AisheBundle\Entity\Certification $certification = null)
    {
        $this->certification = $certification;
    
        return $this;
    }

    /**
     * Get certification
     *
     * @return \Cta\AisheBundle\Entity\Certification 
     */
    public function getCertification()
    {
        return $this->certification;
    }

    /**
     * Set criterionItem
     *
     * @param \Cta\AisheBundle\Entity\CriterionItem $criterionItem
     * @return CertificationRequirement
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
