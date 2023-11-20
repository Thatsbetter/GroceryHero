import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_hero/Helper/MainTheme.dart';
import 'package:grocery_hero/models/Product.dart';

import '../Screens/ProductDetailsScreen.dart';

class ShowProductItemCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ShowProductItemCard({Key? key, required this.product, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProductDetailsScreen(mainProduct: product),
              ),
            );
          },
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(6, 0, 6, 0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.25,
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
              Image.network(
                product.imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              Text(
                product.productName,
                style: MainTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      useGoogleFonts: GoogleFonts.asMap()
                          .containsKey(MainTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
