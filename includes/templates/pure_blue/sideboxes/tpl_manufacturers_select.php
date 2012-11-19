<?php
/**
 * Template designed by zen-cart-power.net* 
 * Power your Zen Cart!

 * @copyright Copyright 2008-2010 Newlement
*/
  $content = "";
  $content .= '<div id="' . str_replace('_', '-', $box_id . 'Content') . '" class="sideBoxContent centeredContent">';
  $content.= zen_draw_form('manufacturers_form', zen_href_link(FILENAME_DEFAULT, '', 'NONSSL', false), 'get');
  $content .= zen_draw_hidden_field('main_page', FILENAME_DEFAULT);
  $content .= zen_draw_pull_down_menu('manufacturers_id', $manufacturer_sidebox_array, (isset($_GET['manufacturers_id']) ? $_GET['manufacturers_id'] : ''), 'onchange="this.form.submit();" size="' . MAX_MANUFACTURERS_LIST . '" style="width: 90%; margin: auto;"') . zen_hide_session_id();
  $content .= '</form>';
  $content .= '</div>';
?>