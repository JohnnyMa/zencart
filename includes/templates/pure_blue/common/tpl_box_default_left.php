<?php
/**
 * Template designed by zen-cart-power.net* 
 * Power your Zen Cart!

 * @copyright Copyright 2008-2010 Newlement
*/

// choose box images based on box position
  if ($title_link) {
    $title = $title . ' - <a href="' . zen_href_link($title_link) . '">' . BOX_HEADING_LINKS . '</a>';
  }
//
//category header style
  if ($box_id == "categories") {
    $header_left = 'main-sidebox-header-left';
    $header_right = 'main-sidebox-header-right';
  } else {
    $header_left = '';
    $header_right = '';
  }
//
?>
<!--// bof: <?php echo $box_id; ?> //-->
<div class="leftBoxContainer" id="<?php echo str_replace('_', '-', $box_id ); ?>" style="width: <?php echo $column_width; ?>">
<div class="sidebox-header-left <?php echo $header_left; ?>"><h3 class="leftBoxHeading <?php echo $header_right; ?>" id="<?php echo str_replace('_', '-', $box_id) . 'Heading'; ?>"><?php echo $title; ?></h3></div>
<?php echo $content; ?>
<div class="sidebox-bottom-left"><div class="sidebox-bottom-right"><?php echo '<img height="4" src="'. $template->get_template_dir('', DIR_WS_TEMPLATE, $current_page_base,'images') . '/spacer.gif" alt="" />' ?></div></div>
</div>