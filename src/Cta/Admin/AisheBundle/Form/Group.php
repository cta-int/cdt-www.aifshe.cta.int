<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 8/30/13
 * Time: 2:48 PM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\Admin\AisheBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class Group extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name', 'text')
            ->add('roles', 'collection', array(
                'type'              => 'text',
                'allow_add'         => true,
                'allow_delete'      => true,
                'prototype'         => true,
                'prototype_name'    => 'roles_prototype',
                'required'          => false,
            ))
            ->add('save', 'submit', array('label' => 'form.save'));
    }

    public function getName()
    {
        return 'group';
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Cta\AisheBundle\Entity\Group',
        ));
    }
}