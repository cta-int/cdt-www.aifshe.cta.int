<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 9/9/13
 * Time: 8:17 AM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\AisheBundle\EventListener;

use FOS\UserBundle\FOSUserEvents;
use FOS\UserBundle\Event\FormEvent;
use FOS\UserBundle\Doctrine\GroupManager;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

/**
 * Listener responsible for adding the default user role at registration
 */

class FosSubscriber implements EventSubscriberInterface
{
    private $_gm;

    /**
     * @param GroupManager $gm
     */
    public function __construct(GroupManager $gm)
    {
        $this->_gm = $gm;
    }

    /**
     * @return array
     */
    public static function getSubscribedEvents()
    {
        return array(
            FOSUserEvents::REGISTRATION_SUCCESS => 'onRegistrationSuccess',
        );
    }

    /**
     * @param FormEvent $event
     */
    public function onRegistrationSuccess(FormEvent $event)
    {
        $user = $event->getForm()->getData();
        $user->addGroup($this->_gm->findGroupByName('USER'));
    }

}