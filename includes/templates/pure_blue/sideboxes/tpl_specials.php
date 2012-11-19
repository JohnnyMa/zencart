<?php
/**
 * Template designed by zen-cart-power.net* 
 * Power your Zen Cart!

 * @copyright Copyright 2008-2010 Newlement
*/
  $content = "";
  $specials_box_counter = 0;
  while (!$random_specials_sidebox_product->EOF) {
    $specials_box_counter++;
    $specials_box_price = zen_get_products_display_price($random_specials_sidebox_product->fields['products_id']);
    $content .= '<div class="sideBoxContent centeredContent">';

    $content .= '<a href="' . zen_href_link(zen_get_info_page($random_specials_sidebox_product->fields["products_id"]), 'cPath=' . zen_get_generated_category_path_rev($random_specials_sidebox_product->fields["master_categories_id"]) . '&products_id=' . $random_specials_sidebox_product->fields["products_id"]) . '">' . zen_image(DIR_WS_IMAGES . $random_specials_sidebox_product->fields['products_image'], $random_specials_sidebox_product->fields['products_name'], SMALL_IMAGE_WIDTH, SMALL_IMAGE_HEIGHT) . '</a>'; 
    $content .= '<a class="sidebox-products" href="' . zen_href_link(zen_get_info_page($random_specials_sidebox_product->fields["products_id"]), 'cPath=' . zen_get_generated_category_path_rev($random_specials_sidebox_product->fields["master_categories_id"]) . '&products_id=' . $random_specials_sidebox_product->fields["products_id"]) . '">'; 
    $content .= $random_specials_sidebox_product->fields['products_name'] . '</a>';
    $content .= '<div>' . $specials_box_price . '</div>';
    $content .= '</div>';
    $random_specials_sidebox_product->MoveNextRandom();
  }
?>
