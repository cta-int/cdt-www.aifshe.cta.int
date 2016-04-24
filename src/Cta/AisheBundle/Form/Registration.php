<?php
namespace Cta\AisheBundle\Form;

use FOS\UserBundle\Form\Type\RegistrationFormType as BaseType;

class Registration extends BaseType
{
    public function getName()
    {
        return 'cta_user_registration';
    }
}