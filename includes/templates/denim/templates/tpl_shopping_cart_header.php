<?php
/**
 @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * 'Denim' Template designed by zen-cart-power.net
 * @copyright Copyright 2011 zen-cart-power.net - 'Denim' template
*/
 
  $content ="";
  $product_amount = 0;

  if ($_SESSION['cart']->count_contents() > 0) {
    $products = $_SESSION['cart']->get_products();

    for ($i=0, $n=sizeof($products); $i<$n; $i++) {
		$product_amount = $products[$i]['quantity'] + $product_amount;
	}

	$content .= '<a href="' . zen_href_link(FILENAME_SHOPPING_CART, '', 'NONSSL') . '">' . HEADER_PRODUCT_AMOUNT . ' - <span>'. $product_amount . '</span></a>, '; 
  } else {
    $content .= '<div id="cartBoxEmpty">' . HEADER_SHOPPING_CART_EMPTY . '</div>';
  }

  if ($_SESSION['cart']->count_contents() > 0) {
    $content .= '<span>' . HEADER_SUBTOTAL. ': ' .  $currencies->format($_SESSION['cart']->show_total()) . '</span>';
  }

?>
