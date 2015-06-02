<?php

namespace Cta\AisheBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CriterionItem
 */
class CriterionItem extends Base
{
    /**
     * @var integer
     */
    private $id;

    /**
     * @var integer
     */
    private $paragraphNr;

    /**
     * @var \Doctrine\Common\Collections\Collection
     */
    private $criterionItemTranslations;

    /**
     * @var \Doctrine\Common\Collections\Collection
     */
    private $certificationRequirements;

    /**
     * @var \Cta\AisheBundle\Entity\Criterion
     */
    private $criterion;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->criterionItemTranslations = new \Doctrine\Common\Collections\ArrayCollection();
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
     * Set paragraphNr
     *
     * @param integer $paragraphNr
     * @return CriterionItem
     */
    public function setParagraphNr($paragraphNr)
    {
        $this->paragraphNr = $paragraphNr;
    
        return $this;
    }

    /**
     * Get paragraphNr
     *
     * @return integer 
     */
    public function getParagraphNr()
    {
        return $this->paragraphNr;
    }

    /**
     * Add criterionItemTranslations
     *
     * @param \Cta\AisheBundle\Entity\CriterionItemTranslation $criterionItemTranslations
     * @return CriterionItem
     */
    public function addCriterionItemTranslation(\Cta\AisheBundle\Entity\CriterionItemTranslation $criterionItemTranslations)
    {
        $this->criterionItemTranslations[] = $criterionItemTranslations;
    
        return $this;
    }

    /**
     * Remove criterionItemTranslations
     *
     * @param \Cta\AisheBundle\Entity\CriterionItemTranslation $criterionItemTranslations
     */
    public function removeCriterionItemTranslation(\Cta\AisheBundle\Entity\CriterionItemTranslation $criterionItemTranslations)
    {
        $this->criterionItemTranslations->removeElement($criterionItemTranslations);
    }

    /**
     * Get criterionItemTranslations
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getCriterionItemTranslations()
    {
        return $this->criterionItemTranslations;
    }

    /**
     * Add certificationRequirements
     *
     * @param \Cta\AisheBundle\Entity\CertificationRequirement $certificationRequirements
     * @return CriterionItem
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

    /**
     * Set criterion
     *
     * @param \Cta\AisheBundle\Entity\Criterion $criterion
     * @return CriterionItem
     */
    public function setCriterion(\Cta\AisheBundle\Entity\Criterion $criterion = null)
    {
        $this->criterion = $criterion;
    
        return $this;
    }

    /**
     * Get criterion
     *
     * @return \Cta\AisheBundle\Entity\Criterion 
     */
    public function getCriterion()
    {
        return $this->criterion;
    }
}
