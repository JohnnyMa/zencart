<?php
/**
 * Module Template
 *
 * Template designed by zen-cart-power.net* 
 * Power your Zen Cart!

 * @copyright Copyright 2008-2010 Newlement
*/
  $zc_show_featured = false;
  include(DIR_WS_MODULES . zen_get_module_directory(FILENAME_FEATURED_PRODUCTS_MODULE));
?>

<!-- bof: featured products  -->
<?php if ($zc_show_featured == true) { ?>
<div class="centerBoxWrapper" id="featuredProducts">
<?php
/**
 * require the list_box_content template to display the product
 */
  require($template->get_template_dir('tpl_columnar_display.php',DIR_WS_TEMPLATE, $current_page_base,'common'). '/tpl_columnar_display.php');
?>
</div>
<div class="mainbox-bottom-left"><div class="mainbox-bottom-right"><?php echo '<img height="6" src="'. $template->get_template_dir('', DIR_WS_TEMPLATE, $current_page_base,'images') . '/spacer.gif" alt="" />' ?></div></div>
<?php } ?>
<!-- eof: featured products  -->
