<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 8/27/13
 * Time: 9:17 AM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\AisheBundle\Controller;

use Cta\AisheBundle\Model\Data;
use Doctrine\ORM\EntityNotFoundException;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Config\Definition\Exception\Exception;

class ExportController extends Controller
{
    private $_report;
    private $_criteria;
    private $_info;
    private $_generalData;

    /**
     * @param $id
     * @param $type
     * @return \Symfony\Component\HttpFoundation\Response
     * @throws \Doctrine\ORM\EntityNotFoundException
     * @throws \Symfony\Component\Security\Core\Exception\AccessDeniedException
     */
    public function indexAction($id, $type)
    {
        $em = $this->getDoctrine()->getManager();
        $this->_report = $em->getRepository('CtaAisheBundle:Report')->findForShow($id, Data::getLanguageCodes($this->getRequest()->getLocale()));

        if (!$this->_report) {
            throw new EntityNotFoundException();
        }

        if (false === $this->get('security.context')->isGranted('ROLE_ADMIN')) {
            if (true === $this->get('security.context')->isGranted('ROLE_AUDITOR')) {
                if ($this->_report['createdBy']['id'] != $this->get('security.context')->getToken()->getUser()->getId() &&
                    $this->_report['institution']['id'] != $this->get('security.context')->getToken()->getUser()->getInstitution()->getId()) {
                    throw new AccessDeniedException('Auditor is not allowed to export this report');
                }
            } else {
                if ($this->_report['createdBy']['id'] != $this->get('security.context')->getToken()->getUser()->getId()) {
                    $specialAccess = false;
                    foreach ($this->_report['users'] as $privilegedUser) {
                        if ($privilegedUser['id'] ==  $this->get('security.context')->getToken()->getUser()->getId()) {
                            $specialAccess = true;
                        }
                    }
                    if (!$specialAccess) {
                        throw new AccessDeniedException('User is not allowed to export this report');
                    }
                }
            }
        }

        $this->_criteria = $em->getRepository('CtaAisheBundle:Criterion')->findOverview(Data::getLanguageCodes($this->getRequest()->getLocale()));
        $this->_info = $em->getRepository('CtaAisheBundle:Page')->findByIdentifier('report_info', Data::getLanguageCodes($this->getRequest()->getLocale()));
        $this->_generalData = Data::getGeneralData($this->_report, $em->getRepository('CtaAisheBundle:Certification')->findForShow());

        switch (strtolower($type)) {
//Disable DOCX export
//            case 'docx':
//                return $this->_toDOCX();
//                break;
            case 'pdf':
                return $this->_toPDF();
                break;
            default:
                throw new Exception("Export for file format [{$type}] not supported.");
                break;
        }
    }

    private function _toDOCX()
    {
        // make readable
        $s = function($val) {
            if (is_null($val)) {
                return "";
            } else if ($val instanceof \DateTime) {
                return $val->format('Y-m-d');
            }

            return $val;
        };

        $t = $this->get('translator');
        $content = array(
            't' => array( // translation
                'r' => array( // report
                    'institution'           => $t->trans('report.institution'),
                    'department'            => $t->trans('report.department'),
                    'auditor'               => $t->trans('report.auditor'),
                    'coordinator'           => $t->trans('report.coordinator'),
                    'nrOfParticipants'      => $t->trans('report.nrOfParticipants'),
                    'secretary'             => $t->trans('report.secretary'),
                    'dateAssessment'        => $t->trans('report.dateAssessment'),
                    'dateLatestAssessment'  => $t->trans('report.dateLatestAssessment'),
                    'dateDesiredSituation'  => $t->trans('report.dateDesiredSituation'),
                ),
                'g' => array(
                    'h' => array(
                        'indicators'=> $t->trans('base.globalIndicators'),
                        'present'   => $t->trans('report.item.currentSituation'),
                        'desired'   => $t->trans('report.item.desiredSituation'),
                    ),
                    'median'    => $t->trans('base.median'),
                    'balance'   => $t->trans('base.planDoBalance'),
                    'ambition'  => $t->trans('base.policyAmbition'),
                    'cert1'     => $t->trans('base.distanceToCertification') . ' ' . $t->trans('base.certification.1'),
                    'cert2'     => $t->trans('base.distanceToCertification') . ' ' . $t->trans('base.certification.2'),
                    'cert3'     => $t->trans('base.distanceToCertification') . ' ' . $t->trans('base.certification.3'),
                    'cert4'     => $t->trans('base.distanceToCertification') . ' ' . $t->trans('base.certification.4'),
                ),
            ),
            'r' => array( // report
                'institution'           => $s($this->_report['institution']['name']),
                'department'            => $s($this->_report['department']),
                'auditor'               => $s($this->_report['createdBy']['username']),
                'coordinator'           => $s($this->_report['coordinator']),
                'nrOfParticipants'      => $s($this->_report['nrOfParticipants']),
                'secretary'             => $s($this->_report['secretary']),
                'dateAssessment'        => $s($this->_report['dateAssessment']),
                'dateLatestAssessment'  => $s($this->_report['dateLatestAssessment']),
                'dateDesiredSituation'  => $s($this->_report['dateDesiredSituation']),
            ),
        );

        foreach ($this->_criteria as $criterion) {

            // criterion header
            $content['t']['cr'][$criterion['chapterNr']][0] = "{$criterion['chapterNr']} ".
                (count($criterion['criterionTranslations']) ? $criterion['criterionTranslations'][0]['value']:"");

            foreach ($criterion['criterionItems'] as $criterionItem) {

                // check if we have some data for this item
                foreach ($this->_report['reportItems'] as $item) {
                    $checked = null;
                    $currentSituation = null;
                    $desiredSituation = null;
                    $currentSituationDesc = '';
                    $desiredSituationDesc = '';
                    if ($item['criterionItem']['id'] == $criterionItem ['id']) {
                        $checked = $item['hasHighPriority'];
                        $currentSituation = $item['currentSituationRating'];
                        $desiredSituation = $item['desiredSituationRating'];
                        $currentSituationDesc = $item['currentSituationComment'];
                        $desiredSituationDesc = $item['desiredSituationComment'];
                        break;
                    }
                }

                // Set the translated criterion item name
                $content['t']['cr'][$criterion['chapterNr']][$criterionItem['paragraphNr']] =
                    "{$criterion['chapterNr']}.{$criterionItem['paragraphNr']} " .
                    ((count($criterionItem['criterionItemTranslations'])) ?
                        $criterionItem['criterionItemTranslations'][0]['value']:'');

                // loop over the criterion item scores
                for ($i = 0; $i <= 5; $i += 0.5) {
                    if ($i != 0.5) { // 0.5 is not a used score
                        $index = strpos($i, '.') === FALSE ? $i . '0':str_replace('.', '', $i);

                        $value = '';
                        if (!is_null($currentSituation) && !is_null($desiredSituation)) {
                            if ($i == $currentSituation && $i == $desiredSituation) {
                                $value = 'o';
                            } else if ($i == $currentSituation) {
                                $value = 'o';
                            } else if ($i == $desiredSituation) {
                                $value = '>';
                            } else if ($i > $currentSituation && $i < $desiredSituation) {
                                $value = '-';
                            }

                            // make it prettier
                            if (strpos($i, '.') === FALSE) { // it no 0.5, so it will have a bigger box
                                switch ($value) {
                                    case 'o':
                                        $value = ($i == $currentSituation && $i == $desiredSituation)? 'o':'o-'; // we dont want to add the extra '-' when there's only 1 field filled in
                                        break;
                                    case '>':
                                        $value = '->';
                                        break;
                                    case '-':
                                        $value = '---';
                                        break;
                                }
                            }
                        }

                        $content['cr']["{$criterion['chapterNr']}{$criterionItem['paragraphNr']}{$index}"] = $value;
                    }
                }
                $content['cr']["{$criterion['chapterNr']}{$criterionItem['paragraphNr']}p"] = $checked ? '*':'';
                $content['cr']["{$criterion['chapterNr']}{$criterionItem['paragraphNr']}pt"] = $checked ?
                    $t->trans('report.item.hasHighPriority'):'';
                $content['cr']["{$criterion['chapterNr']}{$criterionItem['paragraphNr']}c"] =
                    $t->trans('report.item.currentSituation') . ': ' . $t->trans('report.item.stage.' . $currentSituation);
                $content['cr']["{$criterion['chapterNr']}{$criterionItem['paragraphNr']}cd"] = $currentSituationDesc;
                $content['cr']["{$criterion['chapterNr']}{$criterionItem['paragraphNr']}d"] =
                    $t->trans('report.item.desiredSituation') . ': ' . $t->trans('report.item.stage.' . $desiredSituation);
                $content['cr']["{$criterion['chapterNr']}{$criterionItem['paragraphNr']}dd"] = $desiredSituationDesc;
            }
        }

        // set general data
        $content['g']['medianp'] = $this->_generalData['median']['current'];
        $content['g']['mediand'] = $this->_generalData['median']['desired'];
        $content['g']['balancep'] = $this->_generalData['planDoBalance']['current'];
        $content['g']['balanced'] = $this->_generalData['planDoBalance']['desired'];
        $content['g']['ambitionp'] = $this->_generalData['policyAmbition']['current'];
        $content['g']['ambitiond'] = $this->_generalData['policyAmbition']['desired'];
        $content['g']['cert1p'] = $this->_generalData['certification.1']['current'];
        $content['g']['cert1d'] = $this->_generalData['certification.1']['desired'];
        $content['g']['cert2p'] = $this->_generalData['certification.2']['current'];
        $content['g']['cert2d'] = $this->_generalData['certification.2']['desired'];
        $content['g']['cert3p'] = $this->_generalData['certification.3']['current'];
        $content['g']['cert3d'] = $this->_generalData['certification.3']['desired'];
        $content['g']['cert4p'] = $this->_generalData['certification.4']['current'];
        $content['g']['cert4d'] = $this->_generalData['certification.4']['desired'];


        // get the service
        $TBS = $this->container->get('opentbs');
        // load your template
        $TBS->LoadTemplate($this->get('kernel')->getRootDir() . '/../static/template.docx');
        // replace variables
        $TBS->MergeField('c', $content);
        // send the file
        $TBS->Show(OPENTBS_DOWNLOAD, "{$this->_report['name']}.docx");
    }

    private function _toPDF()
    {
        $pdf = $this->container->get("white_october.tcpdf")->create();
        // set document information
        $pdf->SetCreator(PDF_CREATOR);
        $pdf->SetAuthor(
            (array_key_exists('createdBy', $this->_report) &&
                is_array($this->_report['createdBy']) &&
                array_key_exists('username', $this->_report['createdBy'])) ?
                $this->_report['createdBy']['username'] : 'AIFSHE'
        );
        $pdf->SetTitle($this->_report['name']);
        $pdf->SetSubject("AIFSHE Report [{$this->_report['name']}]" . (
            (array_key_exists('institution', $this->_report) &&
                is_array($this->_report['institution']) &&
                array_key_exists('name', $this->_report['institution'])) ?
                " for university: {$this->_report['institution']['name']}." : ""
            ));
        $pdf->SetKeywords("AIFSHE, {$this->_report['name']}, " .
            (
                (array_key_exists('institution', $this->_report) &&
                    is_array($this->_report['institution']) &&
                    array_key_exists('name', $this->_report['institution'])) ?
                    $this->_report['institution']['name'] : ""
            ) .
            ", {$this->_report['department']}");

        // remove default header/footer
        $pdf->setPrintHeader(false);
        $pdf->setPrintFooter(false);

        // set default monospaced font
        $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

        // set margins
        $pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);

        // set auto page breaks
        $pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

        // set image scale factor
        $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

        $tags = array(
            'p'     => array(0 => array('h' => '', 'n' => 0), 1 => array('h' => '', 'n' => 0)),
            'table' => array(0 => array('h' => '', 'n' => 0), 1 => array('h' => '', 'n' => 0)),
            'span'  => array(0 => array('h' => '', 'n' => 0), 1 => array('h' => '', 'n' => 0)),
            'img'   => array(0 => array('h' => '', 'n' => 0), 1 => array('h' => '', 'n' => 0)),
            'div'   => array(0 => array('h' => '', 'n' => 0), 1 => array('h' => '', 'n' => 0)),
            'hr'    => array(0 => array('h' => '', 'n' => 0), 1 => array('h' => '', 'n' => 0)),
            'tr'    => array(0 => array('h' => '', 'n' => 0), 1 => array('h' => '', 'n' => 0)),
            'td'    => array(0 => array('h' => '', 'n' => 0), 1 => array('h' => '', 'n' => 0)),
            'h1'    => array(0 => array('h' => '', 'n' => 0), 1 => array('h' => '', 'n' => 0)),
            'h2'    => array(0 => array('h' => '', 'n' => 0), 1 => array('h' => '', 'n' => 0)),
        );
        $pdf->setHtmlVSpace($tags);
        $pdf->setCellPaddings(0,0,0,0);

        // ---------------------------------------------------------

        // set font
        $pdf->SetFont('helvetica', '', 10);

        // add a page

        // load the HTML for this report
        $pages[] = $this->renderView(
            'CtaAisheBundle:Export:pdf.html.twig',
            array(
                'report'      => $this->_report,
                'criteria'    => $this->_criteria,
                'info'        => $this->_info,
                'generalData' => $this->_generalData,
            )
        );

        $pages[] = $this->renderView(
            'CtaAisheBundle:Export/_pdf:report_stages.html.twig',
            array(
                'report'      => $this->_report,
                'criteria'    => $this->_criteria,
                'info'        => $this->_info,
                'generalData' => $this->_generalData,
            )
        );

         // output the HTML content
        foreach($pages as $page){
            $pdf->AddPage();
            $pdf->writeHTML($page, true, false, true, false, '');
        }
        // reset pointer to the last page
        $pdf->lastPage();

        // ---------------------------------------------------------

        //Close and output PDF document
        $pdf->Output("{$this->_report['name']}.pdf", 'I'); // I = inline, D = Force download
    }

}