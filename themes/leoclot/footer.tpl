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

		{if !$content_only}
		{include file="$tpl_dir./layout/{$LEO_LAYOUT_DIRECTION}/footer.tpl"  }
	</div></div></section>

<!-- Footer -->
			{if $HOOK_BOTTOM &&  in_array($page_name,array('index'))}
			<section id="bottom">
				<div class="container">
					<div class="row">
						{$HOOK_BOTTOM} 
					</div>
				</div>
			</section>
			{/if}
			<footer id="footer" class="clearfix">
				<section id="footer-top" class="footer">
					<div class="top_footer"></div>
					<div class="container"> 
						{$HOOK_FOOTER} 
					</div>
				</section>	
				<section id="footer-bottom">
					<div class="container">
						<div class="row">
							<div class="copyright col-md-6 col-xs-12">
									Lady Moving Massy - Copyright 2014 - Tous droits réservés
									<br />
									Géré et développé par <a href="#" style="cursor:default;">Ecom Planet</a>
							</div>

							{if $HOOK_FOOTNAV}
								<div class="footnav col-md-6 col-xs-12">{$HOOK_FOOTNAV}</div>
							{/if}
						</div>
					</div>
				</section>
				
			</footer>
		</section>
	{/if}
	{if $LEO_PANELTOOL}
    	{include file="$tpl_dir./info/paneltool.tpl"}
    {/if}
	<script type="text/javascript">
		var classBody = "{$LEO_PATTERN}";
		$("body").addClass( classBody.replace(/\.\w+$/,"")  );
					
		$('.title_specials').each(function(){
			var me = $(this);
			me.html( me.text().replace(/(^\w+|\s+\w+)/,'<span class="tcolor">$1</span>') );
		});		
	</script>
	</body>
</html>
