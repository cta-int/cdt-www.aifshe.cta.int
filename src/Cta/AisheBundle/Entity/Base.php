<?php

namespace Cta\AisheBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Base
 */
class Base extends \Devart\CommonBundle\Entity\Base
{
    /**
     * @var \Cta\AisheBundle\Entity\User
     */
    private $createdBy;

    /**
     * @var \Cta\AisheBundle\Entity\User
     */
    private $modifiedBy;


    /**
     * Set createdBy
     *
     * @param \Cta\AisheBundle\Entity\User $createdBy
     * @return Base
     */
    public function setCreatedBy(\Cta\AisheBundle\Entity\User $createdBy = null)
    {
        $this->createdBy = $createdBy;
    
        return $this;
    }

    /**
     * Get createdBy
     *
     * @return \Cta\AisheBundle\Entity\User 
     */
    public function getCreatedBy()
    {
        return $this->createdBy;
    }

    /**
     * Set modifiedBy
     *
     * @param \Cta\AisheBundle\Entity\User $modifiedBy
     * @return Base
     */
    public function setModifiedBy(\Cta\AisheBundle\Entity\User $modifiedBy = null)
    {
        $this->modifiedBy = $modifiedBy;
    
        return $this;
    }

    /**
     * Get modifiedBy
     *
     * @return \Cta\AisheBundle\Entity\User 
     */
    public function getModifiedBy()
    {
        return $this->modifiedBy;
    }
}
