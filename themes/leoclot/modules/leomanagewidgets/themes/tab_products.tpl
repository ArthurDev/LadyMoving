{if !empty($mproducts)}
{$itemsperpage=$datas.configs.itemspage}
{$columnspage=$datas.configs.columns}
<div class=" carousel slide" id="leotab-{$datas.id_leomanagewidgets}-{$tabname}carousel">
	 {if count($mproducts) > 1}	
	<a class="carousel-control left" href="#leotab-{$datas.id_leomanagewidgets}-{$tabname}carousel" data-slide="prev">{l s='prev' mod='leomanagewidgets'}</a>
	<a class="carousel-control right" href="#leotab-{$datas.id_leomanagewidgets}-{$tabname}carousel" data-slide="next">{l s='next' mod='leomanagewidgets'}</a>
	{/if}
	<div class="carousel-inner">
	{foreach from=$mproducts item=products name=mypLoop}
		<div class="item {if $smarty.foreach.mypLoop.first}active{/if}">
			{foreach from=$products item=product name=products}
				{if $product@iteration%$columnspage==1&&$columnspage>1}
				  <div class="row">
				{/if}
				<div class="{if $columnspage == 5}leo-md-{$columnspage}{else}col-md-{$datas.scolumn}{/if} product_block ajax_block_product {if $smarty.foreach.products.first}first_item{elseif $smarty.foreach.products.last}last_item{/if} {if $smarty.foreach.products.index % 2}alternate_item{else}p-item{/if} clearfix">
					<div class="product-container">
						<div class="image">
							<a href="{$product.link}" title="{$product.name|escape:html:'UTF-8'}" class="product_image">
								<img class="img" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')}" alt="{$product.name|escape:html:'UTF-8'}" />
								{if isset($product.new) && $product.new == 1}<span class="new"><span>{l s='New' mod='leomanagewidgets'}</span></span>{/if}
								<span class="product-additional" rel="{$product.id_product}"></span>
							</a>
							<div class="product_bottom hidden-xs">							
							<a class="quick-view" title="{l s='Quick View' mod='leomanagewidgets'}" href="{if $product.link|strpos:"?"}{$product.link|cat:'&content_only=1'|escape:'htmlall':'UTF-8'}{else}{$product.link|cat:'?content_only=1'|escape:'htmlall':'UTF-8'}{/if}">
								<i class="fa fa-search-plus"></i>
								</a>								
						</div>
						</div>
						<div class="product-meta">
							<div class="warp-info">
								<h3 class="name"><a href="{$product.link}" title="{$product.name|truncate:50:'...'|escape:'htmlall':'UTF-8'}">{$product.name|truncate:35:'...'|escape:'htmlall':'UTF-8'}</a></h3>
								<div class="description">
									<a href="{$product.link}" title="{l s='More' mod='leomanagewidgets'}">{$product.description_short|strip_tags|truncate:65:'...'}</a>
								</div>
								{if isset($content.task) && $content.task == 'special'}
									{if !$PS_CATALOG_MODE}
										{if $product.specific_prices}
											{assign var='specific_prices' value=$product.specific_prices}
											{if $specific_prices.reduction_type == 'percentage' && ($specific_prices.from == $specific_prices.to OR ($smarty.now|date_format:'%Y-%m-%d %H:%M:%S' <= $specific_prices.to && $smarty.now|date_format:'%Y-%m-%d %H:%M:%S' >= $specific_prices.from))}
												<span class="reduction"><span>-{$specific_prices.reduction*100|floatval}%</span></span>
											{/if}
										{/if}
									{/if}
								{/if}
						
								{if $product.show_price AND !isset($restricted_country_mode) AND !$PS_CATALOG_MODE}
								<div class="content_price">
									<span class="price">
										{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
									</span>
								</div> 
								{/if}
							</div>
							<div class="product-btn">
								<div class="cart">
									{if ($product.id_product_attribute == 0 OR (isset($add_prod_display) AND ($add_prod_display == 1))) AND $product.available_for_order AND !isset($restricted_country_mode) AND $product.minimal_quantity == 1 AND $product.customizable != 2 AND !$PS_CATALOG_MODE}
										{if ($product.quantity > 0 OR $product.allow_oosp)}
										<a class="btn exclusive ajax_add_to_cart_button" rel="ajax_id_product_{$product.id_product}" href="{$link->getPageLink('cart')}?qty=1&amp;id_product={$product.id_product}&amp;token={$static_token}&amp;add" title="{l s='Add to cart' mod='leomanagewidgets'}">
											<i class="fa fa-shopping-cart"></i><span class="hidden-xs hidden-sm">{l s='Add to cart' mod='leomanagewidgets'}</span></a>
										{else}
										<span class="btn exclusive out-of-stock"><i class="fa fa-shopping-cart"></i>{l s='Out of stock' mod='leomanagewidgets'}</span>
										{/if} 
									{/if}
								</div>
								<div class="wishlist">
									<a href="#" id="wishlist_button{$product.id_product}" title="{l s='Add to wishlist' mod='leomanagewidgets'}" class="btn btn-add-wishlist btn" onclick="LeoWishlistCart('wishlist_block_list', 'add', '{$product.id_product}', $('#idCombination').val(), 1 ); return false;"><i class="fa fa-heart"></i></a>
								</div>
								<div class="view">
									<a class="btn lnk_more" href="{$product.link}" title="{l s='View' mod='leomanagewidgets'}"><i class=" fa fa-eye"></i></a>
								</div>
							</div>
							
						</div>
					</div>
				</div>
				
				{if ($product@iteration%$columnspage==0||$smarty.foreach.products.last)&&$columnspage>1}
					</div>
				{/if}
				
			{/foreach}
		</div>		
	{/foreach}
	</div>
</div>
{/if}