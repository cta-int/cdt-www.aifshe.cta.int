<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 9/9/13
 * Time: 8:47 AM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\AisheBundle\Controller;

use Cta\AisheBundle\Entity\Institution;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class InstitutionController extends Controller
{
    const ITEMS_PER_PAGE = 20;

    /**
     * @param $page
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function overviewAction($page)
    {
        $params             = array();
        $params['start']    = ($page - 1) * self::ITEMS_PER_PAGE;
        $params['limit']    = self::ITEMS_PER_PAGE;

        $em = $this->getDoctrine()->getManager();
        $institutions = $em->getRepository('CtaAisheBundle:Institution')->findOverview($params);

        if ($page > 1 && $institutions['count'] < 1) {
            return $this->redirect($this->generateUrl('cta_aishe_institution_overview'));
        }

        return $this->render('CtaAisheBundle:Institution:overview.html.twig', array(
            'institutions'  => $institutions['items'],
            'page'      => $page,
            'lastPage'  => ceil($institutions['count'] / self::ITEMS_PER_PAGE),
        ));
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Symfony\Component\HttpFoundation\RedirectResponse|\Symfony\Component\HttpFoundation\Response
     */
    public function editAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $institution = $em->getRepository('CtaAisheBundle:Institution')->find($id);
        if (!$institution) {
            $institution = new Institution();
        }

        $form = $this->createForm('institution', $institution);
        $form->handleRequest($request);
        if ($form->isValid()) {
            $em->persist($institution);
            $em->flush();

            $this->get('session')->getFlashBag()->add(
                'notice',
                $this->get('translator')->trans(
                    'form.flash.notice',
                    array('%subject%' => $institution->getName())
                )
            );

            return $this->redirect($this->generateUrl('cta_aishe_institution_overview'));
        }

        return $this->render('CtaAisheBundle:Institution:edit.html.twig', array(
               'form'  => $form->createView(),
        ));
    }

    /**
     * @param $id
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function deleteAction($id)
    {
        $em = $this->getDoctrine()->getManager();
        $em->getRepository('CtaAisheBundle:Institution')->delete($id);

        $this->get('session')->getFlashBag()->add(
            'notice',
            $this->get('translator')->trans('institution.deleted')
        );

        return $this->redirect($this->generateUrl('cta_aishe_institution_overview'));
    }

}