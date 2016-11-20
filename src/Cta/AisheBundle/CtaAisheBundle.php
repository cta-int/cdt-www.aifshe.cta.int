<?php

namespace Cta\AisheBundle;

use Cta\AisheBundle\DependencyInjection\Compiler\OverrideListenerCompilerPass;
use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\HttpKernel\Bundle\Bundle;

class CtaAisheBundle extends Bundle
{
    public function build(ContainerBuilder $container)
    {
        parent::build($container);

        $container->addCompilerPass(new OverrideListenerCompilerPass());
    }
}
