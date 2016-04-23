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
use Symfony\Component\OptionsResolver\OptionsResolver;

class Institution extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name'                    , 'text'    , array('label' => 'institution.name'))
            ->add('save'                    , 'submit'  , array('label' => 'form.save'));
    }

    public function getName()
    {
        return 'institution';
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Cta\AisheBundle\Entity\Institution',
        ));
    }
}