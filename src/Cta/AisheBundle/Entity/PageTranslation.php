<?php

namespace Cta\AisheBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * PageTranslation
 */
class PageTranslation extends Base
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
     * @var \Cta\AisheBundle\Entity\Page
     */
    private $page;


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
     * @return PageTranslation
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
     * @return PageTranslation
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
     * Set page
     *
     * @param \Cta\AisheBundle\Entity\Page $page
     * @return PageTranslation
     */
    public function setPage(\Cta\AisheBundle\Entity\Page $page = null)
    {
        $this->page = $page;
    
        return $this;
    }

    /**
     * Get page
     *
     * @return \Cta\AisheBundle\Entity\Page 
     */
    public function getPage()
    {
        return $this->page;
    }
}
