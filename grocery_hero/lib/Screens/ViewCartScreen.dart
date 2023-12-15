import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:grocery_hero/Helper/FlutterFlowWidgets.dart';
import 'package:grocery_hero/service/PaymentService.dart';
import 'package:grocery_hero/widgets/CartItemWidget.dart';

import '../Helper/MainTheme.dart';
import '../models/Cart.dart';

class ViewCartScreen extends StatefulWidget {
  const ViewCartScreen({Key? key}) : super(key: key);

  @override
  _ViewCartScreenState createState() => _ViewCartScreenState();
}

class _ViewCartScreenState extends State<ViewCartScreen> {
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
            return CartItemWidget(cartItem: cartItem);
          }).toList(),
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
          final double amount = calculateAmount();
          if (amount != 0) {
            confirmPayment(amount);
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

  Future<void> initPaymentSheet(final String paymentIntent) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Main params
          paymentIntentClientSecret: paymentIntent,
          merchantDisplayName: 'Karid',
          style: ThemeMode.light,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
      rethrow;
    }
  }

  Future<void> confirmPayment(final double amount) async {
    try {
      final data = await PaymentService.createTestPaymentSheet(amount);
      final String paymentIntent = data['paymentIntent'];
      Stripe.publishableKey = data['publishableKey'];
      // 3. display the payment sheet.
      await initPaymentSheet(paymentIntent);
      await Stripe.instance.presentPaymentSheet();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Payment succesfully completed'),
        ),
      );
      setState(() {
        _cart.clearCart();

      });
    } on Exception catch (e) {
      await PaymentService.reportErrorToBackend(e);
      if (e is StripeException) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error from Stripe: ${e.error.localizedMessage}'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Unforeseen error: ${e}'),
          ),
        );
      }
    }
  }

  double calculateAmount() {
    return _cart.cartItems.values.fold(
        0.0,
        (total, item) =>
            total + (double.parse(item.product.price) * item.quantity));
  }
}
