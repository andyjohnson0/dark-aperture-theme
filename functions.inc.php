<?php

/*
* Custom functions and event handlers. This file is included from themeconf.inc.php.
* BY Andrew Johnson
*/

if (!defined('PHPWG_ROOT_PATH')) 
    die('Hacking attempt!');


// Display additional EXIF/IPTC info

add_event_handler('init', 'dark_aperture_exif_iptc_config');

function dark_aperture_exif_iptc_config()
{
    global $conf, $template;

    // Global $theme_config isn't popuated at this point, so we get te config like this.
    $theme_config = $template->get_template_vars('theme_config');

    // Conditionally show extended EXIF and IPTC metadata
    if (isset($theme_config->picture_show_extended_metadata) && $theme_config->picture_show_extended_metadata)
    {
        // EXIF
        $conf['show_exif'] = true;
        $conf['show_exif_fields'] = array(
            'DateTimeOriginal',
            'Make',
            'Model',
            'ExposureProgram',
            'FocalLengthIn35mmFilm',
            'FNumber',
            'ExposureTime',
            'ISOSpeedRatings',
            'Flash',
            'WhiteBalance',
            'UserComment'
        );

        // IPTC
        $conf['show_iptc'] = true;
        $conf['show_iptc_mapping'] = array(
            'iptc_creator'     => '2#080',
            'iptc_title'       => '2#005',
            'iptc_headline'    => '2#105',
            'iptc_description' => '2#120',
            'iptc_keywords'    => '2#025'
        );

        // 
        $conf['use_exif'] = true;
        $conf['use_iptc'] = true;
    }
}
