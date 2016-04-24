<?php
/**
 * Created by PhpStorm.
 * User: Roii
 * Date: 11/26/13
 * Time: 9:04 AM
 * Property of DEVart bvba
 */

namespace Cta\AisheBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Cta\AisheBundle\Model\Import;

class ImportController extends Controller
{
    const SESSION_REPORT = 'report';

    /**
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\RedirectResponse|\Symfony\Component\HttpFoundation\Response
     */
    public function indexAction(Request $request)
    {
        $form = $this->createFormBuilder(array())
            ->add('name', 'text', array('label' => 'report.name'))
            ->add('file', 'file', array('label' => 'report.file'))
            ->add('save', 'submit', array('label' => 'form.save'))
            ->getForm();

        $form->handleRequest($request);

        if ($form->isValid()) {
            $data = $form->getData();
            $import = new Import($this->get('cta.aishe.service.report'));

            /**
             * if import succeeded
             */
            if ($import->aisheToReport($data['name'], $data['file'])) {
                $this->addFlash(
                    'notice',
                    $this->get('translator')->trans(
                        'report.flash.notice',
                        array('%subject%' => $data['name'])
                    )
                );

                if($this->isGranted('ROLE_AUDITOR')){
                    $message = $this->get('devart.mail')->getMessage('CtaAisheBundle:Mails:Report/imported.html.twig', array(
                        'user'     => $this->getUser(),
                        'reportId' => $import->getReportId(),
                    ));

                    $userManager = $this->get('fos_user.user_manager');
                    $adminsGroup = $userManager->findOverviewByGroup('ADMIN');

                    foreach($adminsGroup['items'] as $admin){
                        $message->addTo($admin->getEmail());
                    }

                    $this->get('mailer')->send($message);
                }
                return $this->redirect($this->generateUrl('cta_aishe_report_data', array('id' => $import->getReportId())));
            }

            /**
             * else show errors
             */
            foreach ($import->getErrors() as $e) {
                $this->addFlash(
                    'error',
                    $this->get('translator')->trans(
                        'form.flash.error',
                        array('%subject%' => $e)
                    )
                );
            }
        }

        return $this->render('CtaAisheBundle:Import:index.html.twig', array(
            'form' => $form->createView(),
        ));
    }

    public function offlineAction(Request $request)
    {
        $session = $request->getSession();

        /* set report data to session of there is any */
        if ($report = $request->request->get('report')) {
            $session->set(self::SESSION_REPORT, $report);
        }

        /* handle security */
        if (false === $this->isGranted('IS_AUTHENTICATED_FULLY')) {
            // redirect to login
            $session->set('_security.main.target_path', $this->generateUrl('cta_aishe_report_import_offline'));
            return $this->redirect($this->generateUrl('fos_user_security_login'));
        } else if (true === $this->isGranted('ROLE_ADMIN')) {
            $this->addFlash(
                'error',
                $this->get('translator')->trans(
                    'form.flash.error',
                    array('%subject%' => 'creating a new report as an admin.')
                )
            );
            return $this->redirect($this->generateUrl('cta_aishe_report_overview'));
        }

        /* We are now logged in, check if there is anything in the session */
        if (!$session->has(self::SESSION_REPORT)) {
            /* nothing to import */
            return $this->render('CtaAisheBundle:Import:nodata.html.twig');
        }

        /* Everything looks fine so far, lets start importing */
        $import = new Import($this->get('cta.aishe.service.report'));

        $importSucceeded = $import->jsonToReport($session->get(self::SESSION_REPORT));
        $session->remove(self::SESSION_REPORT);

        if ($importSucceeded) {
            return $this->redirect($this->generateUrl('cta_aishe_report_data', array('id' => $import->getReportId())));
        } else {
            foreach ($import->getErrors() as $e) {
                $this->addFlash(
                    'error',
                    $this->get('translator')->trans(
                        'form.flash.error',
                        array('%subject%' => $e)
                    )
                );
            }
            return $this->redirect($this->generateUrl('cta_aishe_report_overview'));
        }
    }
}