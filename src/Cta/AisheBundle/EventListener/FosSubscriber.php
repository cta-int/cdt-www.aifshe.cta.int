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
use Cta\AisheBundle\Model\UserManager;
use Devart\CommonBundle\Service\Mail as MailMessageService;
use FOS\UserBundle\Event\FilterUserResponseEvent;
use FOS\UserBundle\FOSUserEvents;
use FOS\UserBundle\Event\FormEvent;
use FOS\UserBundle\Doctrine\GroupManager;
use Swift_Mailer;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

/**
 * Listener responsible for adding the default user role at registration
 */

class FosSubscriber implements EventSubscriberInterface
{
    /**
     * @var GroupManager
     */
    private $groupManager;
    
    /**
     * @var UserManager
     */
    private $userManager;
    
    /**
     * @var Swift_Mailer
     */
    private $mailerService;
    
    /**
     * @var MailMessageService
     */
    private $mailMessageService;

    /**
     * @param GroupManager       $gm
     * @param UserManager        $userManager
     * @param MailMessageService $mailMessageService
     * @param                    $mailerService
     */
    public function __construct(GroupManager $gm, UserManager $userManager, MailMessageService $mailMessageService, Swift_Mailer $mailerService)
    {
        $this->groupManager = $gm;
        $this->userManager = $userManager;
        $this->mailerService = $mailerService;
        $this->mailMessageService = $mailMessageService;
    }

    /**
     * @return array
     */
    public static function getSubscribedEvents()
    {
        return array(
            FOSUserEvents::REGISTRATION_SUCCESS => 'onRegistrationSuccess',
            FOSUserEvents::REGISTRATION_CONFIRMED => 'onRegistrationConfirmed',
        );
    }

    /**
     * @param FormEvent $event
     */
    public function onRegistrationSuccess(FormEvent $event)
    {
        /** @var User $user */
        $user = $event->getForm()->getData();

        // set user to locked (until an admin approves the registration)
        $user->setLocked(true);

        // add the default group
        $user->addGroup($this->groupManager->findGroupByName('USER'));
    }

    /**
     * @param FilterUserResponseEvent $event
     */
    public function onRegistrationConfirmed(FilterUserResponseEvent $event)
    {
        /** @var User $user */
        $user = $event->getUser();

        $message = $this->mailMessageService->getMessage('CtaAisheBundle:Mails:FOS/Registration/RequestAccess.html.twig', array(
            'user' => $user
        ));

        $adminsGroup = $this->userManager->findOverviewByGroup('ADMIN');

        /** @var User $admin */
        foreach($adminsGroup['items'] as $admin){
            $message->addTo($admin->getEmail());
        }

        $this->mailerService->send($message);
    }

}