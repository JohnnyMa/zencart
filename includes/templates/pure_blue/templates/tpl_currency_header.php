<?php
/**
 * Template designed by zen-cart-power.net* 
 * Power your Zen Cart!

 * @copyright Copyright 2008-2010 Newlement
*/

  /**
   * require code to show EZ-Pages list
   */
/*
if ($current_page_base == 'index') {
	$active	= 'tab_active';
}
*/
  $show_currencies= true;

  if ($show_currencies == true) {
    if (isset($currencies) && is_object($currencies)) {

      reset($currencies->currencies);
      $currencies_array = array();
      while (list($key, $value) = each($currencies->currencies)) {
        $currencies_array_popup[$key] = $value['title'];
      }

      $hidden_get_variables = '';
      reset($_GET);
      while (list($key, $value) = each($_GET)) {
        if ( ($key != 'currency') && ($key != zen_session_name()) && ($key != 'x') && ($key != 'y') ) {
          $hidden_get_variables .= zen_draw_hidden_field($key, $value);
        }
      }
                      
    }
  }
?>
<a href="#" id="currency_switcher">
<?php
  echo $currencies_array_popup[$_SESSION['currency']]; 
?>
</a>