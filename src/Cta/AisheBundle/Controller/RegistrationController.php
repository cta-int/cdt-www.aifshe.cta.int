<?php

namespace Cta\AisheBundle\Controller;

use FOS\UserBundle\Controller\RegistrationController as FosRegistrationController;

class RegistrationController extends FosRegistrationController
{
    public function confirmedAction()
    {
        return $this->render('FOSUserBundle:Registration:confirmed.html.twig');
    }
}
