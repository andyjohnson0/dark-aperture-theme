<?php
/*
Theme Name: Bootstrap Darkroom
Version: 1.0.2
Description: A Bootstrap Default child theme with darker colors based on Lightroom and a carousel on the picture page
Theme URI: http://piwigo.org/ext/extension_view.php?eid=831
Author: Thomas Kuther
Author URI: https://https://github.com/tkuther/piwigo-bootstrap-darkroom
*/

$themeconf = array(
    'name' => 'bootstrap_darkroom',
    'parent' => 'bootstrapdefault',
    'load_parent_css' => true,
    'load_parent_local_head' => true,
    'url' => 'https://kuther.net/'
);

//debug
//$conf['template_combine_files'] = false;

// always show metadata initially
pwg_set_session_var('show_metadata', true);

// config
add_event_handler('init', 'set_config_values');
function set_config_values()
{
  global $template, $pwg_loaded_plugins, $stripped_responsive;
  $template->assign(array(
                          'rv_tscroller_enabled'=> isset($pwg_loaded_plugins['rv_tscroller'])
                         ));
}

// needed for the navigation carousel in picture.tpl
// borrowed from https://github.com/ThomasDaheim/piwigo-stuff/tree/master/picturethumbs
add_event_handler('loc_end_picture', 'get_all_thumbnails_in_category');
add_event_handler('loc_begin_picture', 'get_all_thumbnails_in_category');
function get_all_thumbnails_in_category()
{
  global $template, $conf, $user, $page;
  
  // select all pictures for this category
  $query = '
  SELECT *
    FROM '.IMAGES_TABLE.'
    WHERE id IN ('.implode(',', $page['items']).')
    ORDER BY FIELD(id, '.implode(',', $page['items']).')
  ;';

  $result = pwg_query($query);
  
  $pictures = array();
  while ($row = pwg_db_fetch_assoc($result))
  {
    $pictures[] = $row;
  }
  
  trigger_notify('loc_begin_index_thumbnails', $pictures);
  $tpl_thumbnails_var = array();

  foreach ($pictures as $row)
  {    
    $url = duplicate_picture_url(
      array(
        'image_id' => $row['id'],
        'image_file' => $row['file'],
        ),
      array('start')
      );

    $name = render_element_name($row);
    $desc = render_element_description($row, 'main_page_element_description');
    
    $tpl_var = array_merge( $row, array(
      'NAME' => $name,
      'TN_ALT' => htmlspecialchars(strip_tags($name)),
      'TN_TITLE' => get_thumbnail_title($row, $name, $desc),
      'URL' => $url,
      'DESCRIPTION' => $desc,
      'src_image' => new SrcImage($row),
    ) );
    
    $tpl_thumbnails_var[] = $tpl_var;
  }
  
  $template->assign( array(
    'derivative_params_thumb' => trigger_change('get_index_derivative_params', ImageStdParams::get_by_type( pwg_get_session_var('index_deriv', IMG_SQUARE) ) ),
      ) );
  $template->assign( array(
    'derivative_params_large' => trigger_change('get_index_derivative_params', ImageStdParams::get_by_type( pwg_get_session_var('index_deriv', IMG_LARGE) ) ),
      ) );
  $tpl_thumbnails_var = trigger_change('loc_end_index_thumbnails', $tpl_thumbnails_var, $pictures);
  $template->assign('thumbnails', $tpl_thumbnails_var);

  unset($tpl_thumbnails_var, $pictures);
}

//$controller = new \BootstrapLightroom\ThemeController();
//$controller->init();
