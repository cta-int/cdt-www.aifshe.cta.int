<?php

namespace Cta\AisheBundle\Controller;

use FOS\UserBundle\Controller\SecurityController as FosSecurityController;
use Symfony\Component\HttpFoundation\Request;

class SecurityController extends FosSecurityController
{
    public function loginAction(Request $request)
    {
        if ($_SERVER['REQUEST_URI'] != '/') {
            return $this->redirectToRoute('cta_aishe_homepage');
        }

        return parent::loginAction($request);
    }
}
