<?php

namespace Cta\AisheBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Criterion
 */
class Criterion extends Base
{
    /**
     * @var integer
     */
    private $id;

    /**
     * @var integer
     */
    private $chapterNr;

    /**
     * @var integer
     */
    private $type;

    /**
     * @var \Doctrine\Common\Collections\Collection
     */
    private $criterionItems;

    /**
     * @var \Doctrine\Common\Collections\Collection
     */
    private $criterionTranslations;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->criterionItems = new \Doctrine\Common\Collections\ArrayCollection();
        $this->criterionTranslations = new \Doctrine\Common\Collections\ArrayCollection();
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
     * Set chapterNr
     *
     * @param integer $chapterNr
     * @return Criterion
     */
    public function setChapterNr($chapterNr)
    {
        $this->chapterNr = $chapterNr;
    
        return $this;
    }

    /**
     * Get chapterNr
     *
     * @return integer 
     */
    public function getChapterNr()
    {
        return $this->chapterNr;
    }

    /**
     * Set type
     *
     * @param integer $type
     * @return Criterion
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
     * Add criterionItems
     *
     * @param \Cta\AisheBundle\Entity\CriterionItem $criterionItems
     * @return Criterion
     */
    public function addCriterionItem(\Cta\AisheBundle\Entity\CriterionItem $criterionItems)
    {
        $this->criterionItems[] = $criterionItems;
    
        return $this;
    }

    /**
     * Remove criterionItems
     *
     * @param \Cta\AisheBundle\Entity\CriterionItem $criterionItems
     */
    public function removeCriterionItem(\Cta\AisheBundle\Entity\CriterionItem $criterionItems)
    {
        $this->criterionItems->removeElement($criterionItems);
    }

    /**
     * Get criterionItems
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getCriterionItems()
    {
        return $this->criterionItems;
    }

    /**
     * Add criterionTranslations
     *
     * @param \Cta\AisheBundle\Entity\CriterionTranslation $criterionTranslations
     * @return Criterion
     */
    public function addCriterionTranslation(\Cta\AisheBundle\Entity\CriterionTranslation $criterionTranslations)
    {
        $this->criterionTranslations[] = $criterionTranslations;
    
        return $this;
    }

    /**
     * Remove criterionTranslations
     *
     * @param \Cta\AisheBundle\Entity\CriterionTranslation $criterionTranslations
     */
    public function removeCriterionTranslation(\Cta\AisheBundle\Entity\CriterionTranslation $criterionTranslations)
    {
        $this->criterionTranslations->removeElement($criterionTranslations);
    }

    /**
     * Get criterionTranslations
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getCriterionTranslations()
    {
        return $this->criterionTranslations;
    }
}
