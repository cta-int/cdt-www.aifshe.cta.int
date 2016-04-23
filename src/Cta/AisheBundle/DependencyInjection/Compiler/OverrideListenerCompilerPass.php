<?php
namespace Cta\AisheBundle\DependencyInjection\Compiler;

use Cta\AisheBundle\EventListener\AuthenticationListener;
use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\DependencyInjection\Compiler\CompilerPassInterface;

/**
 * Class OverrideListenerCompilerPass
 *
 * Puts our own custom authentication listener in place of the standard FOS one
 */
class OverrideListenerCompilerPass implements CompilerPassInterface
{
    /**
     * @inheritdoc
     */
    public function process(ContainerBuilder $container)
    {
        $definition = $container->getDefinition('fos_user.listener.authentication');

        $definition->setClass(AuthenticationListener::class);
    }
}
