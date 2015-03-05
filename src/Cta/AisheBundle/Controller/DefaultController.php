<?php

namespace Cta\AisheBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->forward('CtaAisheBundle:Report:overview', array(
            'page'  => 1,
        ));
    }
}
