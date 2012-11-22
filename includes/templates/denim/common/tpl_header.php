<?php
/**
 * Common Template - tpl_header.php
 *
 * this file can be copied to /templates/your_template_dir/pagename<br />
 * example: to override the privacy page<br />
 * make a directory /templates/my_template/privacy<br />
 * copy /templates/templates_defaults/common/tpl_footer.php to /templates/my_template/privacy/tpl_header.php<br />
 * to override the global settings and turn off the footer un-comment the following line:<br />
 * <br />
 * $flag_disable_header = true;<br />
 *
 * @package templateSystem
 * @copyright Copyright 2003-2006 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_header.php 4813 2006-10-23 02:13:53Z drbyte $
 
 * 'Denim' Template designed by zen-cart-power.net
 * @copyright Copyright 2011 zen-cart-power.net - 'Denim' template
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
<!--bof-navigation display-->

<!--bof-branding display-->
<div id="logoWrapper" class="float-left">
    <div id="logo"><?php echo '<a href="' . HTTP_SERVER . DIR_WS_CATALOG . '">' . zen_image($template->get_template_dir(HEADER_LOGO_IMAGE, DIR_WS_TEMPLATE, $current_page_base,'images'). '/' . HEADER_LOGO_IMAGE, HEADER_ALT_TEXT) . '</a>'; ?></div>
<?php if (HEADER_SALES_TEXT != '' || (SHOW_BANNERS_GROUP_SET2 != '' && $banner = zen_banner_exists('dynamic', SHOW_BANNERS_GROUP_SET2))) { ?>
    <div id="taglineWrapper">
<?php
              if (SHOW_BANNERS_GROUP_SET2 != '' && $banner = zen_banner_exists('dynamic', SHOW_BANNERS_GROUP_SET2)) {
                if ($banner->RecordCount() > 0) {
?>
      <div id="bannerTwo" class="banners"><?php echo zen_display_banner('static', $banner);?></div>
<?php
                }
              }
?>
    </div>
<?php } // no HEADER_SALES_TEXT or SHOW_BANNERS_GROUP_SET2 ?>
</div>
<!--eof-branding display-->


<div id="navMainWrapper">
<div id="navMain" class="float-right">

	<!--bof-header ezpage links-->
	<?php if (EZPAGES_STATUS_HEADER == '1' or (EZPAGES_STATUS_HEADER == '2' and (strstr(EXCLUDE_ADMIN_IP_FOR_MAINTENANCE, $_SERVER['REMOTE_ADDR'])))) { ?>
	<?php require($template->get_template_dir('tpl_ezpages_bar_header.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_ezpages_bar_header.php'); ?>
	<?php } ?>
	<!--eof-header ezpage links-->

</div>

		<!--login section-->
		<div id="login_logout_section" class="float-right">
		<ul class="list-style-none inline-list">
<?php if ($_SESSION['customer_id']) { ?>
			<li>
			<?php echo HEADER_WELCOME; ?>&nbsp;<a href="<?php echo zen_href_link(FILENAME_ACCOUNT, '', 'SSL'); ?>"><?php echo ($_SESSION['customer_first_name'].' '.$_SESSION['customer_last_name']);?></a>!&nbsp;&nbsp;
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




		<div class="languages_wrapper float-right clear-both">
				<?php 
				if (isset($currencies) && is_object($currencies) && count ($currencies->currencies) > 1){
				require($template->get_template_dir('tpl_header_currencies.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_header_currencies.php'); 
				echo $content;?>
				<?php 
				}
				?>
				<?php
				$languges_object = new language;   
				if (count ($languges_object->catalog_languages) > 1){
				require($template->get_template_dir('tpl_header_languages.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_header_languages.php'); 
				echo $content;?>
				<?php 
					}
				?>
		</div>
<br class="clearBoth" />



	<div id="cart_section" class="float-right">

		<!-- header cart section -->
		<table class="align-center cart-header float-left">
		<tr>
			<td>
				<a  href="<?php echo zen_href_link(FILENAME_SHOPPING_CART, '', 'NONSSL'); ?>">
				<?php echo zen_image($template->get_template_dir('cart.gif', DIR_WS_TEMPLATE, $current_page_base,'images'). '/' . 'cart.gif', ''); ?>
				</a>
			</td>
			<td>
			<?php require($template->get_template_dir('tpl_shopping_cart_header.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_shopping_cart_header.php'); 
			echo $content;
			?>		
			</td>
			<?php if ($_SESSION['cart']->count_contents() != 0) { ?>
			<td class="checkout_link">
				<a href="<?php echo zen_href_link(FILENAME_CHECKOUT_SHIPPING, '', 'SSL'); ?>">
					<?php echo HEADER_TITLE_CHECKOUT;?>&gt;&gt;
				</a>
			</td>
			<?php }?>
		</tr>
		</table>
		<!-- /header cart section -->
	</div>

</div>
<!--eof-navigation display-->

<br class="clearBoth" />
<!--eof-header logo and navigation display-->

<!--bof-header navigation bar display-->
<div id="header_bar">
	<div id="header_bar_ls<?php if ($this_is_home_page) { ?>_active<?php } ?>"><a href="<?php echo HTTP_SERVER . DIR_WS_CATALOG; ?>"><?php echo HEADER_TITLE_CATALOG; ?></a></div>
	<ul id="nav_bar_content">
		<li><?php echo zen_image($template->get_template_dir('nav_delim.gif', DIR_WS_TEMPLATE, $current_page_base,'images'). '/' . 'nav_delim.gif', ''); ?></li>
		<?php
		if ($current_page_base == 'products_new') $products_new_page='item_active'; else $products_new_page = 'products_new';
		if ($current_page_base == 'specials') $specials_page = 'item_active';  else $specials_page = 'products_specials';
		if ($current_page_base == 'featured_products') $featured_products_page = 'item_active'; else $featured_products_page='products_featured';
		
		if ($current_page_base == 'account' || $current_page_base == 'login' || $current_page_base == 'account_edit' || $current_page_base == 'address_book' || $current_page_base == 'account_password' || $current_page_base == 'account_newsletters' || $current_page_base == 'account_notifications') $account_page = 'item_active'; else $account_page = 'account';
		?>
				<li id="<?php echo $products_new_page;?>"><a href="index.php?main_page=products_new"><?php echo HEADER_NEW_PRODUCTS;?></a></li>

				<li><?php echo zen_image($template->get_template_dir('nav_delim.gif', DIR_WS_TEMPLATE, $current_page_base,'images'). '/' . 'nav_delim.gif', ''); ?></li>

				<li id="<?php echo $specials_page;?>"><a href="index.php?main_page=specials"><?php echo HEADER_SPECIALS;?></a></li>

				<li><?php echo zen_image($template->get_template_dir('nav_delim.gif', DIR_WS_TEMPLATE, $current_page_base,'images'). '/' . 'nav_delim.gif', ''); ?></li>

				<li id="<?php echo $featured_products_page;?>"><a href="index.php?main_page=featured_products"><?php echo HEADER_FEATURED_PRODUCTS;?></a></li>

				<li><?php echo zen_image($template->get_template_dir('nav_delim.gif', DIR_WS_TEMPLATE, $current_page_base,'images'). '/' . 'nav_delim.gif', ''); ?></li>

				<li id="<?php echo $account_page;?>"><a href="<?php echo zen_href_link(FILENAME_ACCOUNT, '', 'SSL'); ?>"><?php echo HEADER_MY_ACCOUNT;?></a></li>
	</ul>
	<div id="header_bar_rs"></div>

	<div id="navMainSearch">
		<?php
		  $content = "";
		  $content .= zen_draw_form('quick_find_header', zen_href_link(FILENAME_ADVANCED_SEARCH_RESULT, '', 'NONSSL', false), 'get');
		  $content .= zen_draw_hidden_field('main_page',FILENAME_ADVANCED_SEARCH_RESULT);
		  $content .= zen_draw_hidden_field('search_in_description', '1') . zen_hide_session_id();

		  $content .= '<input class="button-search-header float-left" type="image" src="' . $template->get_template_dir('', DIR_WS_TEMPLATE, $current_page_base,'images') . '/search_button.png' . '" value="Search" /><div class="input_div">'. zen_draw_input_field('keyword', '', 'size="6" maxlength="30" style="width: 142px" class="search_input" value="' . HEADER_SEARCH_DEFAULT_TEXT . '" onfocus="if (this.value == \'' . HEADER_SEARCH_DEFAULT_TEXT . '\') this.value = \'\';" onblur="if (this.value == \'\') this.value = \'' . HEADER_SEARCH_DEFAULT_TEXT . '\';"').'</div>';
		  $content .= "</form>";
		  echo($content);
		?>
	</div>
</div>
<!--eof-header navigation bar display-->

</div>
<?php } ?>