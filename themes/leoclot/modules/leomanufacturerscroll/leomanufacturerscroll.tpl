<div id="mycarouselHolder" class="block col-md-12 col-sm-12 col-xs-12 ">
		{if $show_title}
			<div class="span3">
				<h2 class="title_specials">{$module_title}</h2>
			</div>
		{/if}		
		<div class="{if $show_title}span9{/if} jcarousel-wrap">		
			<div id="wrap">
			  <ul id="lofjcarousel" class="jcarousel-skin-tango">
				{foreach from=$leomanufacturers item=manufacturer name=manufacturers}
					<li class="lof-item">
						<a href="{$manufacturer.link}">
							<img src="{$manufacturer.linkIMG}" alt="{$manufacturer.name}" vspace="0" border="0" />
							
						</a>
					</li>
				{/foreach}
			  </ul>
			</div>
		</div>
</div>
<script type="text/javascript">
	jQuery(document).ready(function() {
		jQuery("#lofjcarousel").flexisel({
			visibleItems: {$leoManufactureConfig.limit},
			animationSpeed: {$leoManufactureConfig.animate_time},
			autoPlay: {$leoManufactureConfig.auto_play},
			autoPlaySpeed: {$leoManufactureConfig.auto_time},
			pauseOnHover: {$leoManufactureConfig.pause_on_hover},
			enableResponsiveBreakpoints: {$leoManufactureConfig.enable_responsive},
	    	responsiveBreakpoints: { 
	    		portrait: { 
	    			changePoint:{$leoManufactureConfig.portraint_change_point},
	    			visibleItems: {$leoManufactureConfig.portraint_visible_items}
	    		},
	    		landscape: { 
	    			changePoint:{$leoManufactureConfig.landscape_change_point},
	    			visibleItems: {$leoManufactureConfig.landscape_visible_items}
	    		},
	    		tablet: {
	    			changePoint:{$leoManufactureConfig.tablet_change_point},
	    			visibleItems: {$leoManufactureConfig.tablet_visible_items}
	    		}
	    	}
	    });
	});
</script>