<?php
/**
 * Template designed by zen-cart-power.net* 
 * Power your Zen Cart!

 * @copyright Copyright 2008-2010 Newlement
*/

//print_r($list_box_contents);
  $cell_scope = (!isset($cell_scope) || empty($cell_scope)) ? 'col' : $cell_scope;
  $cell_title = (!isset($cell_title) || empty($cell_title)) ? 'list' : $cell_title;

?>
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="<?php echo 'cat' . $cPath . 'Table'; ?>" class="tabTable">
<?php
  for($row=0; $row<sizeof($list_box_contents); $row++) {
    $r_params = "";
    $c_params = "";
    if (isset($list_box_contents[$row]['params'])) $r_params .= ' ' . $list_box_contents[$row]['params'];
?>
  <tr <?php echo $r_params; ?>>
<?php
    for($col=0;$col<sizeof($list_box_contents[$row]);$col++) {
      $c_params = "";
      $cell_type = ($row==0) ? 'th' : 'td';
      if (isset($list_box_contents[$row][$col]['params'])) $c_params .= ' ' . $list_box_contents[$row][$col]['params'];
      if (isset($list_box_contents[$row][$col]['align']) && $list_box_contents[$row][$col]['align'] != '') $c_params .= ' align="' . $list_box_contents[$row][$col]['align'] . '"';
      if ($cell_type=='th') $c_params .= ' scope="' . $cell_scope . '" id="' . $cell_title . 'Cell' . $row . '-' . $col.'"';
      if (isset($list_box_contents[$row][$col]['text'])) {
?>
   <?php echo '<' . $cell_type . $c_params . '>'; ?><?php echo $list_box_contents[$row][$col]['text'] ?><?php echo '</' . $cell_type . '>'  . "\n"; ?>
<?php
      }
    }
?>
  </tr>
<?php
  }
?> 
</table>