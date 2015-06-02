<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 9/9/13
 * Time: 8:44 AM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\Admin\AisheBundle\Controller;

use Cta\AisheBundle\Model\Data;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Cta\AisheBundle\Entity\Page;
use Cta\AisheBundle\Entity\PageTranslation;

class PageController extends Controller
{

    public function overviewAction()
    {
        $em = $this->getDoctrine()->getManager();
        return $this->render('CtaAdminAisheBundle:Page:overview.html.twig', array(
            'pages' => $em->getRepository('CtaAisheBundle:Page')->findAllWithoutTranslations(),
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

        $page = $em->getRepository('CtaAisheBundle:Page')->findById($id);
        if (!$page) {
            $page = new Page();
        }

        $form = $this->createForm('page', $page);
        $form->handleRequest($request);
        if ($form->isValid()) {
            $em->persist($page);
            $em->flush();

            $this->get('session')->getFlashBag()->add(
                'notice',
                $this->get('translator')->trans(
                    'form.flash.notice',
                    array('%subject%' => $page->getIdentifier())
                )
            );

            return $this->redirect($this->generateUrl('cta_admin_aishe_page_overview'));
        }

        return $this->render('CtaAdminAisheBundle:Page:edit.html.twig', array(
            'form'  => $form->createView(),
        ));
    }

    public function editTranslationAction(Request $request, $id, $lang)
    {
        $em = $this->getDoctrine()->getManager();

        $page = $em->getRepository('CtaAisheBundle:Page')->findById($id);
        $pageTranslation = $em->getRepository('CtaAisheBundle:PageTranslation')->findByPageAndLanguage($id, Data::getLanguageCodes($lang));
        if (!$pageTranslation) {
            $pageTranslation = new PageTranslation();
        }

        $form = $this->createForm('page_translation', $pageTranslation);
        $form->handleRequest($request);
        if ($form->isValid()) {

            $pageTranslation->setLang(Data::getLanguageCodes($lang));
            $pageTranslation->setPage($page);

            $em->persist($pageTranslation);

            $page->setModifiedAt(new \DateTime());
            $page->setModifiedBy($this->container->get('security.context')->getToken()->getUser());

            $em->flush();

            $this->get('session')->getFlashBag()->add(
                'notice',
                $this->get('translator')->trans(
                    'form.flash.notice',
                    array('%subject%' => $page->getIdentifier())
                )
            );

            return $this->redirect($this->generateUrl('cta_admin_aishe_page_overview'));
        }

        return $this->render('CtaAdminAisheBundle:Page:editTranslation.html.twig', array(
            'form'  => $form->createView(),
            'page'  => $page,
        ));
    }

    /**
     * We will not support deletion of pages, because aishe needs a few static pages
     */
    public function deleteAction()
    {
        // nothing !!!
    }
}