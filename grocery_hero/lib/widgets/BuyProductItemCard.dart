import 'package:flutter/material.dart';
import 'package:grocery_hero/Helper/MainTheme.dart';

import '../Screens/ProductDetailsScreen.dart';

class BuyProductItemCard extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String price;
  final VoidCallback? onTap;

  const BuyProductItemCard(
      {Key? key,
      required this.imagePath,
      required this.productName,
      required this.price,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(
                  mainProductPrice: price,
                  mainProductName: productName,
                  mainProductImagePath: imagePath),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(6, 0, 6, 0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.45,
            height: MediaQuery.sizeOf(context).height * 0.25,
            decoration: BoxDecoration(
              color: MainTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  color: Color(0x33000000),
                  offset: Offset(0, 1),
                )
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Image.network(
                      imagePath,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Text(
                      productName,
                      style: MainTheme.of(context).bodyMedium,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: AlignmentDirectional(1.00, 0.00),
                          child: Text(
                            price + ' €',
                            style: MainTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: AlignmentDirectional(1.00, 0.00),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Icon(
                              Icons.add_box,
                              color: Color(0xFF5341F5),
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
