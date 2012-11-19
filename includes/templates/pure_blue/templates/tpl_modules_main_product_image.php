<?php
/**
 * Template designed by zen-cart-power.net* 
 * Power your Zen Cart!

 * @copyright Copyright 2008-2010 Newlement
*/
?>
<?php require(DIR_WS_MODULES . zen_get_module_directory(FILENAME_MAIN_PRODUCT_IMAGE)); ?> 
<div id="productMainImage" class="centeredContent back">
<script language="javascript" type="text/javascript"><!--
document.write('<?php 

echo '<a href="javascript:popupWindow(\\\'' . zen_href_link(FILENAME_POPUP_IMAGE, 'pID=' . $_GET['products_id']) . '\\\')">' . zen_image($products_image_medium, addslashes($products_name), MEDIUM_IMAGE_WIDTH, MEDIUM_IMAGE_HEIGHT) . '</a>';
echo '<a href="javascript:popupWindow(\\\'' . zen_href_link(FILENAME_POPUP_IMAGE, 'pID=' . $_GET['products_id']) . '\\\')">' . '<br /><span class="imgLink">' . TEXT_CLICK_TO_ENLARGE . '</span></a>'; ?>');
//--></script>
<noscript>
<?php
  echo '<a href="' . zen_href_link(FILENAME_POPUP_IMAGE, 'pID=' . $_GET['products_id']) . '" target="_blank">' . zen_image($products_image_medium, $products_name, MEDIUM_IMAGE_WIDTH, MEDIUM_IMAGE_HEIGHT) . '<br /><span class="imgLink">' . TEXT_CLICK_TO_ENLARGE . '</span></a>';
?>
</noscript>
</div>