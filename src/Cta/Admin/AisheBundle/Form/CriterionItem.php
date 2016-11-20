<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 8/30/13
 * Time: 2:48 PM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\Admin\AisheBundle\Form;

use Doctrine\ORM\EntityManager;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class CriterionItem extends AbstractType
{
    private $_em;

    public function __construct(EntityManager $em)
    {
        $this->_em = $em;
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('paragraphNr', 'integer', array('label' => 'criterion.item.paragraphNr'));

        $certs = $this->_em->getRepository('CtaAisheBundle:Certification')->findAll();
        foreach ($certs as $cert) {
            $builder->add(
                str_replace('.', '_', $cert->getName()), 'integer',
                array('mapped' => false, 'label' => 'base.' . $cert->getName())
            );
        }

        $builder->add('save', 'submit', array('label' => 'form.save'));
    }

    public function getName()
    {
        return 'criterion_item';
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(
            array(
                'data_class' => 'Cta\AisheBundle\Entity\CriterionItem',
            )
        );
    }
}