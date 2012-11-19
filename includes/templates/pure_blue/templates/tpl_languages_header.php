<?php
/**
 * Template designed by zen-cart-power.net* 
 * Power your Zen Cart!

 * @copyright Copyright 2008-2010 Newlement
*/

// test if box should display
  $show_languages= true;

  if ($show_languages == true) {
    if (!isset($lng) || (isset($lng) && !is_object($lng))) {
      $lng = new language;
    }

    reset($lng->catalog_languages);
    $languages_array = array();
    $current_language = '';    
      while (list($key, $value) = each($lng->catalog_languages)) {
        $languages_array_popup[$key] = $value['name'];
      }
     
    foreach ($languages_array_popup as $k => $v){
        if ($k == $_SESSION['languages_code']) {
            $current_language = $v;
        }
    }
  }
      $lang_array = array();
	  while (list($key, $value) = each($lng->catalog_languages)) {
        $lang_array[] = array('id' => $key, 'text' => $value['name']);
      }
      $hidden_get_variables = '';
      reset($_GET);

      while (list($key, $value) = each($_GET)) {
        if ( ($key != 'language') && ($key != zen_session_name()) && ($key != 'x') && ($key != 'y') ) {
          $hidden_get_variables .= zen_draw_hidden_field($key, $value);
        }
      }

?>
<a href="#" id="language_switcher">
<?php
  echo $current_language; 
?>
</a>