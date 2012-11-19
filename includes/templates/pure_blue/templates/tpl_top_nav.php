<?php
/**
 * Template designed by zen-cart-power.net* 
 * Power your Zen Cart!

 * @copyright Copyright 2008-2010 Newlement
*/  
?>

<div id="top_nav">

<div class="top-nav-left"></div>
<div class="top-nav-right"></div>


<ul class="list-style-none float-left">

<?php 
if ($this_is_home_page) { $active = 'id="tab_active"'; 
	} else { $active = '';
}?>
		<li <?php echo $active;?>><?php echo '<a href="' . HTTP_SERVER . DIR_WS_CATALOG . '">'; ?><?php echo HEADER_TITLE_CATALOG; ?></a></li>

<?php
if ($current_page_base == 'products_new') {	$active	= 'tab_active'; 
	} else { $active = '';
}?>
		<li <?php echo $active;?>><a href="index.php?main_page=products_new"><?php echo TOP_MENU_NEW_PRODUCTS;?></a></li>

<?php
if ($current_page_base == 'specials') { $active = 'tab_active'; 
	} else { $active = '';
}?>
		<li <?php echo $active;?>><a href="index.php?main_page=specials"><?php echo TOP_MENU_SPECIALS;?></a></li>

<?php 
if ($current_page_base == 'featured_products') { $active = 'tab_active'; 
	} else { $active = '';
}?>
		<li <?php echo $active;?>><a href="index.php?main_page=featured_products"><?php echo TOP_MENU_FEATURED_PRODUCTS;?></a></li>

<?php  
if ($current_page_base == 'account' || $current_page_base == 'login' || $current_page_base == 'account_edit' || $current_page_base == 'address_book' || $current_page_base == 'account_password' || $current_page_base == 'account_newsletters' || $current_page_base == 'account_notifications') { $active = 'tab_active'; 
	} else { $active = '';
}?>
		<li <?php echo $active;?>><a href="<?php echo zen_href_link(FILENAME_ACCOUNT, '', 'SSL'); ?>"><?php echo TOP_MENU_MY_ACCOUNT;?></a></li>

<?php   
if ($current_page_base == 'shopping_cart') { $active = 'tab_active'; 
	} else { $active = '';
}?>
		<li <?php echo $active;?>><a href="<?php echo zen_href_link(FILENAME_SHOPPING_CART, '', 'NONSSL'); ?>"><?php echo TOP_MENU_VIEW_CART;?></a></li>
	</ul>

<div class="languages-wrapper float-right">
<?php   
    $languges_object = new language;   
//    if (count ($languges_object->catalog_languages) > 1){
?>
            <div class="languages float-right">
				<?php require($template->get_template_dir('tpl_header_languages.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_header_languages.php'); 
				echo $content;?>     
            </div>
<?php
//    } 
?>      
         
<?php   
   if (isset($currencies) && is_object($currencies) && count ($currencies->currencies) > 1){
?>
				<div class="currency float-right">
				<?php require($template->get_template_dir('tpl_header_currencies.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_header_currencies.php'); 
				echo $content;?>  
                </div>
<?php
  } 
?>                  
		</div>
		<div class="clearBoth"></div>

</div>