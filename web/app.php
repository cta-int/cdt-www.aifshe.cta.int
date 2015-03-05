<?php

use Symfony\Component\ClassLoader\ApcClassLoader;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Debug\Debug;

// get environment
$env = array_key_exists('APPLICATION_ENV', $_SERVER) ? $_SERVER['APPLICATION_ENV'] : 'production';
$env = 'production';

// get BOOTSTRAP
$loader = require_once __DIR__.'/../app/bootstrap.php.cache';

// enable debugging if environment is development
if ($env == 'development') {
//    Debug::enable();
}

// enable APC if environment is production
if ($env == 'production') {
    //$loader = new ApcClassLoader('cta_aishe', $loader);
    //$loader->register(true);
}

// get KERNEL
require_once __DIR__.'/../app/AppKernel.php';

// get APPCACHE if environment is production
if ($env == 'production') {
}

// start up the kernel depending on the kernel
switch ($env) {
    case 'development':
        $kernel = new AppKernel('dev', true);
        break;
    case 'staging':
        $kernel = new AppKernel('staging', false);
        break;
    default: // production
        $kernel = new AppKernel('prod', false);
        break;
}
$kernel->loadClassCache();

// enable APPCACHE if environment is production
if ($env == 'production') {
    require_once __DIR__.'/../app/AppCache.php';
    $kernel = new AppCache($kernel);
}

// additional bootstrap calls
$request = Request::createFromGlobals();
$response = $kernel->handle($request);
$response->send();
$kernel->terminate($request, $response);
