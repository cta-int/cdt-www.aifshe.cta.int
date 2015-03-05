<?php

namespace Cta\AisheBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Page
 */
class Page extends Base
{
    /**
     * @var integer
     */
    private $id;

    /**
     * @var string
     */
    private $identifier;

    /**
     * @var string
     */
    private $javascript;

    /**
     * @var \Doctrine\Common\Collections\Collection
     */
    private $pageTranslations;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->pageTranslations = new \Doctrine\Common\Collections\ArrayCollection();
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
     * Set identifier
     *
     * @param string $identifier
     * @return Page
     */
    public function setIdentifier($identifier)
    {
        $this->identifier = $identifier;
    
        return $this;
    }

    /**
     * Get identifier
     *
     * @return string 
     */
    public function getIdentifier()
    {
        return $this->identifier;
    }

    /**
     * Set javascript
     *
     * @param string $javascript
     * @return Page
     */
    public function setJavascript($javascript)
    {
        $this->javascript = $javascript;
    
        return $this;
    }

    /**
     * Get javascript
     *
     * @return string 
     */
    public function getJavascript()
    {
        return $this->javascript;
    }

    /**
     * Add pageTranslations
     *
     * @param \Cta\AisheBundle\Entity\PageTranslation $pageTranslations
     * @return Page
     */
    public function addPageTranslation(\Cta\AisheBundle\Entity\PageTranslation $pageTranslations)
    {
        $this->pageTranslations[] = $pageTranslations;
    
        return $this;
    }

    /**
     * Remove pageTranslations
     *
     * @param \Cta\AisheBundle\Entity\PageTranslation $pageTranslations
     */
    public function removePageTranslation(\Cta\AisheBundle\Entity\PageTranslation $pageTranslations)
    {
        $this->pageTranslations->removeElement($pageTranslations);
    }

    /**
     * Get pageTranslations
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getPageTranslations()
    {
        return $this->pageTranslations;
    }
}
