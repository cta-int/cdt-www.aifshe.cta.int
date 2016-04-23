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

class CriterionItemTranslation extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('value'       , 'text'    , array('label' => 'criterion.item.translation.name'));
        $builder->add('infoStage1'  , 'textarea', array('label' => 'criterion.item.translation.infoStage1'));
        $builder->add('infoStage2'  , 'textarea', array('label' => 'criterion.item.translation.infoStage2'));
        $builder->add('infoStage3'  , 'textarea', array('label' => 'criterion.item.translation.infoStage3'));
        $builder->add('infoStage4'  , 'textarea', array('label' => 'criterion.item.translation.infoStage4'));
        $builder->add('infoStage5'  , 'textarea', array('label' => 'criterion.item.translation.infoStage5'));

        $builder->add('save', 'submit'  , array('label' => 'form.save'));
    }

    public function getName()
    {
        return 'criterion_item_translation';
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Cta\AisheBundle\Entity\CriterionItemTranslation',
        ));
    }
}