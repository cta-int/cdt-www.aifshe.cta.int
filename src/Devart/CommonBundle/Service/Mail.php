<?php

namespace Devart\CommonBundle\Service;

use \Twig_Environment;
use \Twig_Template;

/**
 * Class Mail
 */
class Mail
{
    protected $defaultTemplate = 'DevartCommonBundle:Mails:Templates/default.html.twig';

    /** @var Twig_Environment */
    protected $twig;

    /** @var string */
    protected $appUrl;

    /** @var string */
    protected $mailFrom;

    public function __construct(Twig_Environment $twig, $appUrl, $mailFrom)
    {
        $this
            ->setTwig($twig)
            ->setAppUrl($appUrl)
            ->setMailFrom($mailFrom)
        ;
    }

    /**
     * @param string $template
     * @param array  $parameters
     *
     * @return mixed
     */
    public function getMessage($template = '', $parameters = array())
    {
        // get default template if none set
        if ($template == '') {
            $template = $this->getDefaultTemplate();
        }

        // add default params
        $parameters['appUrl'] = $this->getAppUrl();

        /** @var Twig_Template $template */
        $template = $this->getTwig()->loadTemplate($template);

        $blocks = $template->getBlocks(); // this is needed to render all the blocks inside the parent blocks.

        $subject  = $template->renderBlock('subject', $parameters, $blocks);
        $bodyText = $template->renderBlock('body_text', $parameters, $blocks);
        $bodyHtml = $template->renderBlock('body_html', $parameters, $blocks);

        $message = \Swift_Message::newInstance();
        $message
            ->addPart($bodyHtml, 'text/html')
            ->setFrom($this->getMailFrom())
            ->setSubject($subject)
            ->setBody($bodyText, 'text/plain')
        ;

        return $message;
    }

    /**
     * @return string
     */
    protected function getDefaultTemplate()
    {
        return $this->defaultTemplate;
    }

    /**
     * @param string $defaultTemplate
     *
     * @return $this
     */
    protected function setDefaultTemplate($defaultTemplate)
    {
        $this->defaultTemplate = $defaultTemplate;

        return $this;
    }

    /**
     * @return string
     */
    protected function getAppUrl()
    {
        return $this->appUrl;
    }

    /**
     * @param string $appUrl
     *
     * @return $this
     */
    protected function setAppUrl($appUrl)
    {
        $this->appUrl = $appUrl;

        return $this;
    }

    /**
     * @return string
     */
    protected function getMailFrom()
    {
        return $this->mailFrom;
    }

    /**
     * @param string $mailFrom
     *
     * @return $this
     */
    protected function setMailFrom($mailFrom)
    {
        $this->mailFrom = $mailFrom;

        return $this;
    }

    /**
     * @return Twig_Environment
     */
    protected function getTwig()
    {
        return $this->twig;
    }

    /**
     * @param Twig_Environment $twig
     *
     * @return $this
     */
    protected function setTwig($twig)
    {
        $this->twig = $twig;

        return $this;
    }
}