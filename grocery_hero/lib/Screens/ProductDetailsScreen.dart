import 'dart:ui';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_hero/Helper/FlutterFlowCountController.dart';
import 'package:grocery_hero/Helper/FlutterFlowWidgets.dart';
import 'package:grocery_hero/models/Product.dart';
import 'package:provider/provider.dart';

import '../Helper/MainTheme.dart';
import '../models/Cart.dart';
import '../widgets/ShowProductItemCard.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product mainProduct;

  const ProductDetailsScreen({
    Key? key,
    required this.mainProduct,
  }) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int countControllerValue = 0;

  @override
  void initState() {
    super.initState();

    final cart = Provider.of<Cart>(context, listen: false);
    countControllerValue =
        cart.cartItems.containsKey(widget.mainProduct.productId)
            ? cart.cartItems[widget.mainProduct.productId]!.quantity
            : 0;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void addToCart(BuildContext context, Cart cart, int quantity) {
    if (!cart.isPublished) {
      // Use Provider.of<Cart> to access the cart instance
      cart.addToCart(
        product: widget.mainProduct,
        quantity: quantity,
      );

      final snackBar = SnackBar(content: Text('Product added to cart'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      final snackBar = SnackBar(
          content:
              Text('You Already published a list, Cancel your List first.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    var similarImagePath =
        "https://res.cloudinary.com/goflink/image/upload/w_300,h_300,c_fill,g_south/product-images-prod/8f674ccd-e8c7-4066-9acd-3eb84b6742a5.webp";
    var similarProductName = "Monster Energy 0,5 l";
    var similarProductPrice = "1.50";
    var similarProductId = 1455;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: MainTheme.of(context).secondaryBackground,
      body: ChangeNotifierProvider.value(
        value: Cart(), // Provide an instance of your Cart class
        child: Consumer<Cart>(
          builder: (context, cart, child) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    flex: 9,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
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
                        borderRadius: BorderRadius.circular(0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: MainTheme.of(context).sigmaX,
                            sigmaY: MainTheme.of(context).sigmaY,
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    decoration: BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  25, 20, 0, 0),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pop(
                                                  context); // Navigate back when the icon is tapped
                                            },
                                            child: Icon(
                                              Icons.arrow_back_ios,
                                              color: Colors.black,
                                              size: 40,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 20, 16, 16),
                                    child: Hero(
                                      tag: 'mainImage',
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          widget.mainProduct.imagePath,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.30,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    decoration: BoxDecoration(
                                      color: Color(0x30F1F4F8),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            widget.mainProduct.productName,
                                            style: MainTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 30,
                                                ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            widget.mainProduct.price + " €",
                                            style: MainTheme.of(context)
                                                .titleLarge,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    height: 35,
                                    thickness: 2,
                                    color: Color(0x6AF1F4F8),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 8),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0x63FFFFFF),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        color: Color(0x00FFFFFF),
                                        child: ExpandableNotifier(
                                          initialExpanded: false,
                                          child: ExpandablePanel(
                                            header: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 12, 0),
                                                  child: Icon(
                                                    Icons
                                                        .sticky_note_2_outlined,
                                                    color: MainTheme.of(context)
                                                        .primaryText,
                                                    size: 24,
                                                  ),
                                                ),
                                                Text(
                                                  'Product Detail',
                                                  style: MainTheme.of(context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                            collapsed: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 0, 0),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.04,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  'Lorem ipsum dolor sit amet, consectetur adipiscing...',
                                                  style: MainTheme.of(context)
                                                      .bodySmall,
                                                ),
                                              ),
                                            ),
                                            expanded: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                                  child: Text(
                                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                                    style: MainTheme.of(context)
                                                        .bodySmall,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            theme: ExpandableThemeData(
                                              tapHeaderToExpand: true,
                                              tapBodyToExpand: true,
                                              tapBodyToCollapse: true,
                                              headerAlignment:
                                                  ExpandablePanelHeaderAlignment
                                                      .center,
                                              hasIcon: true,
                                              expandIcon:
                                                  Icons.chevron_right_rounded,
                                              collapseIcon: Icons
                                                  .keyboard_arrow_down_rounded,
                                              iconSize: 24,
                                              iconColor: MainTheme.of(context)
                                                  .secondaryText,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
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
                                            'Similar Products',
                                            textAlign: TextAlign.start,
                                            style: MainTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: MainTheme.of(context)
                                                      .primaryBtnText,
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w600,
                                                ),
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
                                                  productId: similarProductId,
                                                  price: similarProductPrice,
                                                  imagePath: similarImagePath,
                                                  productName:
                                                      similarProductName)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(
                      color: MainTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 15, 16, 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                              child: FFButtonWidget(
                                onPressed: () {
                                  addToCart(
                                      context, cart, countControllerValue);
                                },
                                text: 'Add to Cart',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: double.infinity,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  color: Colors.blue,
                                  textStyle:
                                      MainTheme.of(context).titleSmall.override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: null,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                ),
                                child: FlutterFlowCountController(
                                  decrementIconBuilder: (enabled) => FaIcon(
                                    FontAwesomeIcons.minus,
                                    color: enabled
                                        ? Color(0xDD000000)
                                        : Color(0xFFEEEEEE),
                                    size: 20,
                                  ),
                                  incrementIconBuilder: (enabled) => FaIcon(
                                    FontAwesomeIcons.plus,
                                    color: enabled
                                        ? Colors.blue
                                        : Color(0xFFEEEEEE),
                                    size: 20,
                                  ),
                                  countBuilder: (count) => Text(
                                    count.toString(),
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  count: countControllerValue,
                                  updateCount: (count) => setState(
                                      () => countControllerValue = count),
                                  stepSize: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
