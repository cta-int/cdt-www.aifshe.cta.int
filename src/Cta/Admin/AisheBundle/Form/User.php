<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 8/30/13
 * Time: 2:48 PM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\Admin\AisheBundle\Form;

use Doctrine\ORM\EntityRepository;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;
use Cta\AisheBundle\Entity\Institution;

class User extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('username'            , 'text')
            ->add('email'               , 'email')
            ->add('institution', 'entity', array(
                'class' => 'CtaAisheBundle:Institution',
                'query_builder' => function(EntityRepository $er) {
                    return $er->createQueryBuilder('i')
                        ->where('i.status != :status')
                        ->setParameter('status', Institution::ST_DELETED)
                        ->orderBy('i.name', 'ASC');
                },
                'property' => 'name',
                'multiple'  => false,
                'required' => false,
            ))
            ->add('enabled'             , 'checkbox'      , array('required' => false))
            ->add('plainPassword', 'repeated', array(
                'type' => 'password',
                'invalid_message' => 'The password fields must match.',
                'required' => true,
                'first_options'  => array('label' => 'New Password'),
                'second_options' => array('label' => 'Repeat New Password'),
            ))
            ->add('groups', 'entity', array(
                'class' => 'CtaAisheBundle:Group',
                'query_builder' => function(EntityRepository $er) {
                    return $er->createQueryBuilder('g')
                        ->orderBy('g.name', 'ASC');
                },
                'property' => 'name',
                'multiple'  => true,
            ))
            ->add('save'                , 'submit'      , array('label' => 'form.save'));
    }

    public function getName()
    {
        return 'user';
    }

    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Cta\AisheBundle\Entity\User',
        ));
    }
}