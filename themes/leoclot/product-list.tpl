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

{if isset($products)}
	<!-- Products list -->
	<div id="product_list" class="clearfix">
	{foreach from=$products item=product name=products}
		{if Configuration::get('productlistcols')>1&&($product@iteration%Configuration::get('productlistcols')==1)}
			<div class="clearfix  product-block row">
		{/if}
			<div class="col-md-{(12/Configuration::get('productlistcols'))} ajax_block_product {if ($product@iteration%Configuration::get('productlistcols')!=0 && $smarty.foreach.products.last)}
			last-item {/if}">
				<div class="product-container">
					<div class="image">
						
							<a href="{$product.link|escape:'htmlall':'UTF-8'}" class=" product_img_link" title="{$product.name|escape:'htmlall':'UTF-8'}">						
								<img src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html'}" alt="{$product.legend|escape:'htmlall':'UTF-8'}" class="img img-responsive" />
															
								<span class="product-additional" rel="{$product.id_product}"></span>
							</a> 
							{if isset($product.new) && $product.new == 1}<span class="new"><span>{l s='New'}</span></span>{/if}
							
						<div class="product_bottom hidden-xs">								
							<a class="quick-view" title="{l s='Quick View'}" href="{if $product.link|strpos:"?"}{$product.link|cat:'&content_only=1'|escape:'htmlall':'UTF-8'}{else}{$product.link|cat:'?content_only=1'|escape:'htmlall':'UTF-8'}{/if}">
								<i class="fa fa-search-plus"></i>
								 </a>
						</div>
					</div>
					<div class="product-meta">
						<div class="warp-info">
							<h3 class="name">{if isset($product.pack_quantity) && $product.pack_quantity}{$product.pack_quantity|intval|cat:' x '}{/if}<a href="{$product.link|escape:'htmlall':'UTF-8'}" title="{$product.name|escape:'htmlall':'UTF-8'}">{$product.name|truncate:35:'...'|escape:'htmlall':'UTF-8'}</a></h3>
							<div class="description">{$product.description_short|strip_tags:'UTF-8'|truncate:240:'...'}</div>
							<a class="rating_box leo-rating-{$product.id_product}" href="#" rel="{$product.id_product}" style="display:none">
								<i class="fa fa-star-o"></i>
								<i class="fa fa-star-o"></i>
								<i class="fa fa-star-o"></i>
								<i class="fa fa-star-o"></i>
								<i class="fa fa-star-o"></i>      
							</a>
							{if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
								<div class="content_price">
									{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}<span class="price">{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}</span>{/if}
								</div>
								<div class="attr-product-list">								
								{if isset($product.available_for_order) && $product.available_for_order && !isset($restricted_country_mode)}
									<span class="availability">
										{if ($product.allow_oosp || $product.quantity > 0)}
											{l s='Available'}{elseif (isset($product.quantity_all_versions) && $product.quantity_all_versions > 0)}
											{l s='Product available with different options'}
										{else}
										<span class="warning_inline">
											{l s='Out of stock'}
										</span>
										{/if}
									</span>
								{/if}
								{if isset($product.online_only) && $product.online_only}<span class="online_only">{l s='Online only'}</span>{/if}
								</div>
							{/if}
							<div class="attr-product-list">
								{if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
									<span class="on_sale">{l s='On sale!'}</span>
								{elseif isset($product.reduction) && $product.reduction && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
									<span class="discount">{l s='Reduced price!'}</span>
								{/if}
							</div>
						</div>
						<div class="product-btn">
							<div class="cart">							
							{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.minimal_quantity <= 1 && $product.customizable != 2 && !$PS_CATALOG_MODE}
								{if ($product.allow_oosp || $product.quantity > 0)}
									{if isset($static_token)}
										<a class="btn ajax_add_to_cart_button exclusive" rel="ajax_id_product_{$product.id_product|intval}" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html'}" title="{l s='Add to cart'}">
											<i class="fa fa-shopping-cart"></i>
											<span class="hidden-xs hidden-sm">{l s='Add to cart'}</span></a>
									{else}
										<a class="btn ajax_add_to_cart_button exclusive" rel="ajax_id_product_{$product.id_product|intval}" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}", false)|escape:'html'}" title="{l s='Add to cart'}">
											<i class="fa fa-shopping-cart"></i>
											<span class="hidden-xs hidden-sm">{l s='Add to cart'}</span></a>
									{/if}						
								{else}
									<span class="exclusive btn out-of-stock"><i class="fa fa-shopping-cart"></i><span class="hidden-xs hidden-sm">{l s='Out of stock'}</span></span>
								{/if}
							{/if}
							</div>
							<div class="wishlist">							
								 <a href="#" id="wishlist_button{$product.id_product}" title="{l s='Add to wishlist'}" class="btn-add-wishlist btn" onclick="LeoWishlistCart('wishlist_block_list', 'add', '{$product.id_product}', $('#idCombination').val(), 1 ); return false;"><i class="fa fa-heart"></i></a>
							</div>
							<div class="compare">
							<a class="btn" href="{$product.link|escape:'htmlall':'UTF-8'}" title="{$product.name|escape:'htmlall':'UTF-8'}">&nbsp;<i class=" fa fa-eye"></i></a>
							</div> 
					</div>
					</div>
					
					
				</div>
			</div>
		{if Configuration::get('productlistcols')>1&&($product@iteration%Configuration::get('productlistcols')==0||$smarty.foreach.products.last)}
			</div>
		{/if}
	{/foreach}
	</div>
	<!-- /Products list -->
{/if}
