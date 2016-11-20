<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 9/9/13
 * Time: 8:47 AM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\Admin\AisheBundle\Controller;

use Cta\AisheBundle\Entity\Criterion;
use Cta\AisheBundle\Entity\CriterionTranslation;
use Cta\AisheBundle\Model\Data;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class CriterionController extends Controller
{
    /**
     * @param Request $request
     *
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function overviewAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        return $this->render('CtaAdminAisheBundle:Criterion:overview.html.twig', array(
            'criteria'  => $em->getRepository('CtaAisheBundle:Criterion')->findOverview(Data::getLanguageCodes($request->getLocale())),
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

        $criterion = $em->getRepository('CtaAisheBundle:Criterion')->find($id);
        if (!$criterion) {
            $criterion = new Criterion();
        }

        $form = $this->createForm('criterion', $criterion);

        foreach ($criterion->getCriterionTranslations() as $critTran) {
            $form->get(Data::getLanguages($critTran->getLang()))->setData($critTran->getValue());
        }

        $form->handleRequest($request);
        if ($form->isValid()) {
            $em->persist($criterion);

            $criterion->setModifiedAt(new \DateTime());
            $criterion->setModifiedBy($this->getUser());

            foreach (Data::getLanguages() as $langKey => $langVal) {
                $langFound = false;
                foreach ($criterion->getCriterionTranslations() as $critTran) {
                    if ($critTran->getLang() == $langKey) {
                        $critTran->setValue($form->get($langVal)->getData());

                        $langFound = true;
                        break;
                    }
                }
                if (!$langFound) {
                    $critTran = new CriterionTranslation();
                    $critTran->setLang($langKey);
                    $critTran->setValue($form->get($langVal)->getData());
                    $critTran->setCriterion($criterion);

                    $em->persist($critTran);
                }
            }

            $em->flush();

            $this->addFlash(
                'notice',
                $this->get('translator')->trans(
                    'form.flash.notice',
                    array('%subject%' => $criterion->getChapterNr())
                )
            );

            return $this->redirect($this->generateUrl('cta_admin_aishe_criterion_overview'));
        }

        return $this->render('CtaAdminAisheBundle:Criterion:edit.html.twig', array(
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
        $em->getRepository('CtaAisheBundle:Criterion')->delete($id);

        $this->addFlash(
            'notice',
            $this->get('translator')->trans('criterion.deleted')
        );

        return $this->redirect($this->generateUrl('cta_admin_aishe_criterion_overview'));
    }

}