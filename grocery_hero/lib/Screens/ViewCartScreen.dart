import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:grocery_hero/Helper/FlutterFlowIconButton.dart';
import 'package:grocery_hero/Helper/FlutterFlowWidgets.dart';

import '../Helper/FlutterFlowCountController.dart';
import '../Helper/MainTheme.dart';

class ViewCartScreen extends StatefulWidget {
  const ViewCartScreen({Key? key}) : super(key: key);

  @override
  _ViewCartScreenState createState() => _ViewCartScreenState();
}

class _ViewCartScreenState extends State<ViewCartScreen> {
  int countControllerValue = 0;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
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
      appBar: AppBar(
        backgroundColor: MainTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 46,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: MainTheme.of(context).primaryText,
            size: 24,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        title: Text(
          'My Cart',
          style: MainTheme.of(context).titleMedium,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: Container(
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
              sigmaX: 15,
              sigmaY: 15,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 10,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.96,
                                    height: 120,
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 0, 0),
                                              child: ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(8),
                                                child: Image.network(
                                                  'https://res.cloudinary.com/goflink/image/upload/w_300,h_300,c_fill,g_south/product-images-prod/148c7e37-89a9-4001-a55d-d8481d736654.webp',
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
                                                12, 0, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '[Product Name]',
                                                  style: MainTheme.of(
                                                      context)
                                                      .titleMedium,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 8, 16, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: 130,
                                                        height: 40,
                                                        decoration:
                                                        BoxDecoration(
                                                          color: MainTheme
                                                              .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(8),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: MainTheme
                                                                .of(context)
                                                                .primaryBackground,
                                                            width: 1,
                                                          ),
                                                        ),
                                                        child:
                                                        FlutterFlowCountController(
                                                          decrementIconBuilder:
                                                              (enabled) => Icon(
                                                            Icons
                                                                .remove_rounded,
                                                            color: enabled
                                                                ? MainTheme.of(
                                                                context)
                                                                .primaryText
                                                                : MainTheme.of(
                                                                context)
                                                                .secondaryText,
                                                            size: 20,
                                                          ),
                                                          incrementIconBuilder:
                                                              (enabled) => Icon(
                                                            Icons.add_rounded,
                                                            color: enabled
                                                                ? MainTheme.of(
                                                                context)
                                                                .primaryColor
                                                                : MainTheme.of(
                                                                context)
                                                                .secondaryText,
                                                            size: 20,
                                                          ),
                                                          countBuilder:
                                                              (count) => Text(
                                                            count.toString(),
                                                            style: MainTheme
                                                                .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          count:
                                                          countControllerValue,
                                                          updateCount: (count) =>
                                                              setState(() =>
                                                              countControllerValue =
                                                                  count),
                                                          stepSize: 1,
                                                        ),
                                                      ),
                                                      Text(
                                                        '[Price]',
                                                        style:
                                                        MainTheme.of(
                                                            context)
                                                            .titleMedium,
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
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
                          iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: MainTheme.of(context).primaryColor,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}