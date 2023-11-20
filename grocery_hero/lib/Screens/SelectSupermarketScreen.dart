import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_hero/Helper/MainTheme.dart';
import 'package:grocery_hero/Screens/ViewAllProductsScreen.dart';
import 'package:grocery_hero/widgets/ShowProductItemCard.dart';

import '../models/Product.dart';

class SelectSupermarketScreen extends StatefulWidget {
  const SelectSupermarketScreen({Key? key}) : super(key: key);

  @override
  _SelectSupermarketScreenState createState() =>
      _SelectSupermarketScreenState();
}

class _SelectSupermarketScreenState extends State<SelectSupermarketScreen> {
  var textController;
  var sharedPrefs;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController ??= TextEditingController(text: 'Search');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: MainTheme.of(context).primaryBackground,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: MainTheme.of(context).secondaryBackground,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/Group_6821.png',
            ).image,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: MainTheme.of(context).sigmaX,
              sigmaY: MainTheme.of(context).sigmaY,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0x00101213),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              color: MainTheme.of(context).primaryBtnText,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 4, 0),
                                    child: Icon(
                                      Icons.search_rounded,
                                      color: MainTheme.of(context).primaryText,
                                      size: 24,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: textController,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: '[Some hint text...]',
                                        hintStyle:
                                            MainTheme.of(context).bodySmall,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style: MainTheme.of(context).bodyMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6, 40, 0, 0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  25, 0, 0, 0),
                                          child: Text(
                                            'Categories',
                                            textAlign: TextAlign.start,
                                            style: MainTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: MainTheme.of(context)
                                                      .primaryBtnText,
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(MainTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: MainTheme.of(context)
                                                .primaryBtnText,
                                            size: 22,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 45),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.18,
                                      decoration: BoxDecoration(
                                        color: Color(0x00FFFFFF),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ListView(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          ShowProductItemCard(
                                              product: Product(
                                                  productId: 15488,
                                                  price: "1.50",
                                                  imagePath:
                                                      "https://shop.rewe-static.de/homepage/71fb0622ba2591d33ffd6de81b83e63870a7b5b1/img/category/obst-gemuese.png",
                                                  productName:
                                                      "Fruits and Veggies")),
                                          ShowProductItemCard(
                                              product: Product(
                                                  productId: 15588,
                                                  price: "1.50",
                                                  imagePath:
                                                      "https://shop.rewe-static.de/homepage/71fb0622ba2591d33ffd6de81b83e63870a7b5b1/img/category/kochen-backen.png",
                                                  productName:
                                                      "Cake and Baking")),
                                          ShowProductItemCard(
                                              product: Product(
                                                  productId: 874,
                                                  price: "1.50",
                                                  imagePath:
                                                      "https://shop.rewe-static.de/homepage/71fb0622ba2591d33ffd6de81b83e63870a7b5b1/img/category/getraenke-genussmittel.png",
                                                  productName: "Drinks")),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  25, 0, 0, 0),
                                          child: Text(
                                            'Edeka',
                                            textAlign: TextAlign.start,
                                            style: MainTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: MainTheme.of(context)
                                                      .primaryBtnText,
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(MainTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: MainTheme.of(context)
                                                .primaryBtnText,
                                            size: 22,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 45),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.18,
                                      decoration: BoxDecoration(
                                        color: Color(0x00FFFFFF),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ListView(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          ShowProductItemCard(
                                              product: Product(
                                                  productId: 54878,
                                                  price: "1.20",
                                                  imagePath:
                                                      "https://res.cloudinary.com/goflink/image/upload/w_300,h_300,c_fill,g_south/product-images-prod/6518610a-3d8c-4225-a5c3-2aeb4e5114c9.webp",
                                                  productName:
                                                      "Pizza Margherita")),
                                          ShowProductItemCard(
                                              product: Product(
                                                  productId: 57992,
                                                  price: "1.50",
                                                  imagePath:
                                                      "https://res.cloudinary.com/goflink/image/upload/w_300,h_300,c_fill,g_south/product-images-prod/148c7e37-89a9-4001-a55d-d8481d736654.webp",
                                                  productName:
                                                      "Dr. Oetker Knusper-Müsli")),
                                          ShowProductItemCard(
                                              product: Product(
                                                  productId: 8722,
                                                  price: "1.50",
                                                  imagePath:
                                                      "https://res.cloudinary.com/goflink/image/upload/w_300,h_300,c_fill,g_south/product-images-prod/5165f507-ee50-4f54-bfa9-159183426ab1.webp",
                                                  productName: "Coca Cola 1l")),
                                          ShowProductItemCard(
                                            product: Product(
                                              productId: 648867,
                                              price: "1.40",
                                              imagePath:
                                                  "https://verbund.edeka/verbund/presse/mediathek/edeka_preview-logo.jpg?impolicy=4x3&imwidth=500&imdensity=1",
                                              productName: "More Products >",
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ViewAllProductWidget()));
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  25, 0, 0, 0),
                                          child: Text(
                                            'Penny',
                                            textAlign: TextAlign.start,
                                            style: MainTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: MainTheme.of(context)
                                                      .primaryBtnText,
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(MainTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: MainTheme.of(context)
                                                .primaryBtnText,
                                            size: 22,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 45),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.18,
                                      decoration: BoxDecoration(
                                        color: Color(0x00FFFFFF),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ListView(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          ShowProductItemCard(
                                              product: Product(
                                                  productId: 68655,
                                                  price: "1.50",
                                                  imagePath:
                                                      "https://res.cloudinary.com/goflink/image/upload/w_300,h_300,c_fill,g_south/product-images-prod/f0e97564-1ef4-4479-bc57-c07ccdacd15e.webp",
                                                  productName:
                                                      "Lorenz Crunchips")),
                                          ShowProductItemCard(
                                              product: Product(
                                                  productId: 825454,
                                                  price: "1.50",
                                                  imagePath:
                                                      "https://res.cloudinary.com/goflink/image/upload/w_300,h_300,c_fill,g_south/product-images-prod/f1837268-5860-4290-b12f-f5c03aadc290.webp",
                                                  productName: "Nutella 450g")),
                                          ShowProductItemCard(
                                              product: Product(
                                                  productId: 54878,
                                                  price: "1.50",
                                                  imagePath:
                                                      "https://res.cloudinary.com/goflink/image/upload/w_300,h_300,c_fill,g_south/product-images-prod/8f674ccd-e8c7-4066-9acd-3eb84b6742a5.webp",
                                                  productName:
                                                      "Monster Energy 0,5 l")),
                                          ShowProductItemCard(
                                            product: Product(
                                              productId: 57878,
                                              price: "1.50",
                                              imagePath:
                                                  "https://revistaprogresiv.ro/sites/default/files/news/images/penny_logo_002.jpg",
                                              productName: "More Products >",
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ViewAllProductWidget()));
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
