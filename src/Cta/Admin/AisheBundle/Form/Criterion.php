<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 8/30/13
 * Time: 2:48 PM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\Admin\AisheBundle\Form;

use Cta\AisheBundle\Model\Data;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class Criterion extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('chapterNr'   , 'integer', array('label' => 'criterion.chapterNr'))
            ->add('type'        , 'choice', array('choices' => Data::getCriterionTypes(), 'label' => 'criterion.type'));

        foreach (Data::getLanguages() as $language) {
            $builder->add($language, 'text', array('label' => 'base.languages.' . $language, 'mapped' => false,));
        }

        $builder->add('save', 'submit'  , array('label' => 'form.save'));
    }

    public function getName()
    {
        return 'criterion';
    }

    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Cta\AisheBundle\Entity\Criterion',
        ));
    }
}