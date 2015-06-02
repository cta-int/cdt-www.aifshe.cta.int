<?php


namespace Cta\Admin\AisheBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Cta\AisheBundle\Entity\OfflineTool;
use Cta\AisheBundle\Model\Data;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use ZipArchive;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\BinaryFileResponse;
use Symfony\Component\HttpFoundation\ResponseHeaderBag;

class OfflineToolController extends Controller
{
    /**
     *
     */
    const ITEMS_PER_PAGE = 20;
    /**
     * @var
     */
    private $_rootDir;
    /**
     * @var
     */
    private $_downloadsDir;
    /**
     * @var
     */
    private $_toolDir;

    /**
     * @param $page
     * @return \Symfony\Component\HttpFoundation\RedirectResponse|\Symfony\Component\HttpFoundation\Response
     */
    public function overviewAction($page)
    {
        if ($page <= 0) {
            $page = 1;
        }
        $em = $this->getDoctrine()->getManager();

        if ($this->get('security.context')->isGranted('ROLE_ADMIN')) {
            $params = array();
        }
        $params['start'] = ($page - 1) * self::ITEMS_PER_PAGE;
        $params['limit'] = self::ITEMS_PER_PAGE;

        $offlineTools = $em->getRepository('CtaAisheBundle:OfflineTool')->findOverview($params);

        if ($page > 1 && $offlineTools['count'] < 1) {
            return $this->redirect($this->generateUrl('cta_admin_offline_tool_overview'));
        }

        $path = $this->get('kernel')->getRootDir() . "/../shared/";
        foreach ($offlineTools['items'] as &$tool) {
            $tool['fileExists'] = file_exists($path . $tool['fileToken'] . '.zip');
        }
        return $this->render('CtaAdminAisheBundle:OfflineTool:overview.html.twig', array(
            'offlineTools' => $offlineTools['items'],
            'page' => $page,
            'lastPage' => ceil($offlineTools['count'] / self::ITEMS_PER_PAGE),
        ));
    }

    /**
     * @param $id
     * @return BinaryFileResponse|\Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function downloadAction($id)
    {
        $path = $this->get('kernel')->getRootDir() . "/../shared/";
        $em = $this->getDoctrine()->getManager();
        $file = $em->getRepository('CtaAisheBundle:OfflineTool')->findOneBy(
            array(
                'id' => $id
            )
        );
        if (file_exists($path . $file->getFileToken() . '.zip')) {
            $response = new BinaryFileResponse($path . $file->getFileToken() . '.zip');
            $response->setContentDisposition(ResponseHeaderBag::DISPOSITION_ATTACHMENT, $file->getFileName());
        } else {
            return $this->redirect($this->generateUrl('cta_admin_aishe_offline_tool_overview'));
        }
        return $response;
    }

    public function outdatedAction()
    {
        $em = $this->getDoctrine()->getManager();
        $activeVersion = $em->getRepository('CtaAisheBundle:OfflineTool')->findActiveVersion();

        return new JsonResponse($activeVersion->getOutdated());
    }

    /**
     * @param $id
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function removeAction($id)
    {
        $path = $this->get('kernel')->getRootDir() . "/../shared/";
        $em = $this->getDoctrine()->getManager();
        $file = $em->getRepository('CtaAisheBundle:OfflineTool')->findOneBy(
            array(
                'id' => $id
            )
        );
        if (file_exists($path . $file->getFileToken() . '.zip')) {
            $file->setStatus(OfflineTool::ST_DELETED);
            $em->persist($file);
            $em->flush();
        }
        return $this->redirect($this->generateUrl('cta_admin_aishe_offline_tool_overview'));
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Symfony\Component\HttpFoundation\RedirectResponse|Response
     */
    public function editAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $offlineTool = $em->getRepository('CtaAisheBundle:OfflineTool')->find($id);
        if (!$offlineTool) {
            $offlineTool = new OfflineTool();
        }

        $form = $this->createForm('offlineTool', $offlineTool);

        $form->handleRequest($request);
        if ($form->isValid()) {
            $em->persist($offlineTool);

            $offlineTool->setModifiedAt(new \DateTime());
            $offlineTool->setModifiedBy($this->container->get('security.context')->getToken()->getUser());

            $em->flush();

            $this->get('session')->getFlashBag()->add(
                'notice',
                $this->get('translator')->trans(
                    'form.flash.notice',
                    array('%subject%' => $offlineTool->getFileName())
                )
            );

            return $this->redirect($this->generateUrl('cta_admin_aishe_offline_tool_overview'));
        }

        return $this->render('CtaAdminAisheBundle:OfflineTool:edit.html.twig', array(
            'form' => $form->createView(),
        ));
    }

    /**
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\RedirectResponse|Response
     */
    public function updateAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        $offlineTool = new OfflineTool();

        $form = $this->createForm('offlineTool', $offlineTool);

        $form->handleRequest($request);
        if ($form->isValid()) {
            $formData = $form->getData();
            $em->persist($offlineTool);
            $now = new \DateTime();
            $offlineTool->setFileName($formData->getFileName());
            $offlineTool->setModifiedAt(new \DateTime());
            $offlineTool->setModifiedBy($this->container->get('security.context')->getToken()->getUser());
            $offlineTool->setFileToken(uniqid() . '_' . $now->format('d_m_Y_H_i'));
            $offlineTool->setLatestVersion(true);
            $offlineTool->setCreatedAt(new \DateTime());
            $offlineTool->setCreatedBy($this->container->get('security.context')->getToken()->getUser());
            $offlineTool->setStatus(OfflineTool::ST_ACTIVE);
            $offlineTool->setOutdated(false);
            $em->flush();

            $this->_updateOfflineTool($offlineTool);

            $this->_createZip($offlineTool);

            $this->get('session')->getFlashBag()->add(
                'notice',
                $this->get('translator')->trans(
                    'form.flash.notice',
                    array('%subject%' => $offlineTool->getFileName())
                )
            );

            return $this->redirect($this->generateUrl('cta_admin_aishe_offline_tool_overview'));
        }

        return $this->render('CtaAdminAisheBundle:OfflineTool:update.html.twig', array(
            'form' => $form->createView(),
        ));
    }

    /**
     * @return bool
     */
    private function _updateOfflineTool($offlineTool)
    {
        $this->_rootDir = $this->get('kernel')->getRootDir() . '/../';
        $this->_toolDir = $this->_rootDir . 'offline/Tool';
        $this->_downloadsDir = $this->_rootDir . 'shared';
        $em = $this->getDoctrine()->getManager();

        $data = array();
        // generate criterion.store.js
        foreach(Data::getLanguages() as $language){
            $criteria = $em->getRepository('CtaAisheBundle:Criterion')->findOverview(Data::getLanguageCodes($language));
            $data[$language] = $this->_generateCriteriaJsonString($criteria,Data::getLanguageCodes($language));
        }
        file_put_contents($this->_toolDir . '/Site/app/Resources/store/criterion.store.js', json_encode($data));
        //generate settings.store.js
        $data = array(
            'version' => array(
                'id' => $offlineTool->getId(),
                'checked' => false
            ),
            'host' => $this->generateUrl('cta_aishe_homepage', array(), UrlGeneratorInterface::ABSOLUTE_URL)
        );
        file_put_contents($this->_toolDir . '/Site/app/Resources/store/settings.store.js', 'var settings = ' . json_encode($data));
    }

    /**
     * @param $criteria
     * @return string
     */
    private function _generateCriteriaJsonString($criteria, $lang)
    {
        $criterionItems = array('chapter' => array());
        $i = 0;
        foreach ($criteria as $criterion) {
            $paragraph = array();
            $chapterTitle = '';
            foreach ($criterion['criterionTranslations'] as $criterionTranslation) {
                if ($criterionTranslation['lang'] == $lang) {
                    $chapterTitle = $criterionTranslation['value'];
                    break;
                }
            }
            foreach ($criterion['criterionItems'] as $criterionItem) {
                $certificationRequirements = array();
                $ii = 1;
                foreach ($criterionItem['certificationRequirements'] as $requirement) {
                    $certificationRequirements['certification ' . str_repeat('*', $ii)] = $requirement['stage'];
                    $ii++;
                }
                $stages = array();
                $criterionTitle = '';
                foreach ($criterionItem['criterionItemTranslations'] as $criterionItemTranslation) {
                    if ($criterionItemTranslation['lang'] == $lang) {
                        for ($iii = 1; $iii < 5; $iii++) {
                            array_push($stages, array(
                                'stage' => $iii,
                                'info' => $criterionItemTranslation['infoStage' . $iii]
                            ));
                        }
                        $criterionTitle = $criterionItemTranslation['value'];
                        break;
                    }
                }
                array_push($paragraph, array(
                    'Nr' => $criterionItem['paragraphNr'],
                    'criterion' => $criterionTitle,
                    'certification' => $certificationRequirements,
                    'stages' => $stages
                ));
            }
            $criterionItems['chapter'][$i] = array(
                'Nr' => $criterion['chapterNr'],
                'Type' => Data::getCriterionTypes($criterion['type']),
                'title' => $chapterTitle,
                'paragraph' => $paragraph,

            );

            $i++;
        }
        $criterionItems = array('criterionItems' => $criterionItems);

        return $criterionItems;
    }

    /**
     * @param $offlineTool
     */
    private function _createZip($offlineTool)
    {
        set_time_limit(0);
        $zip = new ZipArchive;
        $zip->open($this->_downloadsDir . '/' . $offlineTool->getFileToken() . '.zip', ZipArchive::CREATE);
        $this->_folderToZip($this->_toolDir, $zip, $this->_toolDir);
        $zip->close();
    }

    /**
     * @param $folder
     * @param $zip
     * @param $toolDir
     */
    private function _folderToZip($folder, &$zip, $toolDir)
    {
        $handle = opendir($folder);
        while (false !== $file = readdir($handle)) {
            if ($file != '.' && $file != '..') {
                $filePath = "$folder/$file";
                // Remove prefix from file path before add to zip.
                $localPath = substr($filePath, strlen($toolDir)+1);
                if (is_file($filePath)) {
                    $zip->addFile($filePath, $localPath);
                } elseif (is_dir($filePath)) {
                    // Add sub-directory.
                    $zip->addEmptyDir($localPath);
                    $this->_folderToZip($filePath, $zip, $toolDir);
                }
            }
        }
        closedir($handle);
    }
}