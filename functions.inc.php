<?php

/*
* Custom functions and event handlers. This file is included from themeconf.inc.php.
* BY Andrew Johnson
*/

if (!defined('PHPWG_ROOT_PATH')) 
    die('Hacking attempt!');

include_once(PHPWG_ROOT_PATH . '/include/functions.inc.php');



/*
** Localisation, language fallback etc.
*/

global $user;
if (isset($user['language'])) 
{
    $user_lang = $user['language'];
} else 
{
    // No langauge. Shouldn't happen, but use "en" for english and let the fallback logic in get_best_language_dir()
    // deal with it.
    $user_lang = 'en';
}
if ($user_lang == "en_UK") 
{
    // Special case for misconfigured system using British English: map "en_UK" to correct value of "en_GB".
    $user_lang = "en_GB";
}

$theme_base_path = dirname(__FILE__) . "/";
$theme_lang_subdir_name = match_language_dir($user_lang, $theme_base_path . "language/");
if ($theme_lang_subdir_name !== null) 
{
  load_language('theme.lang', $theme_base_path,  array('language' => $theme_lang_subdir_name));
}
else 
{
  load_languageload_language('theme.lang', $theme_base_path);
}



// match_language_dir($user_language, $language_path)
//
// user_language: user language string in the form language_COUNTRY (eg en_UK, zh_CN)
// language_path: path to the theme language directory
//
// Returns: name of language subdirectory  - eg. "en_UK", "en", etc.
// 
// Given the user language and theme language directory, determine the
// best language subdirectory to load a theme.lang.php file from, and return the full path.
// 1. subdirectory named language_COUNTRY
// 2. subdirectory named language
// 3. the first subdirectory beginning with language_
// 4. subdirectory named "en"
// 5. the first subdirectory beginning with "en_"
// 6. the first subdirectory
// 
function match_language_dir($user_language, $language_path) 
{
    // 1. Check for exact match (language_COUNTRY)
    if (is_dir($language_path . $user_language)) {
        return $user_language;
    }

    list($lang_base, $country) = explode('_', $user_language) + [null, null];

    // 2. Check for just language (language)
    if ($lang_base && is_dir($language_path . $lang_base)) {
        return $lang_base;
    }

    // 3. Find the first directory starting with language_
    foreach (scandir($language_path) as $dir) {
        if (strpos($dir, $lang_base . '_') === 0) {
            return $dir;
        }
    }

    // 4. Check for default English (en)
    if (is_dir($language_path . 'en')) {
        return 'en';
    }

    // 5. Find the first directory starting with en_
    foreach (scandir($language_path) as $dir) {
        if (strpos($dir, 'en_') === 0) {
            return $dir;
        }
    }

    // 6. Return the first available directory
    foreach (scandir($language_path) as $dir) {
        if ($dir !== '.' && $dir !== '..' && is_dir("$language_path/$dir")) {
            return "$dir";
        }
    }

    return null; // No match found
}








/*
** Display additional EXIF/IPTC info
*/

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



/*
** Template functions
*/

add_event_handler('init', 'register_template_functions');

function register_template_functions() 
{
    global $smarty;
    if (isset($smarty))
    {
        $smarty->registerPlugin('function', 'pattern_replace', 'pattern_replace');
        $smarty->registerPlugin('function', 'fraction_str_to_decimal', 'fraction_str_to_decimal');
        $smarty->registerPlugin('function', 'metering_mode_to_string', 'metering_mode_to_string');
        $smarty->registerPlugin('function', 'flash_mode_to_string', 'flash_mode_to_string');
        $smarty->registerPlugin('function', 'white_balance_to_string', 'white_balance_to_string');
    }
}


function pattern_replace($subject, $pattern, $replacement, $limit)
{
    return preg_replace($pattern, $replacement, $subject, $limit);
}


/*
** Convert string of form "xxxx/yyyy" to a decimal value
*/
function fraction_str_to_decimal($fraction, $decimal_places = 2)
{
    // Ensure input contains a slash
    if (strpos($fraction, '/') === false) {
        return $fraction; // Invalid input
    }

    // Split the string and validate
    list($numerator, $denominator) = explode('/', $fraction, 2);
    if (!is_numeric($numerator) || !is_numeric($denominator) || $denominator <= 0) {
        return $fraction; // Invalid input
    }

    // Convert to decimal and format with given decimal places
    return number_format($numerator / $denominator, $decimal_places);
}


function metering_mode_to_string($mode)
{
    switch ($mode) {
        case 0x00:
            return 'Unknown';
        case 0x01:
            return 'Average';
        case 0x02:
            return 'Center-weighted average';
        case 0x03:
            return 'Spot';
        case 0x04:
            return 'Multi-spot';
        case 0x05:
            return 'Pattern';
        case 0x06:
            return 'Partial';
        case 0xff:
            return 'Other';
        default:
            return 'Unknown';
    }
}


function flash_mode_to_strings($mode)
{
    $parts = [];

    // Bit 5: flash function available
    if ($mode & 0b0100000) 
    {
        $parts[] = 'No flash function';
    } 
    else 
    {
        // Bit 0: flash fired
        if ($mode & 0b00000001) 
        {
            $parts[] = 'Flash fired';
        } 
        else 
        {
            $parts[] = 'Flash did not fire';
        }

        // Bits 3 and 4: flash mode
        if (($mode & 0b00011000) === 0b00001000) 
        {
            $parts[] = 'Compulsory flash firing';
        } 
        elseif (($mode & 0b00011000) === 0b00010000) 
        {
            $parts[] = 'Compulsory flash suppression';
        } 
        elseif (($mode & 0b00011000) === 0b00011000) 
        {
            $parts[] = 'Auto mode';
        }

        // Bit 6: red-eye reduction
        if ($mode & 0b01000000) 
        {
            $parts[] = 'Red-eye reduction';
        }

        // Bits 1 and 2: strobe return light detection
        if (($mode & 0b00000110) === 0b00000100) 
        {
            $parts[] = 'Strobe return light not detected';
        } 
        elseif (($mode & 0b00000110) === 0b00000110) 
        {
            $parts[] = 'Strobe return light detected';
        }
    }

    return $parts;

    // $str = implode(', ', $parts);
    // if (strlen($str) > 1) {
    //     return ucfirst(strtolower($str));
    // } else {
    //     return 'None';
    // }
}


function white_balance_to_string($mode) 
{
    switch ($mode) {
        case 0:
            return 'Auto';
        case 1:
            return 'Manual';
        default:
            return 'Unknown';
    }
}

