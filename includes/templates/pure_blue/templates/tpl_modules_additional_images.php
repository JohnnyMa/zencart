<?php
/**
 * Template designed by zen-cart-power.net* 
 * Power your Zen Cart!

 * @copyright Copyright 2008-2010 Newlement
*/

  require(DIR_WS_MODULES . zen_get_module_directory('additional_images.php'));
 ?>
 <?php
 if ($flag_show_product_info_additional_images != 0 && $num_images > 0) {
  ?>
<div id="productAdditionalImages">
<h2><?php echo HEADING_TITLE_ADDITIONAL_IMAGES; ?></h2>
<?php
  require($template->get_template_dir('tpl_columnar_display.php',DIR_WS_TEMPLATE, $current_page_base,'common'). '/tpl_columnar_display.php'); ?>
</div>
<?php 
  }
?>