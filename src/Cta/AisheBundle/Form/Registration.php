<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 9/16/13
 * Time: 1:08 PM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\AisheBundle\Form;

use Doctrine\ORM\EntityRepository;
use Symfony\Component\Form\FormBuilderInterface;
use FOS\UserBundle\Form\Type\RegistrationFormType as BaseType;
use Cta\AisheBundle\Entity\Institution;

class Registration extends BaseType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        parent::buildForm($builder, $options);

        $builder->add('institution', 'entity', array(
            'class' => 'CtaAisheBundle:Institution',
            'query_builder' => function(EntityRepository $er) {
                return $er->createQueryBuilder('i')
                    ->where('i.status = :status')
                    ->setParameter('status', Institution::ST_ACTIVE)
                    ->orderBy('i.name', 'ASC');
            },
            'property' => 'name',
            'multiple'  => false,
        ));

        $builder->add('requestAuditor', 'checkbox', array(
            'required'  => false,
            'label'     => "I'm an official auditor",
        ));
    }

    public function getName()
    {
        return 'cta_user_registration';
    }
}