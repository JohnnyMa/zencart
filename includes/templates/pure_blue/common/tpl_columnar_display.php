<?php
/**
 * Template designed by zen-cart-power.net* 
 * Power your Zen Cart!

 * @copyright Copyright 2008-2010 Newlement
*/

?>
<?php

  if ($title) {
  ?>
<?php echo $title; ?>
<?php
 }
 ?>
<?php
if (is_array($list_box_contents) > 0 ) {

 for($row=0;$row<sizeof($list_box_contents);$row++) {
    $params = "";
    //if (isset($list_box_contents[$row]['params'])) $params .= ' ' . $list_box_contents[$row]['params'];
?>

<?php
    for($col=0;$col<sizeof($list_box_contents[$row]);$col++) {
      $r_params = "";
      if (isset($list_box_contents[$row][$col]['params'])) $r_params .= ' ' . (string)$list_box_contents[$row][$col]['params'];
     if (isset($list_box_contents[$row][$col]['text'])) {
?>
    <?php echo '<div' . $r_params . '>' . $list_box_contents[$row][$col]['text'] . '</div>' . "\n"; ?>
<?php
      }
    }
?>
<br class="clearBoth" />
<?php 

  }
}
?> 
