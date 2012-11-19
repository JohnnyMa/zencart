<?php
/**
 * Template designed by zen-cart-power.net* 
 * Power your Zen Cart!

 * @copyright Copyright 2008-2010 Newlement
*/
 
  $content ="";
  $product_amount = 0;

  if ($_SESSION['cart']->count_contents() > 0) {
    $products = $_SESSION['cart']->get_products();

    for ($i=0, $n=sizeof($products); $i<$n; $i++) {
		$product_amount = $products[$i]['quantity'] + $product_amount;
	}

$content .= '<img class="cart-icon full float-left" src="'. $template->get_template_dir('', DIR_WS_TEMPLATE, $current_page_base,'images') . '/spacer.gif" alt="" /></td><td><a href="' . zen_href_link(FILENAME_SHOPPING_CART, '', 'NONSSL') . '">' . HEADER_PRODUCT_AMOUNT . '<span>'. $product_amount . '</span></a>, '; 
  } else {
    $content .= '<img class="cart-icon empty float-left" src="'. $template->get_template_dir('', DIR_WS_TEMPLATE, $current_page_base,'images') . '/spacer.gif" alt="" /></td><td width="80%"><div id="cartBoxEmpty"><a href="' . zen_href_link(FILENAME_SHOPPING_CART, '', 'NONSSL') . '"></a>' . HEADER_SHOPPING_CART_EMPTY . '</div>';
  }

  if ($_SESSION['cart']->count_contents() > 0) {
    $content .= HEADER_CART_SUBTOTAL .'<span>' . $currencies->format($_SESSION['cart']->show_total()) . '</span>';
  }

?>
