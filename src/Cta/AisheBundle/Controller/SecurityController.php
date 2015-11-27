<?php

namespace Cta\AisheBundle\Controller;

use FOS\UserBundle\Controller\SecurityController as FosSecurityController;
use Symfony\Component\HttpFoundation\Request;

class SecurityController extends FosSecurityController
{
    public function loginAction(Request $request)
    {
        $homePages = array('/', '/en/', '/fr/');

        if (!in_array($_SERVER['REQUEST_URI'], $homePages)) {
            return $this->redirectToRoute('cta_aishe_homepage');
        }

        return parent::loginAction($request);
    }
}
