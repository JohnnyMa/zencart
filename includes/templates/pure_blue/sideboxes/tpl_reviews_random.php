<?php
/**
 * Template designed by zen-cart-power.net* 
 * Power your Zen Cart!

 * @copyright Copyright 2008-2010 Newlement
*/
  $content = "";
  $content .= '<div id="' . str_replace('_', '-', $box_id . 'Content') . '" class="sideBoxContent centeredContent">';
  $content .= '<a href="' . zen_href_link(FILENAME_PRODUCT_REVIEWS_INFO, 'products_id=' . $random_review_sidebox_product->fields['products_id'] . '&reviews_id=' . $random_review_sidebox_product->fields['reviews_id']) . '">' . zen_image(DIR_WS_IMAGES . $random_review_sidebox_product->fields['products_image'], $random_review_sidebox_product->fields['products_name'], SMALL_IMAGE_WIDTH, SMALL_IMAGE_HEIGHT) . '</a>';
  $content .= '<a href="' . zen_href_link(FILENAME_PRODUCT_REVIEWS_INFO, 'products_id=' . $random_review_sidebox_product->fields['products_id'] . '&reviews_id=' . $random_review_sidebox_product->fields['reviews_id']) . '"><br />' . $review_box_text . ' ..</a><br /><br />' . zen_image(DIR_WS_TEMPLATE_IMAGES . 'stars_' . $random_review_sidebox_product->fields['reviews_rating'] . '.gif' , sprintf(BOX_REVIEWS_TEXT_OF_5_STARS, $random_review_sidebox_product->fields['reviews_rating']));
  $content .= '</div>';
?>