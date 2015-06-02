<?php

namespace Cta\AisheBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
//        return $this->forward('CtaAisheBundle:Report:overview', array(
//            'page'  => 1,
//        ));
        return $this->render('CtaAisheBundle:Default:index.html.twig'/*, array(
            'reports'   => $reports['items'],
            'page'      => $page,
            'lastPage'  => ceil($reports['count'] / self::ITEMS_PER_PAGE),
        )*/);
    }
}
