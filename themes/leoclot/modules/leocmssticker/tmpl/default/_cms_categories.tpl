<div id="cms_sticker" class="block col-md-6 col-xs-12" style="width:{$module_width}; height:{$module_height}">
    {if $show_title}
        <h3>{l s='News' mod='leocmssticker'}</h3>
    {/if}
    {if $show_controls AND count($cmssticker_products)>1}
        <a class="carousel-control left" href="#cms_sticker"   data-slide="prev">&lsaquo;</a>
        <a class="carousel-control right" href="#cms_sticker"  data-slide="next">&rsaquo;</a>
    {/if}
    <div class="carousel-inner">

        {foreach from=$cmssticker_products key=key item=items name=foo}
            {foreach from=$items key=key1 item=item name=mypLoop}
                {if $smarty.foreach.mypLoop.index lt {$limit_cate}}
                    <div class="item item {if $smarty.foreach.mypLoop.index == $startSlide}active{/if}">
                        <a target="{$open_target}" href="{$item.link|addslashes|escape:'html'}" title="{$item.meta_title|escape:'htmlall':'UTF-8'}">{$item.meta_title|escape:'htmlall':'UTF-8'}</a>
                    </div>
                {/if}
            {/foreach}
        {/foreach}  
    </div>
</div>
<!-- /MODULE cmssticker specials -->
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