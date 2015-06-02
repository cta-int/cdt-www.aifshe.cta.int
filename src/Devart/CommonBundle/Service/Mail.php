<?php

namespace Devart\CommonBundle\Service;

use Symfony\Component\DependencyInjection\ContainerInterface;

/**
 * Class Mail
 * @package Devart\CommonBundle\Service
 */
class Mail
{
    protected $defaultTemplate = 'DevartCommonBundle:Mails:Templates/default.html.twig';

    private $_container;

    public function __construct(ContainerInterface $container)
    {
        $this->_container = $container;
    }

    /**
     * @param string $template
     * @param array $parameters
     * @return mixed
     */
    public function getMessage($template = '', $parameters = array())
    {

        if ($template == '') {
            $template = $this->defaultTemplate;
        }

        $template = $this->_container->get('twig')->loadTemplate($template); // Define your own schema

        $blocks = $template->getBlocks(); // this is needed to render all the blocks inside the parent blocks.

        $subject = $template->renderBlock('subject', $parameters, $blocks);
        $bodyText = $template->renderBlock('body_text', $parameters, $blocks);
        $bodyHtml = $template->renderBlock('body_html', $parameters, $blocks);

        $message = \Swift_Message::newInstance()
            ->setSubject($subject)
            ->setBody($bodyText, 'text/plain')
            ->addPart($bodyHtml, 'text/html');

        $message->setFrom($this->_container->getParameter('app_email'));

        return $message;
    }
}