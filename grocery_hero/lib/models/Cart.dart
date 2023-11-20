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
    required int productModel,
    required String productName,
    required double productPrice,
    required String productImagePath,
    required int quantity,
  }) {
    if (_cartItems.containsKey(productModel)) {
      // Product is already in the cart, update the quantity
      _cartItems[productModel]!.quantity += quantity;
    } else {
      // Add a new product to the cart
      _cartItems[productModel] = CartItem(
        productName: productName,
        productPrice: productPrice,
        productImagePath: productImagePath,
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
  final String productName;
  final double productPrice;
  final String productImagePath;
  int quantity;

  CartItem({
    required this.productName,
    required this.productPrice,
    required this.productImagePath,
    required this.quantity,
  });
}
