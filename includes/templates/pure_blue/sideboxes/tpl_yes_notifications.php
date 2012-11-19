<?php
/**
 * Template designed by zen-cart-power.net* 
 * Power your Zen Cart!

 * @copyright Copyright 2008-2010 Newlement
*/
  $content = "";
  $content .= '<div id="' . str_replace('_', '-', $box_id . 'Content') . '" class="sideBoxContent centeredContent">';
  $content .= '<a href="' . zen_href_link($_GET['main_page'], zen_get_all_get_params(array('action')) . 'action=notify_remove', $request_type) . '">' . zen_image(DIR_WS_TEMPLATE_IMAGES . OTHER_IMAGE_BOX_NOTIFY_REMOVE, OTHER_BOX_NOTIFY_REMOVE_ALT) .'</a>';
  $content .= '<a href="' . zen_href_link($_GET['main_page'], zen_get_all_get_params(array('action')) . 'action=notify_remove', $request_type) . '">' . '<br />' . sprintf(BOX_NOTIFICATIONS_NOTIFY_REMOVE, zen_get_products_name($_GET['products_id'])) .'</a>';
  $content .= '</div>';
?>