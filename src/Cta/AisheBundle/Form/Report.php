<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 8/30/13
 * Time: 2:48 PM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\AisheBundle\Form;

use Doctrine\ORM\EntityRepository;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;
use Cta\AisheBundle\Entity\Institution;

class Report extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $dateEmptyValues = array('year' => 'form.year', 'month' => 'form.month', 'day' => 'form.day');

        $builder
            ->add('name'                    , 'text'    , array('label' => 'report.name'))
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
            ))
            ->add('department'              , 'text'    , array('required' => false, 'label' => 'report.department'))
            ->add('coordinator'             , 'text'    , array('required' => false, 'label' => 'report.coordinator'))
            ->add('nrOfParticipants'        , 'integer' , array('required' => false, 'label' => 'report.nrOfParticipants'))
            ->add('secretary'               , 'text'    , array('required' => false, 'label' => 'report.secretary'))
            ->add('dateAssessment'          , 'date'    , array('label' => 'report.dateAssessment', 'years' => range(2000, (int)date('Y')), 'empty_value' => $dateEmptyValues))
            ->add('dateLatestAssessment'    , 'date'    , array('required' => false, 'label' => 'report.dateLatestAssessment', 'years' => range(2000, (int)date('Y')), 'empty_value' => $dateEmptyValues))
            ->add('dateDesiredSituation'    , 'date'    , array('required' => false, 'label' => 'report.dateDesiredSituation', 'years' => range(2000, (int)date('Y') + 10), 'empty_value' => $dateEmptyValues))
            ->add('comment'                 , 'textarea', array('required' => false, 'label' => 'report.comment'))
            ->add('save'                    , 'submit'  , array('label' => 'form.save'));
    }

    public function getName()
    {
        return 'report';
    }

    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Cta\AisheBundle\Entity\Report',
        ));
    }
}