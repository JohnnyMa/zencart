<?php
/**
 * Template designed by zen-cart-power.net* 
 * Power your Zen Cart!

 * @copyright Copyright 2008-2010 Newlement
*/
?>

<?php
  // Display all header alerts via messageStack:
  if ($messageStack->size('header') > 0) {
    echo $messageStack->output('header');
  }
  if (isset($_GET['error_message']) && zen_not_null($_GET['error_message'])) {
  echo htmlspecialchars(urldecode($_GET['error_message']));
  }
  if (isset($_GET['info_message']) && zen_not_null($_GET['info_message'])) {
   echo htmlspecialchars($_GET['info_message']);
} else {

}

?>

<!--bof-header logo and navigation display-->
<?php
if (!isset($flag_disable_header) || !$flag_disable_header) {
?>

<div id="headerWrapper">
 <div id="header">
	<div id="logoWrapper" class="float-left">
	    <div id="logo"><?php echo '<a href="' . HTTP_SERVER . DIR_WS_CATALOG . '">' . zen_image($template->get_template_dir(HEADER_LOGO_IMAGE, DIR_WS_TEMPLATE, $current_page_base,'images'). '/' . HEADER_LOGO_IMAGE, HEADER_ALT_TEXT) . '</a>'; ?></div>
	</div>



	<div class="header-cart-box float-right">



		<!-- header cart section -->
		<table class="cart-header" cellpadding="0" cellspacing="2">
		<tr>
			<td>
			<?php require($template->get_template_dir('tpl_shopping_cart_header.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_shopping_cart_header.php'); 
			echo $content;
			?>	
			
			<?php if ($_SESSION['cart']->count_contents() != 0) { ?>

				<br /><a class="blue-link" href="<?php echo zen_href_link(FILENAME_CHECKOUT_SHIPPING, '', 'SSL'); ?>"><?php echo HEADER_TITLE_CHECKOUT; ?></a>
			<?php }?>
			</td>
		</tr>
		</table>
		<!-- /header cart section -->
	</div>



	<div class="float-right">
		<!--bof-header ezpage links-->
		<div class="topper-menu float-right">
		<?php if (EZPAGES_STATUS_HEADER == '1' or (EZPAGES_STATUS_HEADER == '2' and (strstr(EXCLUDE_ADMIN_IP_FOR_MAINTENANCE, $_SERVER['REMOTE_ADDR'])))) { ?>
		<?php require($template->get_template_dir('tpl_ezpages_bar_header.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_ezpages_bar_header.php'); ?>
		<?php } ?>
		</div>
		<!--eof-header ezpage links-->
		<div class="clearBoth"></div>
	</div>


	 <div class="clearRight"></div>

	<div class="search-header-bg float-right">
	<!-- Search -->
	<div class="search-header">	
		<div class="search-label float-left"><?php echo BOX_HEADING_SEARCH; ?></div>
	    <?php require($template->get_template_dir('tpl_search_header.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_search_header.php');?>
		<div class="clearBoth"></div>
	</div>
	<!-- /Search -->
	</div>

 		

<!--login section-->

		<div id="login_logout_section" class="float-left">
		<ul class="list-style-none inline-list">
<?php if ($_SESSION['customer_id']) { ?>
			<li>
			<a href="<?php echo zen_href_link(FILENAME_ACCOUNT, '', 'SSL'); ?>"><?php echo ($_SESSION['customer_first_name'].' '.$_SESSION['customer_last_name']);?></a>
			</li>
		    <li><a href="<?php echo zen_href_link(FILENAME_LOGOFF, '', 'SSL'); ?>"><?php echo HEADER_TITLE_LOGOFF; ?></a></li>
<?php
      } else {
        if (STORE_STATUS == '0') {
?>
	    <li><a href="<?php echo zen_href_link(FILENAME_LOGIN, '', 'SSL'); ?>"><?php echo HEADER_TITLE_LOGIN; ?></a></li>
		<li><?php echo HEADER_OR; ?></li>
	    <li><a href="<?php echo zen_href_link(FILENAME_CREATE_ACCOUNT, '', 'SSL'); ?>"><?php echo HEADER_TITLE_REGISTER; ?></a></li>
<?php } } ?>
		</ul>

		</div>
		<!--/login section-->
 <div class="clearBoth"></div>



 </div>

<!--eof-header logo and navigation display-->

<?php require($template->get_template_dir('tpl_top_nav.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_top_nav.php'); ?>


</div>
<?php } 

?>
