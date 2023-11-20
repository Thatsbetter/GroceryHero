import 'package:flutter/cupertino.dart';

import '../models/Product.dart';
import 'BuyProductItemCard.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      primary: false,
      scrollDirection: Axis.vertical,
      itemCount: (products.length / 2).ceil(),
      // Calculate the number of rows
      itemBuilder: (context, index) {
        // Get two products for each row
        int startIndex = index * 2;
        int endIndex = startIndex + 1;
        List<Product> rowProducts = endIndex < products.length
            ? products.sublist(startIndex, endIndex + 1)
            : [products[startIndex]];

        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: rowProducts
              .map(
                (product) => Expanded(
                  flex: 1,
                  child: BuyProductItemCard(product: product),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
