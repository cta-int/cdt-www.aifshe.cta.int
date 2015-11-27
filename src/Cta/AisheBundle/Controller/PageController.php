<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 8/27/13
 * Time: 9:17 AM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\AisheBundle\Controller;

use Doctrine\ORM\EntityNotFoundException;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Cta\AisheBundle\Model\Data;

class PageController extends Controller
{
    /**
     * @param Request $request
     * @param $identifier
     *
     * @return \Symfony\Component\HttpFoundation\Response
     *
     */
    public function viewAction(Request $request, $identifier)
    {
        return $this->render('CtaAisheBundle:Page:view.html.twig', array(
            'page' => $this->findFor($request, $identifier),
        ));
    }

    /**
     * @param Request $request
     * @param $identifier
     *
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function partAction(Request $request, $identifier)
    {
        try {
            $page = $this->findFor($request, $identifier);
        } catch (EntityNotFoundException $e) {
            $page = $this->findFor($request, $identifier, Data::LANG_ENGLISH);
        }

        return $this->render('CtaAisheBundle:Page:part.html.twig', array(
            'page' => $page,
        ));
    }

    /**
     * @param Request $request
     * @param $identifier
     * @param null $language
     *
     * @return mixed
     */
    private function findFor(Request $request, $identifier, $language = null)
    {
        if (is_null($language)) {
            $language = Data::getLanguageCodes($request->getLocale());
        }

        $em = $this->getDoctrine()->getManager();
        $repo = $em->getRepository('CtaAisheBundle:Page');

        return $page = $repo->findByIdentifier($identifier, $language);
    }
}