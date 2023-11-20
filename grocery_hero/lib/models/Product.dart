class Product {
  final int productId;
  final String price;
  final String imagePath;
  final String productName;

  Product({
    required this.productId,
    required this.price,
    required this.imagePath,
    required this.productName,
  });

  // Additional constructors for creating instances from different data sources
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'] ?? '',
      price: json['price'] ?? '',
      imagePath: json['imagePath'] ?? '',
      productName: json['productName'] ?? '',
    );
  }

  factory Product.fromDatabase(Map<String, dynamic> data) {
    return Product(
      productId: data['productId'] ?? '',
      price: data['price'] ?? '',
      imagePath: data['imagePath'] ?? '',
      productName: data['productName'] ?? '',
    );
  }

  // Additional methods for any future transformations or operations
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'price': price,
      'imagePath': imagePath,
      'productName': productName,
    };
  }
}
