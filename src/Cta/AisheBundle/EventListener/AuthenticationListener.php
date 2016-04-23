<?php
namespace Cta\AisheBundle\EventListener;

use FOS\UserBundle\EventListener\AuthenticationListener as FosAuthenticationListener;
use FOS\UserBundle\FOSUserEvents;

/**
 * Class AuthenticationListener
 *
 * Used to make sure a user is not being auto logged in after confirm his email address
 */
class AuthenticationListener extends FosAuthenticationListener
{
    /**
     * @inheritdoc
     */
    public static function getSubscribedEvents()
    {
        $events = parent::getSubscribedEvents();

        unset($events[FOSUserEvents::REGISTRATION_CONFIRMED]);

        return $events;
    }
}