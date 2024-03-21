import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:grocery_hero/Helper/FlutterFlowWidgets.dart';
import 'package:grocery_hero/widgets/EditCartItemWidget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../Helper/MainTheme.dart';
import '../models/Cart.dart';
import '../widgets/ViewCartItemWidget.dart';

class ViewCartScreen extends StatefulWidget {
  const ViewCartScreen({Key? key}) : super(key: key);

  @override
  _ViewCartScreenState createState() => _ViewCartScreenState();
}

class _ViewCartScreenState extends State<ViewCartScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: Cart(), // Provide an instance of your Cart class
        child: Consumer<Cart>(
          builder: (context, cart, child) {
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
                  child: cart.isPublished
                      ? buildViewBody(context, cart)
                      : buildEditBody(
                          context, cart), // Conditionally render button
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildViewBody(BuildContext context, Cart cart) {
    return Padding(
      padding: EdgeInsets.only(top: 40),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.10,
              decoration: BoxDecoration(
                color: MainTheme.of(context).primaryBtnText,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Total amount',
                        style: MainTheme.of(context).bodyMedium,
                      ),
                      Text(
                        formatAmount(calculateAmount(cart)),
                        style: MainTheme.of(context).bodyMedium,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 7, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Status',
                          style: MainTheme.of(context).bodyMedium,
                        ),
                        Icon(
                          Icons.watch_later,
                          color: Colors.blueAccent,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: buildCartItems(context, false, cart),
          ),
          buildCancelButton(context, cart),
        ],
      ),
    );
  }

  Widget buildEditBody(BuildContext context, Cart cart) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 10,
            child: buildCartItems(context, true, cart),
          ),
          Expanded(
            flex: 1,
            child: buildPublishButton(context, cart),
          ),
        ],
      ),
    );
  }

  Widget buildCartItems(BuildContext context, bool edit, Cart cart) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: edit ? 35 : 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: cart.cartItems.values.map((cartItem) {
            return edit
                ? EditCartItemWidget(cartItem: cartItem)
                : ViewCartItemWidget(cartItem: cartItem);
          }).toList(),
        ),
      ),
    );
  }

  Widget buildCancelButton(BuildContext context, Cart cart) {
    return Expanded(
      flex: 1,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 1,
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
            cart.changePublishState();
            print('canceled list');
          },
          text: 'Cancel Order',
          options: FFButtonOptions(
            width: 130,
            height: 40,
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            color: Color(0xFFEE3D5B),
            textStyle: MainTheme.of(context).titleSmall.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: 8,
          ),
        ),
      ),
    );
  }

  Widget buildPublishButton(BuildContext context, Cart cart) {
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
          final double amount = calculateAmount(cart);
          if (amount != 0) {
            cart.changePublishState();
            print("publish list");
          }
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

  double calculateAmount(cart) {
    return cart.cartItems.values.fold(
        0.0,
        (total, item) =>
            total + (double.parse(item.product.price) * item.quantity));
  }

  String formatAmount(amount) {
    return NumberFormat.simpleCurrency(locale: 'de_DE', name: '€')
        .format(amount);
  }
}
