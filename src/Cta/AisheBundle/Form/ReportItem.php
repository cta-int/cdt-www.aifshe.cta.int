<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 8/30/13
 * Time: 2:48 PM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\AisheBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class ReportItem extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('currentSituationRating'  , 'hidden', array('required' => false))
            ->add('desiredSituationRating'  , 'hidden', array('required' => false))
            ->add('currentSituationComment' , 'textarea', array('required' => false))
            ->add('desiredSituationComment' , 'textarea', array('required' => false))
            ->add('hasHighPriority'         , 'checkbox', array('required' => false))
            ->add('save'                    , 'submit'  , array('label' => 'form.save'))
            ->add('saveAndNext'             , 'submit'  , array('label' => 'form.saveAndNext'));
    }

    public function getName()
    {
        return 'reportItem';
    }

    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Cta\AisheBundle\Entity\ReportItem',
        ));
    }
}