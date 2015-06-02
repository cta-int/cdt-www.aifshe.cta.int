<?php

namespace Cta\AisheBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CriterionTranslation
 */
class CriterionTranslation extends Base
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
     * @var \Cta\AisheBundle\Entity\Criterion
     */
    private $criterion;


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
     * @return CriterionTranslation
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
     * @return CriterionTranslation
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
     * Set criterion
     *
     * @param \Cta\AisheBundle\Entity\Criterion $criterion
     * @return CriterionTranslation
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
