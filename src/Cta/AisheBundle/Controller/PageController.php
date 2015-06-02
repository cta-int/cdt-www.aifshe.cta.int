<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 8/27/13
 * Time: 9:17 AM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\AisheBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Cta\AisheBundle\Model\Data;

class PageController extends Controller
{
    /**
     * @param $identifier
     * @return mixed
     */
    public function viewAction($identifier)
    {
        $em     = $this->getDoctrine()->getManager();
        return $this->render('CtaAisheBundle:Page:view.html.twig', array(
            'page'   => $em->getRepository('CtaAisheBundle:Page')->findByIdentifier($identifier, Data::getLanguageCodes($this->getRequest()->getLocale())),
        ));
    }

}