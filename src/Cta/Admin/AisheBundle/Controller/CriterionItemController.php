<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 9/9/13
 * Time: 8:47 AM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\Admin\AisheBundle\Controller;

use Cta\AisheBundle\Entity\CertificationRequirement;
use Cta\AisheBundle\Entity\CriterionItem;
use Cta\AisheBundle\Entity\CriterionItemTranslation;
use Cta\AisheBundle\Model\Data;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class CriterionItemController extends Controller
{
    /**
     * @param Request $request
     * @param         $criterionId
     *
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function overviewAction(Request $request, $criterionId)
    {
        $em = $this->getDoctrine()->getManager();
        return $this->render('CtaAdminAisheBundle:CriterionItem:overview.html.twig', array(
            'criterion' => $em->getRepository('CtaAisheBundle:Criterion')->findOverview(Data::getLanguageCodes($request->getLocale()), $criterionId),
        ));
    }

    public function editTranslationAction(Request $request, $criterionId, $criterionItemId, $lang)
    {
        $em = $this->getDoctrine()->getManager();

        $criterion                  = $em->getRepository('CtaAisheBundle:Criterion')->find($criterionId);
        $criterionItem              = $em->getRepository('CtaAisheBundle:CriterionItem')->find($criterionItemId);
        $criterionItemTranslation   = $em->getRepository('CtaAisheBundle:CriterionItemTranslation')->findOneBy(array(
            'lang' => Data::getLanguageCodes($lang),
            'criterionItem' => $criterionItemId
        ));
        if (!$criterionItemTranslation) {
            $criterionItemTranslation = new CriterionItemTranslation();
        }

        $form = $this->createForm('criterion_item_translation', $criterionItemTranslation);

        $form->handleRequest($request);
        if ($form->isValid()) {
            $criterionItemTranslation->setCriterionItem($criterionItem);
            $criterionItemTranslation->setLang(Data::getLanguageCodes($lang));

            $em->persist($criterionItemTranslation);

            $criterionItem->setModifiedAt(new \DateTime());
            $criterionItem->setModifiedBy($this->getUser());

            $em->flush();

            $this->addFlash(
                'notice',
                $this->get('translator')->trans(
                    'form.flash.notice',
                    array('%subject%' => $criterion->getChapterNr() . '.' . $criterionItem->getParagraphNr() . '. ' . $criterionItemTranslation->getValue())
                )
            );

            return $this->redirect($this->generateUrl('cta_admin_aishe_criterion_item_overview', array('criterionId' => $criterionId)));
        }

        //criterion_item_translation
        return $this->render('CtaAdminAisheBundle:CriterionItem:edit_translation.html.twig', array(
            'form'          => $form->createView(),
            'criterion'     => $criterion,
            'criterionItem' => $criterionItem,
        ));
    }

    /**
     * @param Request $request
     * @param $criterionId
     * @param $id
     * @return \Symfony\Component\HttpFoundation\RedirectResponse|\Symfony\Component\HttpFoundation\Response
     */
    public function editAction(Request $request, $criterionId, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $criterion      = $em->getRepository('CtaAisheBundle:Criterion')->find($criterionId);
        $criterionItem  = $em->getRepository('CtaAisheBundle:CriterionItem')->find($id);
        if (!$criterionItem) {
            $criterionItem = new CriterionItem();
        }

        $form = $this->createForm('criterion_item', $criterionItem);

        foreach ($criterionItem->getCertificationRequirements() as $certReq) {
            $form->get(str_replace('.','_',$certReq->getCertification()->getName()))->setData($certReq->getStage());
        }

        $form->handleRequest($request);
        if ($form->isValid()) {
            $criterionItem->setCriterion($criterion);

            $em->persist($criterionItem);

            $criterionItem->setModifiedAt(new \DateTime());
            $criterionItem->setModifiedBy($this->getUser());

            $certs = $em->getRepository('CtaAisheBundle:Certification')->findAll();
            foreach ($certs as $cert) {
                $certFound = false;
                $stage = $form->get(str_replace('.','_',$cert->getName()))->getData();
                $stage = $stage < 1 ? 0 : $stage;
                $stage = $stage > 4 ? 4 : $stage;
                foreach ($criterionItem->getCertificationRequirements() as $certReq) {
                    if ($certReq->getCertification()->getId() == $cert->getId()) {
                        $certReq->setStage($stage);

                        $certFound = true;
                        break;
                    }
                }
                if (!$certFound) {
                    $certReq = new CertificationRequirement();
                    $certReq->setStage($stage);
                    $certReq->setCertification($cert);
                    $certReq->setCriterionItem($criterionItem);

                    $em->persist($certReq);
                }
            }

            $em->flush();

            $this->addFlash(
                'notice',
                $this->get('translator')->trans(
                    'form.flash.notice',
                    array('%subject%' => $criterion->getChapterNr() . '.' . $criterionItem->getParagraphNr())
                )
            );

            return $this->redirect($this->generateUrl('cta_admin_aishe_criterion_item_overview', array('criterionId' => $criterionId)));
        }

        return $this->render('CtaAdminAisheBundle:CriterionItem:edit.html.twig', array(
            'form'  => $form->createView(),
        ));
    }

    /**
     * @param $criterionId
     * @param $id
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function deleteAction($criterionId, $id)
    {
        $em = $this->getDoctrine()->getManager();
        $em->getRepository('CtaAisheBundle:CriterionItem')->delete($id);

        $this->addFlash(
            'notice',
            $this->get('translator')->trans('criterion.item.deleted')
        );

        return $this->redirect($this->generateUrl('cta_admin_aishe_criterion_item_overview', array('criterionId' => $criterionId)));
    }

}