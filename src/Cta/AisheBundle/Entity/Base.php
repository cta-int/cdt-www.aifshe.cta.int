<?php

namespace Cta\AisheBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Base
 */
class Base extends \Devart\CommonBundle\Entity\Base
{
    /**
     * @var User
     */
    private $createdBy;

    /**
     * @var User
     */
    private $modifiedBy;


    /**
     * Set createdBy
     *
     * @param User $createdBy
     * @return Base
     */
    public function setCreatedBy(User $createdBy = null)
    {
        $this->createdBy = $createdBy;
    
        return $this;
    }

    /**
     * Get createdBy
     *
     * @return User 
     */
    public function getCreatedBy()
    {
        return $this->createdBy;
    }

    /**
     * Set modifiedBy
     *
     * @param User $modifiedBy
     * @return Base
     */
    public function setModifiedBy(User $modifiedBy = null)
    {
        $this->modifiedBy = $modifiedBy;
    
        return $this;
    }

    /**
     * Get modifiedBy
     *
     * @return User 
     */
    public function getModifiedBy()
    {
        return $this->modifiedBy;
    }
}
