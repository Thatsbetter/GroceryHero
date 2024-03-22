import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Helper/FlutterFlowCountController.dart';
import '../Helper/MainTheme.dart';
import '../models/Cart.dart';

class ViewCartItemWidget extends StatefulWidget {
  final CartItem cartItem;

  const ViewCartItemWidget({Key? key, required this.cartItem}) : super(key: key);

  @override
  _ViewCartItemWidgetState createState() => _ViewCartItemWidgetState();
}

class _ViewCartItemWidgetState extends State<ViewCartItemWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width:
            MediaQuery.sizeOf(context).width * 0.96,
            height: 83,
            decoration: BoxDecoration(
              color: MainTheme.of(context)
                  .secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x3A000000),
                  offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: MainTheme.of(context)
                    .secondaryBackground,
                width: 0,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(
                          8, 0, 0, 0),
                      child: ClipRRect(
                        borderRadius:
                        BorderRadius.circular(8),
                        child: Image.network(widget.cartItem.product.imagePath,
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
                    padding:
                    EdgeInsetsDirectional.fromSTEB(
                        12, 15, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.cartItem.product.productName,
                          style:
                          MainTheme.of(context)
                              .titleMedium,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional
                              .fromSTEB(0, 8, 16, 0),
                          child: Row(
                            mainAxisSize:
                            MainAxisSize.max,
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.cartItem.product.price,
                                style:
                                MainTheme.of(
                                    context)
                                    .bodyMedium,
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional
                                    .fromSTEB(
                                    10, 0, 0, 0),
                                child: Text(
                                  "x "+widget.cartItem.quantity.toString(),
                                  style:
                                  MainTheme.of(
                                      context)
                                      .bodyMedium,
                                ),
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
        ],
      ),
    );
  }

 
}
