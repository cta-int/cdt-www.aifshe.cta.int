<?php

use Symfony\Component\ClassLoader\ApcClassLoader;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Debug\Debug;

// get environment
switch ($_SERVER['HTTP_HOST']) {
    case 'dev.aifshe.cta.int':
        $env = 'dev';
        $debug = true;
        break;
    case 'staging.aifshe.cta.int':
        $env = 'staging';
        $debug = true;
        break;
    case 'preview.aifshe.cta.int':
        $env = 'preview';
        $debug = false;
        break;
    case 'aifshe.cta.int':
    case 'www.aifshe.cta.int':
    default:
        $env = 'prod';
        $debug = false;
        break;
}

// get BOOTSTRAP
$loader = require_once __DIR__.'/../app/bootstrap.php.cache';

// enable debugging if needed
if ($debug) {
    Debug::enable();
}

// enable APC if environment is production/preview
if ( in_array($env, array('preview', 'prod')) ) {
    $loader = new ApcClassLoader('cta_aishe', $loader);
    $loader->register(true);
}

// start up the kernel depending on the kernel
require_once __DIR__.'/../app/AppKernel.php';
$kernel = new AppKernel($env, $debug);
$kernel->loadClassCache();

// enable APPCACHE if environment is production/preview
if ( in_array($env, array('preview', 'prod')) ) {
    require_once __DIR__.'/../app/AppCache.php';
    $kernel = new AppCache($kernel);
}

// additional bootstrap calls
$request = Request::createFromGlobals();
$response = $kernel->handle($request);
$response->send();
$kernel->terminate($request, $response);
