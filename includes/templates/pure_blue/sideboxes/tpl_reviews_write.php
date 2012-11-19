<?php
/**
 * Template designed by zen-cart-power.net* 
 * Power your Zen Cart!

 * @copyright Copyright 2008-2010 Newlement
*/
  $content = "";
  $content .= '<div id="' . str_replace('_', '-', $box_id . 'Content') . '" class="sideBoxContent centeredContent">';
  $content .= '<a href="' . zen_href_link(FILENAME_PRODUCT_REVIEWS_WRITE, 'products_id=' . $_GET['products_id']) . '">' . zen_image(DIR_WS_TEMPLATE_IMAGES . OTHER_IMAGE_BOX_WRITE_REVIEW, OTHER_BOX_WRITE_REVIEW_ALT) . '</a>';
  $content .= '<a href="' . zen_href_link(FILENAME_PRODUCT_REVIEWS_WRITE, 'products_id=' . $_GET['products_id']) . '">' . '<br />' . BOX_REVIEWS_WRITE_REVIEW .'</a>';
  $content .= '</div>';
?>