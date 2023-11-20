import 'package:grocery_hero/models/Product.dart';

class Cart {
  // Singleton instance
  static final Cart _instance = Cart._internal();

  factory Cart() => _instance;

  Cart._internal();

  // Map to store products in the cart with their quantities
  final Map<int, CartItem> _cartItems = {};

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
  }

  // Remove a product from the cart
  void removeFromCart(int productModel) {
    _cartItems.remove(productModel);
  }

  // Clear the entire cart
  void clearCart() {
    _cartItems.clear();
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
