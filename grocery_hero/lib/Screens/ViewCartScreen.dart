import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:grocery_hero/Helper/FlutterFlowWidgets.dart';

import '../Helper/FlutterFlowCountController.dart';
import '../Helper/MainTheme.dart';
import '../models/Cart.dart';

class ViewCartScreen extends StatefulWidget {
  const ViewCartScreen({Key? key}) : super(key: key);

  @override
  _ViewCartScreenState createState() => _ViewCartScreenState();
}

class _ViewCartScreenState extends State<ViewCartScreen> {
  int countControllerValue = 0;
  Cart _cart = Cart();

  void removeFromCart(int productId) {
    setState(() {
      _cart.removeFromCart(productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: MainTheme.of(context).secondaryBackground,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/Group_6821.png'),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: MainTheme.of(context).sigmaX,
            sigmaY: MainTheme.of(context).sigmaY,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 10,
                  child: buildCartItems(context),
                ),
                Expanded(
                  flex: 1,
                  child: buildFooter(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCartItems(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 35),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _cart.cartItems.values.map((cartItem) {
            return buildCartItem(cartItem: cartItem);
          }).toList(),
        ),
      ),
    );
  }

  Widget buildCartItem({required CartItem cartItem}) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.96,
        height: 120,
        decoration: BoxDecoration(
          color: MainTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x3A000000),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: MainTheme.of(context).secondaryBackground,
            width: 0,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      cartItem.product.imagePath,
                      width: 74,
                      height: 74,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(1.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: GestureDetector(
                          onTap: () {
                            removeFromCart(cartItem.product.productId);
                          },
                          child: Icon(
                            Icons.cancel_sharp,
                            color: MainTheme.of(context).error,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      cartItem.product.productName,
                      style: MainTheme.of(context).titleMedium,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 16, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 130,
                            height: 40,
                            decoration: BoxDecoration(
                              color: MainTheme.of(context).secondaryBackground,
                              borderRadius: BorderRadius.circular(8),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: MainTheme.of(context).primaryBackground,
                                width: 1,
                              ),
                            ),
                            child: FlutterFlowCountController(
                              decrementIconBuilder: (enabled) => Icon(
                                Icons.remove_rounded,
                                color: enabled
                                    ? MainTheme.of(context).primaryText
                                    : MainTheme.of(context).secondaryText,
                                size: 20,
                              ),
                              incrementIconBuilder: (enabled) => Icon(
                                Icons.add_rounded,
                                color: enabled
                                    ? MainTheme.of(context).primaryColor
                                    : MainTheme.of(context).secondaryText,
                                size: 20,
                              ),
                              countBuilder: (count) => Text(
                                cartItem.quantity.toString(),
                                style: MainTheme.of(context).bodyMedium,
                              ),
                              count: countControllerValue,
                              updateCount: (count) =>
                                  setState(() => countControllerValue = count),
                              stepSize: 1,
                            ),
                          ),
                          Text(
                            cartItem.product.price + ' €',
                            style: MainTheme.of(context).titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFooter(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: MainTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: FFButtonWidget(
        onPressed: () {
          print('Button pressed ...');
        },
        text: 'Publish list',
        options: FFButtonOptions(
          width: 130,
          height: 40,
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          color: MainTheme.of(context).primaryColor,
          textStyle: MainTheme.of(context).titleSmall.override(
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
    );
  }
}
