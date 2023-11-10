import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_hero/Helper/MainTheme.dart';

class CustomProductCard extends StatelessWidget {
  final String imagePath;
  final String productName;

  const CustomProductCard(
      {Key? key, required this.imagePath, required this.productName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              this.imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            Text(
              this.productName,
              style: MainTheme.of(context).bodyMedium.override(
                fontFamily: 'Poppins',
                useGoogleFonts: GoogleFonts.asMap().containsKey(
                    MainTheme.of(context).bodyMediumFamily),
              ),
            ),
          ],
        ),
      ),
    );
  }
}