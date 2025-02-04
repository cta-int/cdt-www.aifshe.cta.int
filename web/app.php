<?php

use Symfony\Component\ClassLoader\ApcClassLoader;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Debug\Debug;

$env   = getenv('SYMFONY_ENV') ? : 'prod';
$debug = getenv('SYMFONY_DEBUG') ? : false;

// get BOOTSTRAP
$loader = require_once __DIR__.'/../app/bootstrap.php.cache';

// enable debugging if needed
if ($debug) {
    Debug::enable();
}

// enable APC if environment is production/preview
if ( in_array($env, array('prod')) && extension_loaded('apc')) {
    $loader = new ApcClassLoader('cta_aishe', $loader);
    $loader->register(true);
}

// start up the kernel depending on the kernel
require_once __DIR__.'/../app/AppKernel.php';
$kernel = new AppKernel($env, $debug);
$kernel->loadClassCache();

// enable APPCACHE if environment is production/preview
if ( in_array($env, array('prod')) ) {
    require_once __DIR__.'/../app/AppCache.php';
    $kernel = new AppCache($kernel);
}

// additional bootstrap calls
$request = Request::createFromGlobals();
$response = $kernel->handle($request);
$response->send();
$kernel->terminate($request, $response);
