<?php
/**
 * Created by JetBrains PhpStorm.
 * User: roy
 * Date: 8/29/13
 * Time: 2:24 PM
 * To change this template use File | Settings | File Templates.
 */

namespace Cta\AisheBundle\Twig;

use Twig_Extension;
use Twig_SimpleFilter;
use Cta\AisheBundle\Model\Data;

/**
 * Class CtaExtension
 *
 * Twig extensions
 * Holds filters & functions for the CTA project
 * *
 * @package Cta\AisheBundle\Twig
 */
class CtaExtension extends Twig_Extension implements \Twig_Extension_GlobalsInterface
{
    /**
     * Informs Twig about this extension's name
     * @return string
     */
    public function getName()
    {
        return 'cta.aishe.extension';
    }

    /**
     * Set Globals
     * @return array
     */
    public function getGlobals()
    {
        return array(
            'languages' => Data::getLanguages(),
        );
    }

    /**
     * Return filters for this extension
     * @return array
     */
    public function getFilters()
    {
        return array(
            new Twig_SimpleFilter('toCriterionType', array($this, 'getCriterionTypeFilter')),
            'format_bytes' => new \Twig_Filter_Method($this, 'format_bytes'),
        );
    }

    /**
     * The Criterion Type filter
     * @param $type_key
     * @return string
     */
    public function getCriterionTypeFilter($type_key)
    {
        $type = Data::getCriterionTypes($type_key);
        return is_string($type)?$type:$type_key;
    }

    /**
     * @param $bytes
     * @param bool $si
     * @return string
     */
    public function format_bytes($bytes, $si = true)
    {
        $unit = $si ? 1000 : 1024;
        if ($bytes <= $unit) return $bytes . " B";
        $exp = intval((log($bytes) / log($unit)));
        $pre = ($si ? "kMGTPE" : "KMGTPE");
        $pre = $pre[$exp - 1] . ($si ? "" : "i");
        return sprintf("%.1f %sB", $bytes / pow($unit, $exp), $pre);
    }
}