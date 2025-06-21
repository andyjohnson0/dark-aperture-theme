{* Modified by Andrew Johnson for Dark Aperture theme *}

<!-- Start of picture.tpl -->
{if get_device() != 'desktop'}
{combine_script id='jquery.mobile-events' path='themes/dark_aperture/node_modules/jQuery-Touch-Events/src/jquery.mobile-events.min.js' require='jquery' load='footer'}
{/if}

{if !empty($PLUGIN_PICTURE_BEFORE)}{$PLUGIN_PICTURE_BEFORE}{/if}

{$PICTURE_NAV}

<div id="main-picture-container" class="container{if $theme_config->fluid_width}-fluid{/if}">
{include file='infos_errors.tpl'}

  <div class="row justify-content-center">
    {include file='picture_nav_buttons.tpl'|@get_extent:'picture_nav_buttons'}
  </div>
{if get_device() != 'desktop' }
{footer_script require="jquery"}{strip}
$('#theImage img').bind('swipeleft swiperight', function (event) {
   if (event.type == 'swipeleft') {
       $('#navigationButtons a#navNextPicture i').click();
   } else if (event.type == 'swiperight') {
       $('#navigationButtons a#navPrevPicture i').click(); 
   } else { 
       return;
   }
});
{/strip}{/footer_script}
{/if}

  <div id="theImage" class="row d-block justify-content-center mb-3">
    {$ELEMENT_CONTENT}
  </div>

{if $theme_config->picture_info == 'sidebar'}
    {include file='picture_info_sidebar.tpl'}
{/if}

<!-- Caption -->
{if $theme_config->picture_caption}
  {assign var="COMMENT_IMG" value=$current.name|escape:'html'}
  {if $theme_config->picture_desc && isset($metadata) && isset($metadata[1].lines) && isset($metadata[1].lines.iptc_description)}
    {assign var="COMMENT_IMG" value=$metadata[1].lines.iptc_description|escape:'html'}
  {/if}
{/if}

  <div id="theImageComment" class="row justify-content-center mb-3">
{if isset($COMMENT_IMG)}
    <div class="text-center col-lg-10 col-md-12 mx-auto">
      <section id="important-info">
        <h5 class="imageComment">{$COMMENT_IMG}</h5>
      </section>
    </div>
{/if}
  </div>

{include file="http_scheme.tpl"}
{if $theme_config->social_enabled}
  <div id="theImageShareButtons" class="row justify-content-center{if !$theme_config->slick_enabled} pb-4{/if}">
    <section id="share">
{if $theme_config->social_instagram}
        <a href="https://www.facebook.com/sharer/sharer.php?u={$http_scheme}://{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}" 
           target="_blank" 
           title="{'Share on'|@translate}&nbsp;{'Instagram'|@translate}"
           {if $theme_config->social_buttons} class="btn btn-instagram"{/if}>
            <i class="fab fa-instagram"></i>{if $theme_config->social_buttons} &nbsp; {'Instagram'|@translate}{/if}
        </a>
{/if}
{if $theme_config->social_bluesky}
        <a href="https://bsky.app/intent/compose/?text={$current.TITLE|escape}%0A{$http_scheme}://{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}"
           target="_blank" 
           title="{'Share on'|@translate}&nbsp;{'Bluesky'|@translate}"
           {if $theme_config->social_buttons} class="btn btn-bluesky"{/if}>
          <i class="fa-brands fa-bluesky"></i>{if $theme_config->social_buttons} &nbsp; {'Bluesky'|@translate}{/if}
        </a>
{/if}
{if $theme_config->social_mastodon}
    {assign var="mastodon_instance" value=$theme_config->social_mastodon_instance|default:"https://mastodon.social"}
    <a href="https://{$mastodon_instance}/share?text={$current.TITLE|escape:'url'}%20{$http_scheme}://{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}"
       target="_blank" 
       title="{'Share on'|@translate}&nbsp;{'Mastodon'|@translate}"
       {if $theme_config->social_buttons} class="btn btn-mastodon"{/if}>
      <i class="fab fa-mastodon"></i>{if $theme_config->social_buttons} &nbsp; {'Mastodon'|@translate}{/if}
    </a>
{/if}
{if $theme_config->social_x}
        <a href="https://x.com/intent/post?text={$current.TITLE|escape}&amp;url={$http_scheme}://{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}"
           target="_blank" 
           title="{'Share on'|@translate}&nbsp;{'X'|@translate}"
           {if $theme_config->social_buttons} class="btn btn-x-twitter"{/if}>
          <i class="fab fa-x-twitter"></i>
        </a>
{/if}
{if $theme_config->social_facebook}
        <a href="https://www.facebook.com/sharer/sharer.php?u={$http_scheme}://{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}"
           target="_blank" 
           title="{'Share on'|@translate}&nbsp;{'Facebook"'|@translate}"
           {if $theme_config->social_buttons} class="btn btn-facebook"{/if}>
          <i class="fab fa-facebook"></i>{if $theme_config->social_buttons} &nbsp; {'Facebook'|@translate}{/if}
        </a>
{/if}
{if $theme_config->social_pinterest}
        <a href="https://www.pinterest.com/pin/create/button/?url={$http_scheme}://{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}
           {if isset($current.derivatives.large)}
              &media={$http_scheme}://{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}/../{$current.derivatives.large->get_url()}
           {/if}"
           target="_blank" 
           title="{'Share on'|@translate}&nbsp;{'Pinterest'|@translate}"
           {if $theme_config->social_buttons} class="btn btn-pinterest"{/if}>
          <i class="fab fa-pinterest"></i>{if $theme_config->social_buttons} &nbsp; {'Pinterest'|@translate}{/if}
        </a>
{/if}
    </section>
  </div>
{/if}
</div>

<div id="carousel-container" class="container">
{if !empty($thumbnails) && ($theme_config->slick_enabled || $theme_config->photoswipe)}
  <div id="theImageCarousel" class="row mx-0{if !$theme_config->slick_enabled} d-none{/if}">
    <div class="col-lg-10 col-md-12 mx-auto">
      <div id="thumbnailCarousel" class="slick-carousel{if $theme_config->slick_centered} center{/if}">
  {assign var=idx value=0}
  {foreach from=$thumbnails item=thumbnail}
  {assign var=derivative value=$pwg->derivative($derivative_params_square, $thumbnail.src_image)}
  {if !$theme_config->slick_infinite}
    {assign var=derivative_medium value=$pwg->derivative($derivative_params_medium, $thumbnail.src_image)}
    {assign var=derivative_large value=$pwg->derivative($derivative_params_large, $thumbnail.src_image)}
    {assign var=derivative_xxlarge value=$pwg->derivative($derivative_params_xxlarge, $thumbnail.src_image)}
  {/if}
  {if !$derivative->is_cached()}
    {combine_script id='jquery.ajaxmanager' path='themes/default/js/plugins/jquery.ajaxmanager.js' load='footer'}
    {combine_script id='thumbnails.loader' path='themes/default/js/thumbnails.loader.js' require='jquery.ajaxmanager' load='footer'}
  {/if}
  {if $theme_config->photoswipe && !$theme_config->slick_infinite}
        <div class="text-center{if $thumbnail.id eq $current.id && !$theme_config->slick_infinite} thumbnail-active{/if}">
          <a {if $thumbnail.id eq $current.id} id="thumbnail-active"{/if} href="{$thumbnail.URL}" data-index="{$idx}" data-name="{$thumbnail.NAME}" data-description="{$thumbnail.DESCRIPTION}" {if !$theme_config->slick_infinite}data-src-xlarge="{$derivative_xxlarge->get_url()}" data-size-xlarge="{$derivative_xxlarge->get_size_hr()}" data-src-large="{$derivative_large->get_url()}" data-size-large="{$derivative_large->get_size_hr()}" data-src-medium="{$derivative_medium->get_url()}" data-size-medium="{$derivative_medium->get_size_hr()}"{if preg_match("/(mp4|m4v)$/", $thumbnail.PATH)} data-src-original="{$U_HOME}{$thumbnail.PATH}" data-size-original="{$thumbnail.SIZE}" data-video="true"{/if}{/if}>
  {else}
        <div class="text-center{if $thumbnail.id eq $current.id} thumbnail-active{/if}">
          <a href="{$thumbnail.URL}">
  {/if}
            <img {if $derivative->is_cached()}data-lazy="{$derivative->get_url()}"{else}data-lazy="{$ROOT_URL}{$themeconf.icon_dir}/img_small.png" data-src="{$derivative->get_url()}"{/if} alt="{$thumbnail.TN_ALT}" title="{if isset($thumbnail.TN_TITLE)}{$thumbnail.TN_TITLE}{/if}" class="img-fluid {if isset($thumbnail.path_ext)}path-ext-{$thumbnail.path_ext}{/if} {if isset($thumbnail.file_ext)}file-ext-{$thumbnail.file_ext}{/if}">
          </a>
        </div>
  {assign var=idx value=$idx+1}
  {/foreach}
      </div>
    </div>
  </div>

  {if $theme_config->photoswipe && $theme_config->slick_infinite}
  <div id="photoSwipeData" class="d-none">
    {assign var=idx value=0}
    {foreach from=$thumbnails item=thumbnail}
    {assign var=derivative_medium value=$pwg->derivative($derivative_params_medium, $thumbnail.src_image)}
    {assign var=derivative_large value=$pwg->derivative($derivative_params_large, $thumbnail.src_image)}
    {assign var=derivative_xxlarge value=$pwg->derivative($derivative_params_xxlarge, $thumbnail.src_image)}
    <a{if $thumbnail.id eq $current.id} id="thumbnail-active"{/if} href="{$thumbnail.URL}" data-index="{$idx}" data-name="{$thumbnail.NAME}" data-description="{$thumbnail.DESCRIPTION}" data-src-xlarge="{$derivative_xxlarge->get_url()}" data-size-xlarge="{$derivative_xxlarge->get_size_hr()}" data-src-large="{$derivative_large->get_url()}" data-size-large="{$derivative_large->get_size_hr()}" data-src-medium="{$derivative_medium->get_url()}" data-size-medium="{$derivative_medium->get_size_hr()}"{if preg_match("/(mp4|m4v)$/", $thumbnail.PATH)} data-src-original="{$U_HOME}{$thumbnail.PATH}" data-size-original="{$thumbnail.SIZE}" data-video="true"{/if}></a>
{assign var=idx value=$idx+1}
    {/foreach}
  </div>
  {/if}
  {if $theme_config->slick_enabled && sizeOf($thumbnails) > 1}
    {include file="_slick_js.tpl"}
  {/if}
  {if $theme_config->photoswipe && !$theme_config->slick_infinite}
    {include file="_photoswipe_js.tpl" selector="#thumbnailCarousel"}
  {/if}
  {if $theme_config->photoswipe && $theme_config->slick_infinite}
    {include file="_photoswipe_js.tpl" selector="#photoSwipeData"}
  {/if}
{/if}
</div>

<div id="info-container" class="container{if $theme_config->fluid_width}-fluid{/if}">
  <div id="theImageInfos" class="row justify-content-center">
{if $theme_config->picture_info == 'cards'}
    {include file='picture_info_cards.tpl'}
{elseif $theme_config->picture_info == 'tabs'}
    {include file='picture_info_tabs.tpl'}
{elseif $theme_config->picture_info == 'sidebar' || $theme_config->picture_info == 'disabled'}
    <div class="col-lg-8 col-md-10 col-12 mx-auto">
      {include file='picture_info_comments.tpl'}
    </div>
{/if}
  </div>

{if !empty($PLUGIN_PICTURE_AFTER)}{$PLUGIN_PICTURE_AFTER}{/if}

</div>
