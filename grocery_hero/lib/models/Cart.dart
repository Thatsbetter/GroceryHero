import 'package:flutter/material.dart';
import 'package:grocery_hero/models/Product.dart';

class Cart extends ChangeNotifier {
  // Singleton instance
  static final Cart _instance = Cart._internal();

  factory Cart() => _instance;

  Cart._internal();

  // Map to store products in the cart with their quantities
  final Map<int, CartItem> _cartItems = {};
  bool isPublished = false;

  // Get the cart items
  Map<int, CartItem> get cartItems => _cartItems;

  // Add a product to the cart
  void addToCart({
    required Product product,
    required int quantity,
  }) {
    if (_cartItems.containsKey(product.productId)) {
      // Product is already in the cart, update the quantity
      _cartItems[product.productId]!.quantity += quantity;
    } else {
      // Add a new product to the cart
      _cartItems[product.productId] = CartItem(
        product: product,
        quantity: quantity,
      );
    }

    // Notify listeners of the change
    notifyListeners();
  }

  // Remove a product from the cart
  void removeFromCart(int productId) {
    _cartItems.remove(productId);

    // Notify listeners of the change
    notifyListeners();
  }

  // Clear the entire cart
  void clearCart() {
    _cartItems.clear();

    // Notify listeners of the change
    notifyListeners();
  }

  void changePublishState() {
    isPublished ? isPublished = false : isPublished = true;
    notifyListeners();
  }
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });
}
