<?php
/**
 * Side Box Template
 *
 * Template designed by zen-cart-power.net* 
 * Power your Zen Cart!

 * @copyright Copyright 2008-2010 Newlement
*/
  $content = '';
  $content .= '<div id="' . str_replace('_', '-', $box_id . 'Content') . '" class="sideBoxContent">' . "\n";
  $content .= '<div class="wrapper">' . "\n" . '<ul>' . "\n";
  for ($i=1; $i<=sizeof($bestsellers_list); $i++) {
    $content .= '<li><a href="' . zen_href_link(zen_get_info_page($bestsellers_list[$i]['id']), 'products_id=' . $bestsellers_list[$i]['id']) . '">' . zen_trunc_string($bestsellers_list[$i]['name'], BEST_SELLERS_TRUNCATE, BEST_SELLERS_TRUNCATE_MORE) . '</a></li>' . "\n";
  }
  $content .= '</ul>' . "\n";
  $content .= '</div>' . "\n";
  $content .= '</div>';
?>