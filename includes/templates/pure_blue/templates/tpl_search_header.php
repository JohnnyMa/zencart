<?php
/**
 * Template designed by zen-cart-power.net* 
 * Power your Zen Cart!

 * @copyright Copyright 2008-2010 Newlement
*/
  $content = "";
  $content .= zen_draw_form('quick_find_header', zen_href_link(FILENAME_ADVANCED_SEARCH_RESULT, '', 'NONSSL', false), 'get');
  $content .= zen_draw_hidden_field('main_page',FILENAME_ADVANCED_SEARCH_RESULT);
  $content .= zen_draw_hidden_field('search_in_description', '1') . zen_hide_session_id();

  $content .= '<div class="search-header-input">'. zen_draw_input_field('keyword', '', 'size="6" maxlength="30" style="width: 138px" value="' . '" onfocus="if (this.value == \'' . HEADER_SEARCH_DEFAULT_TEXT . '\') this.value = \'\';" onblur="if (this.value == \'\') this.value = \'' . HEADER_SEARCH_DEFAULT_TEXT . '\';"') . '</div><input class="button-search-header" type="image" src="' . $template->get_template_dir('', DIR_WS_TEMPLATE, $current_page_base,'images') . '/search_header_button.gif' . '" value="Serch" />' /*. zen_image_submit (BUTTON_IMAGE_SEARCH,HEADER_SEARCH_BUTTON)*/;
  $content .= "</form>";
  echo($content);
?>