<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 9/9/13
 * Time: 9:47 AM
 * To change this template use File | Settings | File Templates.
 */

namespace Devart\CommonBundle\Service;

class SecurityContext extends \Symfony\Component\Security\Core\SecurityContext
{
    /**
     * @return array of group entities
     */
    public function getGroups()
    {
        return $this->getToken()->getUser()->getGroups();
    }

    /**
     * @param $group
     * @return bool
     */
    public function inGroup($group)
    {
        $userGroups = $this->getGroups();
        foreach ($userGroups as $userGroup) {
            if ($userGroup->getName() == $group) {
                return true;
            }
        }
        return false;
    }
}