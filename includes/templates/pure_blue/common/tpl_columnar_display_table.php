<?php
/**
 * Template designed by zen-cart-power.net* 
 * Power your Zen Cart!

 * @copyright Copyright 2008-2010 Newlement
*/

?>
<?php
  if ($title) {
  echo $title; 
 }
  if (is_array($list_box_contents) > 0 ) {
?>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<?php
 for($row=0;$row<sizeof($list_box_contents);$row++) {
    $params = "";
?>
    <tr>
<?php
    for($col=0;$col<sizeof($list_box_contents[$row]);$col++) {
      $r_params = "";
      if (isset($list_box_contents[$row][$col]['params'])) $r_params .= ' ' . (string)$list_box_contents[$row][$col]['params'];
      if (isset($list_box_contents[$row][$col]['text'])) {
        echo '<td ' . $r_params . '>' . $list_box_contents[$row][$col]['text'] .  '</td>' . "\n"; 
      } else {
        echo '<td ' . $r_params . '></td>' . "\n";
      }
    }
?>
    </tr>
<?php
  }
?>
  </table>
<?php
}
?> 
