<div id="cms_sticker" class="block col-md-6 col-xs-12" style="height:{$module_height}">
    {if $show_title}
		<h3 class="title_specials"> 
			<span>{l s='What People Say' mod='leocmssticker'}</span>
		</h3>
    {/if}
   
    <div class="carousel-inner">
    {foreach from=$cmssticker_products name="mypLoop" key=key item=item}
        <div class="item {if $smarty.foreach.mypLoop.index == $startSlide}active{/if}">{$item.content}</div>
    {/foreach}   
    </div>
    {if $show_controls AND count($cmssticker_products)>1}
	<div class="control_buttons control-specials">
		<a class="carousel-control left" href="#cms_sticker" data-slide="prev"><i class="fa fa-angle-left"></i></a>
		<a class="carousel-control right" href="#cms_sticker" data-slide="next"><i class="fa fa-angle-right"></i></a>
	</div>
    {/if}
</div>
<script type="text/javascript">
{literal}

$(document).ready(function() {
    $('#cms_sticker').each(function(){
        $(this).carousel({
            pause: true,
            interval: {/literal}{$interval}{literal}
        });
    });
	 
});

{/literal}
</script>
