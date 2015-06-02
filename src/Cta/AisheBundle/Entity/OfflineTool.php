<?php

namespace Cta\AisheBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * OfflineTool
 */
class OfflineTool extends Base
{
    /**
     * @var integer
     */
    private $id;

    /**
     * @var string
     */
    private $fileName;

    /**
     * @var integer
     */
    private $fileSize;

    /**
     * @var string
     */
    private $fileToken;

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
     * Set fileName
     *
     * @param string $fileName
     * @return OfflineTool
     */
    public function setFileName($fileName)
    {
        $this->fileName = $fileName;

        return $this;
    }

    /**
     * Get fileName
     *
     * @return string
     */
    public function getFileName()
    {
        return $this->fileName;
    }

    /**
     * Set fileSize
     *
     * @param integer $fileSize
     * @return OfflineTool
     */
    public function setFileSize($fileSize)
    {
        $this->fileSize = $fileSize;

        return $this;
    }

    /**
     * Get fileSize
     *
     * @return integer
     */
    public function getFileSize()
    {
        return $this->fileSize;
    }

    /**
     * Set fileToken
     *
     * @param string $fileToken
     * @return OfflineTool
     */
    public function setFileToken($fileToken)
    {
        $this->fileToken = $fileToken;

        return $this;
    }

    /**
     * Get fileToken
     *
     * @return string
     */
    public function getFileToken()
    {
        return $this->fileToken;
    }

    /**
     * Constructor
     */

    public function __construct()
    {
        $this->users = new \Doctrine\Common\Collections\ArrayCollection();
    }

    private $offlinetools;


    /**
     * Get offlinetools
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getOfflinetools()
    {
        return $this->offlinetools;
    }
    /**
     * @var boolean
     */
    private $latestVersion;


    /**
     * Set latestVersion
     *
     * @param boolean $latestVersion
     * @return OfflineTool
     */
    public function setLatestVersion($latestVersion)
    {
        $this->latestVersion = $latestVersion;

        return $this;
    }

    /**
     * Get latestVersion
     *
     * @return boolean
     */
    public function getLatestVersion()
    {
        return $this->latestVersion;
    }

    /**
     * Add offlinetools
     *
     * @param \Cta\AisheBundle\Entity\OfflineTool $offlinetools
     * @return OfflineTool
     */
    public function addOfflinetool(\Cta\AisheBundle\Entity\OfflineTool $offlinetools)
    {
        $this->offlinetools[] = $offlinetools;

        return $this;
    }

    /**
     * Remove offlinetools
     *
     * @param \Cta\AisheBundle\Entity\OfflineTool $offlinetools
     */
    public function removeOfflinetool(\Cta\AisheBundle\Entity\OfflineTool $offlinetools)
    {
        $this->offlinetools->removeElement($offlinetools);
    }
    /**
     * @var boolean
     */
    private $outdated;


    /**
     * Set outdated
     *
     * @param boolean $outdated
     * @return OfflineTool
     */
    public function setOutdated($outdated)
    {
        $this->outdated = $outdated;
    
        return $this;
    }

    /**
     * Get outdated
     *
     * @return boolean 
     */
    public function getOutdated()
    {
        return $this->outdated;
    }
}