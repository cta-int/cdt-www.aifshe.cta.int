<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 9/9/13
 * Time: 9:43 AM
 * To change this template use File | Settings | File Templates.
 */

namespace Devart\CommonBundle\Twig;

use Symfony\Component\Security\Core\SecurityContextInterface;

class SecurityExtension extends \Twig_Extension
{
    private $_securityContext;

    /**
     * @param SecurityContextInterface $securityContext
     */
    public function __construct(SecurityContextInterface $securityContext = null)
    {
        $this->_securityContext = $securityContext;
    }

    /**
     * @param $group
     * @return bool
     */
    public function inGroup($group)
    {
        if (is_null($this->_securityContext)) {
            return false;
        }

        return $this->_securityContext->inGroup($group);
    }

    /**
     * {@inheritdoc}
     */
    public function getFunctions()
    {
        return array(
            new \Twig_SimpleFunction('in_group', array($this, 'inGroup')),
        );
    }

    /**
     * Returns the name of the extension.
     *
     * @return string The extension name
     */
    public function getName()
    {
        return 'devart.security';
    }
}