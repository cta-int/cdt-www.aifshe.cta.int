<?php

namespace Cta\Admin\AisheBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->forward('CtaAdminAisheBundle:Criterion:overview');
    }
}
