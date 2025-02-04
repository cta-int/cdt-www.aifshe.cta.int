<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 9/9/13
 * Time: 8:17 AM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\AisheBundle\EventListener;

use Cta\AisheBundle\Entity\User;
use FOS\UserBundle\FOSUserEvents;
use FOS\UserBundle\Event\FilterUserResponseEvent;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

/**
 * Listener responsible for adding the default user role at registration
 */

class FosRequestAuditor implements EventSubscriberInterface
{

    /**
     * @var
     */
    private $_container;

    /**
     * @param ContainerInterface $container
     */
    public function __construct(ContainerInterface $container)
    {
        $this->_container = $container;
    }

    /**
     * @return array
     */
    public static function getSubscribedEvents()
    {
        return array(
            FOSUserEvents::REGISTRATION_COMPLETED => 'onRegistrationComplete',
        );
    }

    /**
     * @param FilterUserResponseEvent $event
     * @param $eventName
     * @param $dispatcher
     */
    public function onRegistrationComplete(FilterUserResponseEvent $event, $eventName, $dispatcher)
    {
        /** @var User $user */
        $user = $event->getUser();

        if($user->getRequestAuditor()){
            $message = $this->_container->get('devart.mail')->getMessage('CtaAisheBundle:Mails:FOS/Registration/RequestAuditor.html.twig', array(
                'user' => $user
            ));

            $userManager = $this->_container->get('fos_user.user_manager');
            $adminsGroup = $userManager->findOverviewByGroup('ADMIN');

            /** @var User $admin */
            foreach($adminsGroup['items'] as $admin){
                $message->addTo($admin->getEmail());
            }

            $this->_container->get('mailer')->send($message);
        }
    }

}