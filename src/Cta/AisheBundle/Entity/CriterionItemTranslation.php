<?php

namespace Cta\AisheBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CriterionItemTranslation
 */
class CriterionItemTranslation extends Base
{
    /**
     * @var integer
     */
    private $id;

    /**
     * @var integer
     */
    private $lang;

    /**
     * @var string
     */
    private $value;

    /**
     * @var string
     */
    private $infoStage1;

    /**
     * @var string
     */
    private $infoStage2;

    /**
     * @var string
     */
    private $infoStage3;

    /**
     * @var string
     */
    private $infoStage4;

    /**
     * @var string
     */
    private $infoStage5;

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
     * Set lang
     *
     * @param integer $lang
     * @return CriterionItemTranslation
     */
    public function setLang($lang)
    {
        $this->lang = $lang;
    
        return $this;
    }

    /**
     * Get lang
     *
     * @return integer 
     */
    public function getLang()
    {
        return $this->lang;
    }

    /**
     * Set value
     *
     * @param string $value
     * @return CriterionItemTranslation
     */
    public function setValue($value)
    {
        $this->value = $value;
    
        return $this;
    }

    /**
     * Get value
     *
     * @return string 
     */
    public function getValue()
    {
        return $this->value;
    }

    /**
     * Set infoStage1
     *
     * @param string $infoStage1
     * @return CriterionItemTranslation
     */
    public function setInfoStage1($infoStage1)
    {
        $this->infoStage1 = $infoStage1;
    
        return $this;
    }

    /**
     * Get infoStage1
     *
     * @return string 
     */
    public function getInfoStage1()
    {
        return $this->infoStage1;
    }

    /**
     * Set infoStage2
     *
     * @param string $infoStage2
     * @return CriterionItemTranslation
     */
    public function setInfoStage2($infoStage2)
    {
        $this->infoStage2 = $infoStage2;
    
        return $this;
    }

    /**
     * Get infoStage2
     *
     * @return string 
     */
    public function getInfoStage2()
    {
        return $this->infoStage2;
    }

    /**
     * Set infoStage3
     *
     * @param string $infoStage3
     * @return CriterionItemTranslation
     */
    public function setInfoStage3($infoStage3)
    {
        $this->infoStage3 = $infoStage3;
    
        return $this;
    }

    /**
     * Get infoStage3
     *
     * @return string 
     */
    public function getInfoStage3()
    {
        return $this->infoStage3;
    }

    /**
     * Set infoStage4
     *
     * @param string $infoStage4
     * @return CriterionItemTranslation
     */
    public function setInfoStage4($infoStage4)
    {
        $this->infoStage4 = $infoStage4;
    
        return $this;
    }

    /**
     * Get infoStage4
     *
     * @return string 
     */
    public function getInfoStage4()
    {
        return $this->infoStage4;
    }

    /**
     * Set infoStage5
     *
     * @param string $infoStage5
     * @return CriterionItemTranslation
     */
    public function setInfoStage5($infoStage5)
    {
        $this->infoStage5 = $infoStage5;
    
        return $this;
    }

    /**
     * Get infoStage5
     *
     * @return string 
     */
    public function getInfoStage5()
    {
        return $this->infoStage5;
    }

    /**
     * Set criterionItem
     *
     * @param \Cta\AisheBundle\Entity\CriterionItem $criterionItem
     * @return CriterionItemTranslation
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
