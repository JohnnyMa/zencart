<?php
/**
 * Template designed by zen-cart-power.net* 
 * Power your Zen Cart!

 * @copyright Copyright 2008-2010 Newlement
*/
require(DIR_WS_MODULES . zen_get_module_directory('footer.php'));
?>
<?php
if (!isset($flag_disable_footer) || !$flag_disable_footer) {
?>

<div id="navSuppWrapper">
	<!--bof-navigation display -->
	<?php if (EZPAGES_STATUS_FOOTER == '1' or (EZPAGES_STATUS_FOOTER == '2' and (strstr(EXCLUDE_ADMIN_IP_FOR_MAINTENANCE, $_SERVER['REMOTE_ADDR'])))) { ?>
	<?php require($template->get_template_dir('tpl_ezpages_bar_footer.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_ezpages_bar_footer.php'); ?>
	<?php } ?>
	<!--eof-navigation display -->
	

	<!--bof- site copyright display -->
	<div id="siteinfoLegal" class="legalCopyright"><?php echo FOOTER_TEXT_BODY; ?>,&nbsp;<a href="http://www.zen-cart-power.net/zen-cart-templates.html">Zen Cart templates</a></div> <br/>
	<!--eof- site copyright display -->

	<!--bof-ip address display -->
	<?php
	if (SHOW_FOOTER_IP == '1') {
	?>
	<div id="siteinfoIP"><?php echo TEXT_YOUR_IP_ADDRESS . '  ' . $_SERVER['REMOTE_ADDR']; ?></div>
	<?php
	}
	?>
	<!--eof-ip address display -->

	<div class="clearBoth"></div>
</div>


	<!--bof-banner #5 display -->
	<?php
	  if (SHOW_BANNERS_GROUP_SET5 != '' && $banner = zen_banner_exists('dynamic', SHOW_BANNERS_GROUP_SET5)) {
		if ($banner->RecordCount() > 0) {
	?>
	<div id="bannerFive" class="banners"><?php echo zen_display_banner('static', $banner); ?></div>
	<?php
		}
	}
	?>
	<!--eof-banner #5 display -->

<?php
} // flag_disable_footer
?>