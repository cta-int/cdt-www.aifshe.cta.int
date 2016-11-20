<?php

namespace Cta\Admin\AisheBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class OfflineTool extends AbstractType
{

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('fileName'   , 'text', array('label' => 'tool.filename', 'data' => 'Aifshe Offline Tool'));
        $builder->add('save', 'submit'  , array('label' => 'form.save'));
    }

    public function getName()
    {
        return 'offlineTool';
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Cta\AisheBundle\Entity\OfflineTool',
        ));
    }
}