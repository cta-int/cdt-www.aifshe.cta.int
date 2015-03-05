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
    use Symfony\Component\HttpFoundation\BinaryFileResponse;
    use Symfony\Component\HttpFoundation\JsonResponse;
    use Symfony\Component\HttpFoundation\ResponseHeaderBag;
    use Cta\AisheBundle\Entity\OfflineTool;

    class OfflineToolController extends Controller
    {
        /**
         * @return BinaryFileResponse
         */
        public function downloadAction()
        {
            $path          = $this->get('kernel')->getRootDir() . "/../offline/Downloads/";
            $em            = $this->getDoctrine()->getManager();
            $activeVersion = $em->getRepository('CtaAisheBundle:OfflineTool')->findActiveVersion();
            if (!$activeVersion) {
                $request = $this->getRequest();
                $ruta    = $this->_getRefererRoute();

                $locale = $request->get('_locale');
                $url    = $this->get('router')->generate($ruta, array('_locale' => $locale));

                //@todo: add flash message "no file found" ??

                return $this->redirect($url);
            } else {
                $response = new BinaryFileResponse($path . $activeVersion->getFileToken() . '.zip');
                $fileName = $activeVersion->getFileName();
                if (!preg_match('/^.*\.(zip)$/i', $fileName)) {
                    $fileName = $activeVersion->getFileName() . '.zip';
                }
                $response->setContentDisposition(ResponseHeaderBag::DISPOSITION_ATTACHMENT, $fileName);
                return $response;
            }
        }

        /**
         * @return JsonResponse
         */
        public function versionAction()
        {
            $activeVersion = $this->getDoctrine()->getManager()->getRepository('CtaAisheBundle:OfflineTool')->findActiveVersion();

            $response = new JsonResponse(array('version' => $activeVersion->getId()), 200, array());
            $response->setCallback($this->getRequest()->get('callback'));

            return $response;
        }

        /**
         * @return mixed
         */
        private function _getRefererRoute()
        {
            $request = $this->getRequest();

            //look for the referer route
            $referer  = $request->headers->get('referer');
            $lastPath = substr($referer, strpos($referer, $request->getBaseUrl()));
            $lastPath = str_replace($request->getBaseUrl(), '', $lastPath);

            $matcher    = $this->get('router')->getMatcher();
            $parameters = $matcher->match($lastPath);
            $route      = $parameters['_route'];

            return $route;
        }
    }