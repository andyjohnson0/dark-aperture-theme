{* Modified by Andrew Johnson for Dark Aperture theme *}

{combine_css path="themes/dark_aperture/admin/css/admin.css"}
{combine_script id='common' load='footer' path='admin/themes/default/js/common.js'}
<div class="titrePage">
    <h2>Dark Aperture {$TABSHEET_TITLE}</h2>
</div>

<ul class="tabs">
  <li class="tab-link current" data-tab="appearance">{'Appearance'|@translate}</li>
  <li class="tab-link" data-tab="components">{'Components'|@translate}</li>
  <li class="tab-link" data-tab="social-integration">{'Social Media Integration'|@translate}</li>
</ul>
  

<form method="post" class="properties">
    <input type="hidden" name="dark_aperture_settings" value="true" />
    <div id="configContent">
      <div id="appearance" class="tab-content current">
        <fieldset class="mainConf">
            <legend>{'Bootstrap theme'|@translate}</legend>
            <ul>
                <li>
                    <label labelfor="bootstrap_theme">{'Color theme'|@translate}</label>
                    <select name="bootstrap_theme">
                        <option value="dark-aperture"{if $theme_config->bootstrap_theme == 'dark-aperture'} selected="selected"{/if}>Dark Aperture</option>
                        <option value="bootstrap-default"{if $theme_config->bootstrap_theme == 'bootstrap-default'} selected="selected"{/if}>Bootstrap Default</option>
                        <option value="material-darkroom"{if $theme_config->bootstrap_theme == 'material-darkroom'} selected="selected"{/if}>Material Darkroom</option>
                        <option value="material-amber"{if $theme_config->bootstrap_theme == 'material-amber'} selected="selected"{/if}>Material Amber</option>
                        <option value="material-blue"{if $theme_config->bootstrap_theme == 'material-blue'} selected="selected"{/if}>Material Blue</option>
                        <option value="material-brown"{if $theme_config->bootstrap_theme == 'material-brown'} selected="selected"{/if}>Material Brown</option>
                        <option value="material-deep-orange"{if $theme_config->bootstrap_theme == 'material-deep-orange'} selected="selected"{/if}>Material Deep Orange</option>
                        <option value="material-deep-purple"{if $theme_config->bootstrap_theme == 'material-deep-purple'} selected="selected"{/if}>Material Deep Purple</option>
                        <option value="material-indigo"{if $theme_config->bootstrap_theme == 'material-indigo'} selected="selected"{/if}>Material Indigo</option>
                        <option value="material-light-green"{if $theme_config->bootstrap_theme == 'material-light-green'} selected="selected"{/if}>Material Light Green</option>
                        <option value="material-lime"{if $theme_config->bootstrap_theme == 'material-lime'} selected="selected"{/if}>Material Lime</option>
                        <option value="material-purple"{if $theme_config->bootstrap_theme == 'material-purple'} selected="selected"{/if}>Material Purple</option>
                        <option value="material-red"{if $theme_config->bootstrap_theme == 'material-red'} selected="selected"{/if}>Material Red</option>
                        <option value="material-teal"{if $theme_config->bootstrap_theme == 'material-teal'} selected="selected"{/if}>Material Teal</option>
                        <option value="bootswatch-cerulean"{if $theme_config->bootstrap_theme == 'bootswatch-cerulean'} selected="selected"{/if}>Bootswatch Cerulean</option>
                        <option value="bootswatch-cosmo"{if $theme_config->bootstrap_theme == 'bootswatch-cosmo'} selected="selected"{/if}>Bootswatch Cosmo</option>
                        <option value="bootswatch-cyborg"{if $theme_config->bootstrap_theme == 'bootswatch-cyborg'} selected="selected"{/if}>Bootswatch Cyborg</option>
                        <option value="bootswatch-darkly"{if $theme_config->bootstrap_theme == 'bootswatch-darkly'} selected="selected"{/if}>Bootswatch Darkly</option>
                        <option value="bootswatch-flatly"{if $theme_config->bootstrap_theme == 'bootswatch-flatly'} selected="selected"{/if}>Bootswatch Flatly</option>
                        <option value="bootswatch-journal"{if $theme_config->bootstrap_theme == 'bootswatch-journal'} selected="selected"{/if}>Bootswatch Journal</option>
                        <option value="bootswatch-litera"{if $theme_config->bootstrap_theme == 'bootswatch-litera'} selected="selected"{/if}>Bootswatch Litera</option>
                        <option value="bootswatch-lumen"{if $theme_config->bootstrap_theme == 'bootswatch-lumen'} selected="selected"{/if}>Bootswatch Lumen</option>
                        <option value="bootswatch-lux"{if $theme_config->bootstrap_theme == 'bootswatch-lux'} selected="selected"{/if}>Bootswatch Lux</option>
                        <option value="bootswatch-materia"{if $theme_config->bootstrap_theme == 'bootswatch-materia'} selected="selected"{/if}>Bootswatch Materia</option>
                        <option value="bootswatch-minty"{if $theme_config->bootstrap_theme == 'bootswatch-minty'} selected="selected"{/if}>Bootswatch Minty</option>
                        <option value="bootswatch-pulse"{if $theme_config->bootstrap_theme == 'bootswatch-pulse'} selected="selected"{/if}>Bootswatch Pulse</option>
                        <option value="bootswatch-sandstone"{if $theme_config->bootstrap_theme == 'bootswatch-sandstone'} selected="selected"{/if}>Bootswatch Sandstone</option>
                        <option value="bootswatch-simplex"{if $theme_config->bootstrap_theme == 'bootswatch-simplex'} selected="selected"{/if}>Bootswatch Simplex</option>
                        <option value="bootswatch-sketchy"{if $theme_config->bootstrap_theme == 'bootswatch-sketchy'} selected="selected"{/if}>Bootswatch Sketchy</option>
                        <option value="bootswatch-slate"{if $theme_config->bootstrap_theme == 'bootswatch-slate'} selected="selected"{/if}>Bootswatch Slate</option>
                        <option value="bootswatch-solar"{if $theme_config->bootstrap_theme == 'bootswatch-solar'} selected="selected"{/if}>Bootswatch Solar</option>
                        <option value="bootswatch-spacelab"{if $theme_config->bootstrap_theme == 'bootswatch-spacelab'} selected="selected"{/if}>Bootswatch Spacelab</option>
                        <option value="bootswatch-superhero"{if $theme_config->bootstrap_theme == 'bootswatch-superhero'} selected="selected"{/if}>Bootswatch Superhero</option>
                        <option value="bootswatch-united"{if $theme_config->bootstrap_theme == 'bootswatch-united'} selected="selected"{/if}>Bootswatch United</option>
                        <option value="bootswatch-yeti"{if $theme_config->bootstrap_theme == 'bootswatch-yeti'} selected="selected"{/if}>Bootswatch Yeti</option>
                        <option value="custom"{if $theme_config->bootstrap_theme == 'custom'} selected="selected"{/if}>Custom</option>
                    </select>
                </li>
            <ul>
            <label id="bootswatch_theme_label" labelfor="bootswatch_theme">{'Bootswatch theme'|@translate}</label>
            <select id="bootswatch_theme" name="bootswatch_theme"></select>
            <div id="theme_preview"></div>
            <dl id="boostrap_theme_descr" class="dl-horizontal">
                <dt>Dark Aperture</dt><dd>{'Dark Aperture\'s custom dark color theme'|@translate}</dd>
                <dt>Bootswatch</dt><dd>{'A color theme from'|@translate} <a href="https://bootswatch.com">https://bootswatch.com</a></dd>
                <dt>Material</dt><dd>Material design {'from'|@translate} <a href="http://fezvrasta.github.io/bootstrap-material-design">http://fezvrasta.github.io/bootstrap-material-design</a></dd>
            </dl>
            <input type="hidden" name="navbar_main_style" value="{$theme_config->navbar_main_style}">
            <input type="hidden" name="navbar_main_bg" value="{$theme_config->navbar_main_bg}">
            <input type="hidden" name="navbar_contextual_style" value="{$theme_config->navbar_contextual_style}">
            <input type="hidden" name="navbar_contextual_bg" value="{$theme_config->navbar_contextual_bg}">
        </fieldset>
        <fieldset>
            <legend>{'Page layout'|@translate}</legend>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="fluid_width"{if $theme_config->fluid_width} checked="checked"{/if}>
                        {'Use full width layout'|@translate}
                    </label>
                    <span class="info">{'Use full width containers that span the entire width of the viewport'|@translate}</span>
                </li>
                <li id="fluid_width_col_xxl">
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="fluid_width_col_xxl"{if $theme_config->fluid_width_col_xxl} checked="checked"{/if}>
                        {'Use 6 colums for viewports >= 1680px'|@translate}
                    </label>
                </li>
            </ul>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="logo_image_enabled"{if $theme_config->logo_image_enabled} checked="checked"{/if}>
                        {'Show site logo'|@translate}
                    </label>
                    <span class="info">{'Display a site logo image instead of plain text'|@translate}</span>
                </li>
                <li id="logo_image_path">
                    <label>
                        {'Path'|@translate}
                        <input type="text" name="logo_image_path" size="50" {if $theme_config->logo_image_path != ""}value="{$theme_config->logo_image_path}"{else}placeholder="relative/path/to/image"{/if}>
                    </label>
                    <span class="info">{'The path to the image, relative to your Piwigo installation folder'|@translate}</span>
                </li>
            </ul>
        </fieldset>
        <fieldset>
            <legend>{'Page header'|@translate}</legend>
            <ul>
                <li>
                    <label labelfor="page_header">{'Banner style'|@translate}</label>
                    <select name="page_header">
                        <option value="jumbotron"{if $theme_config->page_header == 'jumbotron'} selected="selected"{/if}>{'Jumbotron'|@translate}</option>
                        <option value="fancy"{if $theme_config->page_header == 'fancy'} selected="selected"{/if}>{'Hero image'|@translate}</option>
                        <option value="none"{if $theme_config->page_header == 'none'} selected="selected"{/if}>{'Disabled'|@translate}</option>
                    </select>
                </li>
                <li id="page_header_image">
                    <label>
                        {'Background image'|@translate}
                        <input type="text" name="page_header_image" size="50" {if $theme_config->page_header_image != ""}value="{$theme_config->page_header_image}"{else}placeholder="{'URL or releative path to the image'|@translate}"{/if}>
                    </label>
                    <span class="info">{'URL or releative path to the image'|@translate}</span>
                </li>
                <li id="page_header_navbars">
                    <label class="font-checkbox">
                      <span class="icon-check"></span>
                      <input type="checkbox" name="page_header_both_navs"{if $theme_config->page_header_both_navs} checked=checked{/if}>
                        {'Integrate lower navbar'|@translate}
                    </label>
                </li>
                <li id="page_header_full">
                    <label class="font-checkbox">
                      <span class="icon-check"></span>
                      <input type="checkbox" name="page_header_full"{if $theme_config->page_header_full} checked=checked{/if}>
                        {'Span the full viewport height'|@translate}
                    </label>
                </li>
            </ul>
        </fieldset>

        <fieldset>
            <legend>{'Page footer'|@translate}</legend>
            <ul>
                <li id="page_footer_theme_link">
                    <label class="font-checkbox">
                      <span class="icon-check"></span>
                      <input type="checkbox" name="theme_link_enabled"{if $theme_config->theme_link_enabled} checked=checked{/if}>
                        {'Show theme link'|@translate}
                    </label>
                </li>
                <li id="page_footer_contact_link">
                    <label class="font-checkbox">
                      <span class="icon-check"></span>
                      <input type="checkbox" name="contact_link_enabled"{if $theme_config->contact_link_enabled} checked=checked{/if}>
                        {'Show contact link'|@translate}
                    </label>
                </li>
            </ul>
        </fieldset>

        <fieldset>
            <legend>{'Main page display'|@translate}</legend>
            <ul>
                <li>
                    <label labelfor="category_wells">{'Display albums as Bootstrap media wells'|@translate}</label>
                    <select name="category_wells">
                        <option value="never"{if $theme_config->category_wells == 'never'} selected="selected"{/if}>{'Never'|@translate}</option>
                        <option value="always"{if $theme_config->category_wells == 'always'} selected="selected"{/if}>{'Always'|@translate}</option>
                        <option value="mobile_only"{if $theme_config->category_wells == 'mobile_only'} selected="selected"{/if}>{'On mobile devices only'|@translate}</option>
                    </select>
                    <span class="info">{'Display albums as media wells with squared thumbnails, similar to the smartpocket mobile theme.'|@translate}</span>
                </li>
                <li>
                    <label class="font-checkbox">
                       <span class="icon-check"></span>
                       <input type="checkbox" name="cat_show_descriptions"{if $theme_config->cat_show_descriptions} checked=checked{/if}>
                       {'Display album description when in grid view'|@translate}
                    </label>
                </li>
                <li>
                    <label class="font-checkbox">
                       <span class="icon-check"></span>
                       <input type="checkbox" name="category_show_recent"{if $theme_config->category_show_recent} checked=checked{/if}>
                       {'Indicate recent albums'|@translate}
                    </label>
                </li>
            </ul>
        </fieldset>
        <fieldset>
            <legend>{'Album page display'|@translate}</legend>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="thumbnail_caption"{if $theme_config->thumbnail_caption} checked="checked"{/if}>
                        {'Show image caption'|@translate}
                    </label>
                </li>
                <li>
                    <label class="font-checkbox">
                    <span class="icon-check"></span>
                    <input type="checkbox" name="thumbnail_nb_images" {if $theme_config->thumbnail_nb_images}checked="checked"{/if}>
                    {'Display number of images in breadcrumb'|@translate}
                    </label>
                </li>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="picture_show_recent"{if $theme_config->picture_show_recent} checked="checked"{/if}>
                        {'Indicate recent images'|@translate}
                    </label>
                </li>
            </ul>
        </fieldset>
        <fieldset>
            <legend>{'Picture page display'|@translate}</legend>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="picture_caption"{if $theme_config->picture_caption} checked="checked"{/if}>
                        {'Show image caption'|@translate}
                    </label>
                </li>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="picture_desc"{if $theme_config->picture_desc} checked="checked"{/if}>
                        {'Use description rather than title for images'|@translate}
                    </label>
                </li>
                <li>
                    <label labelfor="picture_info">{'Picture info display position'|@translate}</label>
                    <select name="picture_info">
                        <option value="cards"{if $theme_config->picture_info == 'cards'} selected="selected"{/if}>{'Card grid below the image'|@translate}</option>
                        <option value="tabs"{if $theme_config->picture_info == 'tabs'} selected="selected"{/if}>{'Tabs below the image'|@translate}</option>
                        <option value="sidebar"{if $theme_config->picture_info == 'sidebar'} selected="selected"{/if}>{'Sidebar (like Boostrap Default)'|@translate}</option>
                        <option value="disabled"{if $theme_config->picture_info == 'disabled'} selected="selected"{/if}>{'Disabled'|@translate}</option>
                    </select>
                </li>
                <li id="picture_show_extended_metadata">
                    <label class="font-checkbox">
                      <span class="icon-check"></span>
                      <input type="checkbox" name="picture_show_extended_metadata"{if $theme_config->picture_show_extended_metadata} checked=checked{/if}>
                        {'Show extended metadata'|@translate}
                    </label>
                </li>
            </ul>
        </fieldset>
        <fieldset class="mainConf">
            <legend>{'Custom CSS'|@translate}</legend>
            <textarea name="custom_css" cols="80" rows="10">{if $theme_config->custom_css}{$theme_config->custom_css}{/if}</textarea>
        </fieldset>
      </div>

      <div id="components" class="tab-content">
        <fieldset class="mainConf">
            <legend>Slick Carousel {'Settings'|@translate}</legend>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="slick_enabled"{if $theme_config->slick_enabled} checked="checked"{/if}>
                        {'Enabled'|@translate}
                    </label>
                    <span class="info">{'Enable the slick carousel below the main image on the picture page'|@translate}.</span>
                </li>
            </ul>
            <ul>
                <li>
                    <label labelfor="slick_lazyload">{'lazyLoad method'|@translate}</label>
                    <select name="slick_lazyload">
                        <option value="ondemand"{if $theme_config->slick_lazyload == 'ondemand'} selected="selected"{/if}>ondemand</option>
                        <option value="progressive"{if $theme_config->slick_lazyload == 'progressive'} selected="selected"{/if}>progressive</option>
                    </select>
                    <span class="info"><em>ondemand</em> {'will load the image as soon as you slide to it'|@translate}. <em>progressive</em> {'loads all images one after another when the page loads (use carefully!)'|@translate}.</span>
                </li>
            </ul>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="slick_infinite"{if $theme_config->slick_infinite} checked="checked"{/if}>
                        {'Infinite looping'|@translate}
                    </label>
                    <span class="info">{'Endlessly scroll through album images'|@translate}</span>
                </li>
            </ul>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="slick_centered"{if $theme_config->slick_centered} checked="checked"{/if}>
                        {'Center mode'|@translate}
                    </label>
                    <span class="info">{'Display the currently selected image in the middle. Works best with infinite looping enabled.'|@translate}</span>
                </li>
            </ul>
        </fieldset>
        <fieldset>
            <legend>PhotoSwipe {'Settings'|@translate}</legend>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="photoswipe"{if $theme_config->photoswipe} checked="checked"{/if}>
                        {'Enabled'|@translate}
                    </label>
                    <span class="info">{'Enable PhotoSwipe fullscreen slideshow. Disable if you prefer to use Plugins like Fotorama or Piwigo\'s default slideshow.'|@translate}</span>
                </li>
                <li>
                    <label labelfor="photoswipe_interval">{'Autoplay interval'|@translate}</label>
                    <input type="number" name="photoswipe_interval" value="{$theme_config->photoswipe_interval}" min="1000" max="50000"> {'milliseconds'|@translate}
                </li>
            </ul>
        </fieldset>
        <fieldset>
            <legend>{'Quick search'|@translate}</legend>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="quicksearch_navbar"{if $theme_config->quicksearch_navbar} checked="checked"{/if}>
                        {'Quick search'|@translate} {'directly in the navigation bar'|@translate}
                    </label>
                </li>
            </ul>
        </fieldset>
        <fieldset class="mainConf">
            <legend>{'Comments'|@translate}</legend>
            <ul>
                <li>
                    <label class="radio">
                        <input type="radio" name="comments_type" value="piwigo"{if $theme_config->comments_type == 'piwigo'} checked="checked"{/if} />
                        {'Piwigo'|@translate}
                    </label>
                    <label class="radio">
                        <input id="comments_radio_disqus" type="radio" name="comments_type" value="disqus"{if $theme_config->comments_type == 'disqus'} checked="checked"{/if} />
                        {'Disqus'|@translate}
                    </label>
                </li>
                <li id="comments_type_disqus">
                    <label for="comments_disqus_shortname">{'Disqus shortname'|@translate}</label><br />
                    <input id="comments_disqus_shortname" name="comments_disqus_shortname" type="text" value="{$theme_config->comments_disqus_shortname}" size="50" />
                </li>
            </ul>
        </fieldset>
        <fieldset class="mainConf">
            <legend>{'Tag cloud'|@translate}</legend>
            <ul>
                <li>
                    <label class="radio">
                        <input type="radio" name="tag_cloud_type" value="basic"{if $theme_config->tag_cloud_type == 'basic'} checked="checked"{/if} />
                        {'Basic'|@translate}
                    </label>
                    <label class="radio">
                        <input type="radio" name="tag_cloud_type" value="html5"{if $theme_config->tag_cloud_type == 'html5'} checked="checked"{/if} />
                        {'HTML 5 canvas'|@translate}
                    </label>
                </li>
            </ul>
        </fieldset>
      </div>

      <div id="social-integration" class="tab-content">  
        <fieldset class="mainConf">
            <legend>{'Social integration'|@translate}</legend>
            <ul>
                <li>
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="social_enabled"{if $theme_config->social_enabled} checked="checked"{/if}>
                        {'Enabled'|@translate}
                    </label>
                </li>
                <li id="social_instagram" class="ident">
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="social_instagram"{if $theme_config->social_instagram}  checked="checked"{/if}>
                        {'Instagram'|@translate}
                    </label>
                </li>
                <li id="social_bluesky" class="ident">
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="social_bluesky"{if $theme_config->social_bluesky}  checked="checked"{/if}>
                        {'Bluesky'|@translate}
                    </label>
                </li>
                <li id="social_mastodon" class="ident">
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="social_mastodon"{if $theme_config->social_mastodon}  checked="checked"{/if}>
                        {'Mastodon'|@translate}
                    </label>
                    <ul> 
                        <li id="social_mastodon_instance">
                        <label>
                            {'Instance'|@translate}
                            <input type="text" name="social_mastodon_instance" size="50"
                                {if $theme_config->social_mastodon_instance != ""}
                                    value="{$theme_config->social_mastodon_instance}"
                                {else}
                                    placeholder="mastodon.social"
                                {/if}>
                        </label>
                        <span class="info">{'Instance name. E.g. mastodon.social'|@translate}</span>
                        </li>
                    </ul>
                </li>
                <li id="social_x" class="ident">
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="social_x"{if $theme_config->social_x}  checked="checked"{/if}>
                        {'X'|@translate}
                    </label>
                </li>
                <li id="social_facebook" class="ident">
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="social_facebook"{if $theme_config->social_facebook}  checked="checked"{/if}>
                        {'Facebook'|@translate}
                    </label>
                </li>
                <li id="social_pinterest" class="ident">
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="social_pinterest"{if $theme_config->social_pinterest}  checked="checked"{/if}>
                        {'Pinterest'|@translate}
                    </label>
                </li>
                <li id="social_buttons">
                    <label class="font-checkbox">
                        <span class="icon-check"></span>
                        <input type="checkbox" name="social_buttons"{if $theme_config->social_buttons} checked="checked"{/if}>
                        {'Use colored share buttons instead of icons'|@translate}
                    </label>
                </li>
            </ul>
        </fieldset>
      </div>
    </div>
    <p class="formButtons">
        <input type="submit" name="submit" value="{'Save Settings'|@translate}">
    </p>
</form>


{* Handle show/hide of conditional fields *}
{footer_script require="jquery"}
(function(){
    var targets = {
        'input[name="social_enabled"]': [
            '#social_instagram',
            '#social_bluesky',
            '#social_mastodon',
            '#social_mastodon_instance',
            '#social_x', 
            '#social_facebook', 
            '#social_pinterest', 
            '#social_buttons'],
        '#comments_radio_disqus': ['#comments_type_disqus'],
        'input[name="fluid_width"]': ['#fluid_width_col_xxl'],
        'input[name="logo_image_enabled"]': ['#logo_image_path'],
        'input[name="social_mastodon"]': ['#social_mastodon_instance'],
    };
    for (selector in targets) {
        for (target of targets[selector]) {
            jQuery(target).toggle(jQuery(selector).is(':checked'));

            (function(target){
                jQuery(selector).on('change', function() {
                    jQuery(target).toggle($(this).is(':checked'));
                });
            })(target);
        }
    };
}());


$(document).ready(function(){
  $('ul.tabs li').click(function(){
    var tab_id = $(this).attr('data-tab');

    $('ul.tabs li').removeClass('current');
    $('.tab-content').removeClass('current');

    $(this).addClass('current');
    $("#"+tab_id).addClass('current');
  })
})


var select_bootswatch = $("#bootswatch_theme");
var label_bootswatch = $("#bootswatch_theme_label");
var preview = $("#theme_preview");
var cur_theme = '{$theme_config->bootswatch_theme}';
function getBootswatchThemes() {
    $.getJSON("https://bootswatch.com/api/3.json", function (data) {
      var themes = data.themes;
      select_bootswatch.show();
      label_bootswatch.show();

      themes.forEach(function(value, index){
        $name = value.name;
        $lname = $name.toLowerCase();
        select_bootswatch.append($("<option />")
              .val($lname)
              .text($name));

        if ($lname === cur_theme) {
           $('option[value=' + $lname + ']').attr('selected', 'selected');
        }
      });
      preview.html('<img src="themes/dark_aperture/components/bootswatch/' + select_bootswatch.val() + '/thumbnail.png" width="50%" style="padding: 10px 0;"/>');
      preview.show();

    }, "json").fail(function(){
        $(".alert").toggleClass("alert-info alert-danger");
        $(".alert h4").text("Failed to load available Bootswatch Themes!");
    });

}

$(document).ready(function() {
  if ($('select[name=bootstrap_theme]').val() === 'bootswatch') {
    getBootswatchThemes();
  } else {
    preview.html('<img src="themes/dark_aperture/admin/img/' + $('select[name=bootstrap_theme]').val() + '.png" style="padding: 10px 0;"/>');
    preview.show();
  }

  if ($('select[name=page_header]').val() === 'fancy') {
    $('#page_header_image').show();
    $('#page_header_navbars').show();
  } else {
    $('#page_header_image').hide();
    $('#page_header_navbars').hide();
    $('#page_header_full').hide();
  }
});

$('select[name=page_header]').change(function() {
  if ($(this).val() == 'fancy') {
    $('#page_header_image').show();
    $('#page_header_navbars').show();
    $('#page_header_full').show();
  } else {
    $('#page_header_image').hide();
    $('#page_header_navbars').hide();
    $('#page_header_full').hide();
  }
});

$('select[name=bootstrap_theme]').change(function() {
  var navbar_main_style = 'navbar-dark',
      navbar_main_bg = 'bg-dark',
      navbar_contextual_style = 'navbar-dark',
      navbar_contextual_bg = 'bg-light',
      bs_theme = $('select[name=bootstrap_theme]').val();

  switch(bs_theme) {
    case 'bootstrap-default':
      navbar_contextual_style = 'navbar-light';
      break;
    case (bs_theme.match(/^material-(amber|lime)/) || {}).input:
      navbar_contextual_style = 'navbar-light';
      navbar_contextual_bg = 'bg-primary';
      break;
    case (bs_theme.match(/^material/) || {}).input:
      navbar_contextual_bg = 'bg-primary';
      break;
    case (bs_theme.match(/^bootswatch-(litera|simplex)/) || {}).input:
      navbar_main_style = 'navbar-light';
      navbar_main_bg = 'bg-light';
      navbar_contextual_style = 'navbar-light';
      navbar_contextual_bg = 'bg-light';
      break;
    case (bs_theme.match(/^bootswatch-(cyborg|solar)/) || {}).input:
      navbar_main_bg = 'bg-dark';
      navbar_contextual_bg = 'bg-dark';
      break;
    case (bs_theme.match(/^bootswatch/) || {}).input:
      navbar_main_bg = 'bg-primary';
      navbar_contextual_bg = 'bg-primary';
      break;
    case 'bootswatch':
      getBootswatchThemes();
      break;
    default:
      navbar_main_style = 'navbar-dark';
      navbar_main_bg = 'bg-dark';
      navbar_contextual_style = 'navbar-dark';
      navbar_contextual_bg = 'bg-light';
      select_bootswatch.empty()
      select_bootswatch.hide();
      label_bootswatch.hide();
      break;
  }

  preview.html('<img src="themes/dark_aperture/admin/img/' + $('select[name=bootstrap_theme]').val() + '.png" style="padding: 10px 0;"/>');

  $('input[name=navbar_main_style]').attr('value', navbar_main_style);
  $('input[name=navbar_main_bg]').attr('value', navbar_main_bg);
  $('input[name=navbar_contextual_style]').attr('value', navbar_contextual_style);
  $('input[name=navbar_contextual_bg]').attr('value', navbar_contextual_bg);
});
$(select_bootswatch).change(function() {
    preview.html('<img src="themes/dark_aperture/components/bootswatch/' + select_bootswatch.val() + '/thumbnail.png" width="50%" style="padding: 10px 0;"/>');
});

{/footer_script}
