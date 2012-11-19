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
include(DIR_WS_MODULES . zen_get_module_directory('ezpages_bar_header.php'));
?>
<?php 


if (sizeof($var_linksList) >= 1) { ?>
<div id="navEZPagesTop">
	<ul class="list-style-none">
		<?php for ($i=1, $n=sizeof($var_linksList); $i<=$n; $i++) { ?>
		<li><a href="<?php echo $var_linksList[$i]['link']; ?>"><?php echo $var_linksList[$i]['name']; ?></a></li>
		<?php echo ($i < $n ? '<li>|</li>' : '') . "\n"; ?>
		<?php  } // end FOR loop ?>
	</ul>
</div>
<?php } ?>
