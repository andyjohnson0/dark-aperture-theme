<?php
/*
Theme Name: Dark Aperture
Version: auto
Description: A mobile-ready & feature-rich theme based on Boostrap 4, with PhotoSwipe full-screen slideshow, Slick carousel,
over 30 color styles and lots of configuration options. Based on Bootstrap Darkroom theme by Thomas Kuther.
Modified by: Andrew Johnson
https://github.com/andyjohnson0/dark-aperture-theme
*/

/*
Theme Name: Bootstrap Darkroom
Version: auto
Description: A mobile-ready & feature-rich theme based on Boostrap 4, with PhotoSwipe full-screen slideshow, Slick carousel, over 30 color styles and lots of configuration options
Theme URI: http://piwigo.org/ext/extension_view.php?eid=831
Author: Thomas Kuther
Author URI: https://github.com/tkuther/piwigo-bootstrap-darkroom
*/

require_once(PHPWG_THEMES_PATH . 'dark_aperture/include/themecontroller.php');
require_once(PHPWG_THEMES_PATH . 'dark_aperture/include/config.php');

$themeconf = array(
    'name' => 'dark_aperture',
    'parent' => 'default',
    'load_parent_css' => false,
    'load_parent_local_head' => true,
    'local_head' => 'local_head.tpl',
    'url' => 'https://github.com/andyjohnson0/dark-aperture-theme',
    'colorscheme' => 'dark'
);

//debug
//$conf['template_combine_files'] = false;

// always show metadata initially
pwg_set_session_var('show_metadata', true);

// register video files
$video_ext = array('mp4','m4v');
$conf['file_ext'] = array_merge ($conf['file_ext'], $video_ext, array_map('strtoupper', $video_ext));

$controller = new \DarkAperture\ThemeController();


// Define if skin is clear or dark
$clear_skins = array(
    'bootstrap-default',
    'material-amber',
    'material-blue',
    'material-brown',
    'material-deep-orange',
    'material-deep-purple',
    'material-indigo',
    'material-light-green',
    'material-lime',
    'material-purple',
    'material-indigo',
    'material-red',
    'material-teal',
    'bootswatch-cerulean',
    'bootswatch-cosmo',
    'bootswatch-flatly',
    'bootswatch-journal',
    'bootswatch-litera',
    'bootswatch-lumen',
    'bootswatch-lux',
    'bootswatch-materia',
    'bootswatch-minty',
    'bootswatch-pulse',
    'bootswatch-sandstone',
    'bootswatch-simplex',
    'bootswatch-sketchy',
    'bootswatch-spacelab',
    'bootswatch-united',
    'bootswatch-yeti',
);
// Get value of bootstrap theme and set themeconf to clear or leave as default (dark)
$closure = \Closure::bind(function &(\DarkAperture\ThemeController $controller) {
    return $controller->config;
}, null, \DarkAperture\ThemeController::class);

$config = &$closure($controller);

if (in_array($config->bootstrap_theme, $clear_skins))
{
    $themeconf['colorscheme'] = 'clear';
}

$controller->init();

// Include custom functions and event handlers.
include_once(PHPWG_THEMES_PATH . 'dark_aperture/functions.inc.php');
