<?php

/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 9/9/13
 * Time: 8:46 AM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\Admin\AisheBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class GroupController extends Controller
{
    /**
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function overviewAction()
    {
        $groupManager = $this->container->get('fos_user.group_manager');
        return $this->render('CtaAdminAisheBundle:Group:overview.html.twig', array(
            'groups' => $groupManager->findGroups(),
        ));
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Symfony\Component\HttpFoundation\RedirectResponse|\Symfony\Component\HttpFoundation\Response
     */
    public function editAction(Request $request, $id)
    {
        $groupManager    = $this->container->get('fos_user.group_manager');
        $group           = $groupManager->findGroupBy(array('id' => $id));

        if (!$group) {
            $group = $groupManager->createGroup(null);
        }

        $form = $this->createForm('group', $group);
        $form->handleRequest($request);
        if ($form->isValid()) {
            $groupManager->updateGroup($group);

            $this->get('session')->getFlashBag()->add(
                'notice',
                $this->get('translator')->trans(
                    'form.flash.notice',
                    array('%subject%' => $group->getName())
                )
            );

            return $this->redirect($this->generateUrl('cta_admin_aishe_security_group'));
        }

        return $this->render('CtaAdminAisheBundle:Group:edit.html.twig', array(
            'form'  => $form->createView(),
        ));
    }

    /**
     * @param $id
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function deleteAction($id)
    {
        $groupManager    = $this->container->get('fos_user.group_manager');
        $group = $groupManager->findGroupBy(array('id' => $id));

        if ($group) {
            $groupManager->deleteGroup($group);

            $this->get('session')->getFlashBag()->add(
                'notice',
                'Group [' . $group->getName() . '] deleted.'
            );
        }

        return $this->redirect($this->generateUrl('cta_admin_aishe_security_group'));
    }
}