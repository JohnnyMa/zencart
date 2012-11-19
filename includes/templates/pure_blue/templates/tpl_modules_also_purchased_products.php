<?php
/**
 * Module Template
 *
 * Displays content related to "also-purchased-products"
 *
 * Template designed by zen-cart-power.net* 
 * Power your Zen Cart!

 * @copyright Copyright 2008-2010 Newlement
*/
  $zc_show_also_purchased = false;
  include(DIR_WS_MODULES . zen_get_module_directory(FILENAME_ALSO_PURCHASED_PRODUCTS));
?>

<?php if ($zc_show_also_purchased == true) { ?>
<div class="centerBoxWrapper" id="alsoPurchased">
<?php
  require($template->get_template_dir('tpl_columnar_display.php',DIR_WS_TEMPLATE, $current_page_base,'common'). '/tpl_columnar_display.php');
?>
</div>
<div class="mainbox-bottom-left"><div class="mainbox-bottom-right"><?php echo '<img height="6" src="'. $template->get_template_dir('', DIR_WS_TEMPLATE, $current_page_base,'images') . '/spacer.gif" alt="" />' ?></div></div>
<?php } ?>
