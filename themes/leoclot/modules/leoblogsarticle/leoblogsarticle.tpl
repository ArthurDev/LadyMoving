{*
* 2007-2012 PrestaShop
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
*  @copyright  2007-2012 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<!-- MODULE leo blogs article -->
<div id="leoblogsarticle" class="block products_block exclusive leoblogsarticle col-md-6">
	<div class="leo-titleh3">
        {if $type == "lastest"}
            <h3 class="title_specials">{l s='Our Blog' mod='leoblogsarticle'}</h3>
        {else if $type == "featured"}
        	<h3 class="title_specials">{l s='Featured Articles' mod='leoblogsarticle'}</h3>
        {else}
        	<h3 class="title_specials">{l s='Popular Articles' mod='leoblogsarticle'}</h3>  
        {/if}
       </div>
	<div class="block_content">	
		{if !empty($items)}
                <div class="carousel slide" id="leoblogsarticletab">
                        {if count($items)>$itemsperpage}	
                        <div class="carousel-button control-specials">
                            <a class="carousel-control left" href="#leoblogsarticletab"   data-slide="prev"><i class="fa fa-angle-left"></i></a>
                            <a class="carousel-control right" href="#leoblogsarticletab"  data-slide="next"><i class="fa fa-angle-right"></i></a>
                        </div>
                        {/if}
                        <div class="carousel-inner">
                        {$mitems=array_chunk($items,$itemsperpage)}
                        {foreach from=$mitems item=items name=mypLoop}
                                <div class="item {if $smarty.foreach.mypLoop.first}active{/if}">
									{foreach from=$items item=item name=items}
									{if $item@iteration%$columnspage==1&&$columnspage>1}
									  <div class="row-fluid">
									{/if}
									<div class="item-container col-xs-{$scolumn}">
										<div class="blog-image">
											
											<a href="{$item.link}" title="{$item.title}" >
												<img class="item_thumb"  src="{$thumbUri}{$item.image}" alt="{$item.title}" />    
											</a>  
										</div>
										
										<div class="blog-descrition thumbnails">
											<div class="blog-title">
												<a class="itemTitle s_title_block" href="{$item.link}" title="{$item.title}" >{$item.title}</a>										
											</div>
											<div class="blog-date">{$item.date_add}</div>
											<div class="item_descrition">
												{$item.short_desc|strip_tags:'UTF-8'|truncate:150:'...'}
											</div>
											<div class="blog-datemore">
												
												<div class="blog-viewmore"><a href="{$item.link}">{l s='Read more ' mod='leoblogsarticle'}</a></div>
											</div>
										</div>                   
										
										<div class="clearfix"></div>
									</div>

									{if ($item@iteration%$columnspage==0||$smarty.foreach.items.last)&&$columnspage>1}
											</div>
									{/if}

									{/foreach}
                                </div>		
                        {/foreach}
                        </div>
                </div>
                {/if}
	</div>
</div>
<!-- /MODULE Block specials -->
<script>
$(document).ready(function() {
    $('.carousel').each(function(){
        $(this).carousel({
            pause: true,
            interval: false
        });
    });
	 
});
</script>
 