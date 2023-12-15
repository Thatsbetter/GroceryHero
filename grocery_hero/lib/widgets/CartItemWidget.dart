import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Helper/FlutterFlowCountController.dart';
import '../Helper/MainTheme.dart';
import '../models/Cart.dart';

class CartItemWidget extends StatefulWidget {
  final CartItem cartItem;

  const CartItemWidget({Key? key, required this.cartItem}) : super(key: key);

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
            ),
          ],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: MainTheme.of(context).secondaryBackground,
            width: 0,
          ),
        ),
        child: Row(
          children: [
            _buildImage(),
            _buildDetails(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              widget.cartItem.product.imagePath,
              width: 74,
              height: 74,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRemoveIcon(context),
            Text(
              widget.cartItem.product.productName,
              style: MainTheme.of(context).titleMedium,
            ),
            _buildQuantityAndPrice(context),
          ],
        ),
      ),
    );
  }

  Widget _buildRemoveIcon(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(1.00, 0.00),
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: GestureDetector(
          onTap: () {
            // Handle remove from cart
          },
          child: Icon(
            Icons.cancel_sharp,
            color: MainTheme.of(context).error,
            size: 28,
          ),
        ),
      ),
    );
  }

  Widget _buildQuantityAndPrice(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 16.0),
      child: Row(
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
                widget.cartItem.quantity.toString(),
                style: MainTheme.of(context).bodyMedium,
              ),
              count: widget.cartItem.quantity,
              updateCount: (count) =>
                  setState(() => widget.cartItem.quantity = count),
              stepSize: 1,
            ),
          ),
          Text(
            '${widget.cartItem.product.price} €',
            style: MainTheme.of(context).titleMedium,
          ),
        ],
      ),
    );
  }
}
