{*
* 2007-2013 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2013 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7 " lang="{$lang_iso}"> <![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8 ie7" lang="{$lang_iso}"> <![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9 ie8" lang="{$lang_iso}"> <![endif]-->
<!--[if gt IE 8]> <html class="no-js ie9" lang="{$lang_iso}"> <![endif]-->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$lang_iso}">
	<head>
		<title>{$meta_title|escape:'htmlall':'UTF-8'}</title>
        {if $LEO_RESPONSIVE}
			<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0">
        {/if}    
{if isset($meta_description) AND $meta_description}
		<meta name="description" content="{$meta_description|escape:html:'UTF-8'}" />
{/if}
{if isset($meta_keywords) AND $meta_keywords}
		<meta name="keywords" content="{$meta_keywords|escape:html:'UTF-8'}" />
{/if}
		<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
		<meta http-equiv="content-language" content="{$meta_language}" />
		<meta name="generator" content="PrestaShop" />
		<meta name="robots" content="{if isset($nobots)}no{/if}index,{if isset($nofollow) && $nofollow}no{/if}follow" />
		<link rel="icon" type="image/vnd.microsoft.icon" href="{$favicon_url}?{$img_update_time}" />
		<link rel="shortcut icon" type="image/x-icon" href="{$favicon_url}?{$img_update_time}" />
		<script type="text/javascript">
			var baseDir = '{$content_dir|addslashes}';
			var baseUri = '{$base_uri|addslashes}';
			var static_token = '{$static_token|addslashes}';
			var token = '{$token|addslashes}';
			var priceDisplayPrecision = {$priceDisplayPrecision*$currency->decimals};
			var priceDisplayMethod = {$priceDisplay};
			var roundMode = {$roundMode};
		</script>
        <link rel="stylesheet" type="text/css" href="{$BOOTSTRAP_CSS_URI}"/> 
		<link rel="stylesheet" type="text/css" href="{$content_dir}themes/{$LEO_THEMENAME}/css/font-awesome.min.css"/>
{if isset($css_files)}
	{foreach from=$css_files key=css_uri item=media}
	<link href="{$css_uri}" rel="stylesheet" type="text/css" media="{$media}" />
	{/foreach}
{/if}
{if $LEO_SKIN_DEFAULT &&  $LEO_SKIN_DEFAULT !="default"}
	<link rel="stylesheet" type="text/css" href="{$content_dir}themes/{$LEO_THEMENAME}/skins/{$LEO_SKIN_DEFAULT}/css/skin.css"/>
{/if}
	<link rel="stylesheet" type="text/css" href="{$content_dir}themes/{$LEO_THEMENAME}/css/theme-responsive.css"/>


{if isset($js_files)}
	{foreach from=$js_files item=js_uri}
	<script type="text/javascript" src="{$js_uri}"></script>
	{/foreach}
{/if}
{$LEO_CUSTOMWIDTH}
{if !$LEO_CUSTOMFONT}
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,300italic,300,400italic,500' rel='stylesheet' type='text/css' />
{/if}
<link rel="stylesheet" type="text/css" href="{$content_dir}themes/{$LEO_THEMENAME}/css/font-awesome.min.css"/>
<script type="text/javascript" src="{$content_dir}themes/{$LEO_THEMENAME}/js/custom.js"></script>
<script type="text/javascript" src="{$content_dir}themes/{$LEO_THEMENAME}/js/jquery.cookie.js"></script>

{if $hide_right_column||in_array($page_name,array('checkout','index','order','address','my-account'))}{$HOOK_RIGHT_COLUMN=null}{/if}
{if $hide_left_column|| in_array($page_name,array('checkout','order','address','addresses','authentication'))}{$HOOK_LEFT_COLUMN=null}{/if}


<!--[if lt IE 9]>
<script src="{$content_dir}themes/{$LEO_THEMENAME}/js/html5.js"></script>
<script src="{$content_dir}themes/{$LEO_THEMENAME}/js/respond.min.js"></script>
<![endif]-->
	{$HOOK_HEADER}	
	</head>

	<body {if isset($page_name)}id="{$page_name|escape:'htmlall':'UTF-8'}"{/if} class="{$LEO_BGPATTERN} fs{$FONT_SIZE} {if isset($page_name)}{$page_name|escape:'htmlall':'UTF-8'}{/if}{if $hide_left_column} hide-left-column{/if}{if $hide_right_column} hide-right-column{/if}{if $content_only} content_only{/if} keep-header ">
	<p style="display: block;" id="back-top"> <a href="#top"><span></span></a> </p>
	{if !$content_only}
		{if isset($restricted_country_mode) && $restricted_country_mode}
		<div id="restricted-country">
			<p>{l s='You cannot place a new order from your country.'} <span class="bold">{$geolocation_country}</span></p>
		</div>
		{/if}
		<section id="page" class="clearfix leo-wrapper">
			
			<!-- Header -->
			<header id="header" class="navbar-fixed-top clearfix">
				<section id="topbar">
					<div class="container">		
						{$HOOK_TOP}	
					</div>
				</section>
				<section id="header-main">
					<div class="container" >
							
							<div class="header-wrap">
								<div class="pull-left logo">
									<h1>
										<a id="header_logo" href="{$base_dir}">
											<img class="logo" src="{$logo_url}" alt="Lady Moving - Massy" />
										</a>
									</h1>
								</div>
								{if !empty($HOOK_HEADERRIGHT)}
									<div id="header_right" class="inner">
										{$HOOK_HEADERRIGHT}	
									</div>
								{/if}
								{if !empty($HOOK_TOPNAVIGATION) }
									<nav id="topnavigation" class="clearfix">
										<div class="container">
											<div class="row">
												 {$HOOK_TOPNAVIGATION}
											</div>
										</div>
									</nav>
								{/if}
							</div>
						
					</div>
				</section>	
			</header>
			
			{if $HOOK_SLIDESHOW &&  in_array($page_name,array('index'))}
			<section id="slideshow" class="block clearfix">
					{$HOOK_SLIDESHOW} 
			</section>
			{/if}
			{if $HOOK_PROMOTETOP &&  in_array($page_name,array('index'))}
			<section id="promotetop" class="clearfix">
				<div class="container">
					<div class="row">
						 {$HOOK_PROMOTETOP}
					</div>
				</div>
			</section>
			{/if}
			{if !in_array($page_name,array('index'))}					
				<section id="breadcrumb" class="clearfix">
					<div class="container"> 
						{include file="$tpl_dir./breadcrumb.tpl"} 
					</div>
				</section>					
			{/if}
			<section id="columns" class="clearfix leo-showcase">
				<div class="container">
					<div class="row">
						{include file="$tpl_dir./layout/{$LEO_LAYOUT_DIRECTION}/header.tpl" hide_left_column=$hide_left_column hide_right_column=$hide_right_column }
	{/if}
