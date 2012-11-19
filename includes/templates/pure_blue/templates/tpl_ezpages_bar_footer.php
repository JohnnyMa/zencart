<?php
/**
 * Template designed by zen-cart-power.net* 
 * Power your Zen Cart!

 * @copyright Copyright 2008-2010 Newlement
*/

   /**
   * require code to show EZ-Pages list
   */
  include(DIR_WS_MODULES . zen_get_module_directory('ezpages_bar_footer.php'));
?>
<?php if (sizeof($var_linksList) >= 1) { ?>

<ul class="footer-links list-style-none float-right">
	<li><?php echo '<a href="' . HTTP_SERVER . DIR_WS_CATALOG . '">'; ?><?php echo HEADER_TITLE_CATALOG; ?></a></li>
	<?php for ($i=1, $n=sizeof($var_linksList); $i<=$n; $i++) {  ?>
	<li><?php echo ($i <= $n ? EZPAGES_SEPARATOR_FOOTER : '') . "\n"; ?>
	<a href="<?php echo $var_linksList[$i]['link']; ?>"><?php echo $var_linksList[$i]['name']; ?></a></li>
	<?php } // end FOR loop ?>
</ul>
<?php } ?>