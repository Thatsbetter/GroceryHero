import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_hero/Helper/CustomButton.dart';
import 'package:grocery_hero/Helper/FlutterFlowIconButton.dart';
import 'package:grocery_hero/Helper/MainTheme.dart';

class ShowShoppingItems extends StatefulWidget {
  const ShowShoppingItems({Key? key}) : super(key: key);

  @override
  _ShowShoppingItemsState createState() => _ShowShoppingItemsState();
}

class _ShowShoppingItemsState extends State<ShowShoppingItems> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool? checkboxValue;
  bool checkboxvisible = false;

  bool isShopping = false;

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
                    flex: 14,
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
                              EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                MediaQuery.of(context).size.height * 0.1,
                                decoration: BoxDecoration(
                                  color:
                                  MainTheme.of(context).secondaryBackground,
                                  borderRadius: BorderRadius.circular(15),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Image.network(
                                        'https://res.cloudinary.com/goflink/image/upload/w_300,h_300,c_fill,g_south/product-images-prod/148c7e37-89a9-4001-a55d-d8481d736654.webp',
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.25,
                                        height:
                                        MediaQuery.of(context).size.height *
                                            1,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        width:
                                        MediaQuery.of(context).size.width,
                                        height:
                                        MediaQuery.of(context).size.height *
                                            1,
                                        decoration: BoxDecoration(
                                          color: MainTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10, 15, 0, 0),
                                          child: Text(
                                            'Name',
                                            textAlign: TextAlign.start,
                                            maxLines: 2,
                                            style: MainTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width:
                                        MediaQuery.of(context).size.width,
                                        height:
                                        MediaQuery.of(context).size.height *
                                            1,
                                        decoration: BoxDecoration(
                                          color: MainTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                          BorderRadius.circular(15),
                                        ),
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 15, 5, 0),
                                          child: Text(
                                            'count',
                                            textAlign: TextAlign.start,
                                            maxLines: 2,
                                            style: MainTheme.of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: checkboxvisible,
                                      child: Expanded(
                                        child: Container(
                                          width:
                                          MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              1,
                                          decoration: BoxDecoration(
                                            color: MainTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                            BorderRadius.circular(15),
                                          ),
                                          child: Theme(
                                            data: ThemeData(
                                              checkboxTheme: CheckboxThemeData(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(0),
                                                ),
                                              ),
                                              unselectedWidgetColor:
                                              Colors.grey,
                                            ),
                                            child: Checkbox(
                                                value: checkboxValue ??= false,
                                                onChanged: (newValue) async {
                                                  setState(() => checkboxValue =
                                                  newValue!);
                                                },
                                                activeColor:
                                                MainTheme.of(context)
                                                    .primaryColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(mainAxisSize: MainAxisSize.max, children: [
                      if (!isShopping) ...[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 65),
                            child: CustomButton(
                              text: "Start gathering items",
                              onTap: () {
                                setState(() {
                                  this.isShopping = true;
                                  this.checkboxvisible = true;
                                });
                              },
                            ),
                          ),
                        )
                      ] else ...[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                            child: CustomButton(
                              text: "I have all the items",
                              onTap: () {
                                setState(() {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return dialogBuilder();
                                      });
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(50, 15, 15, 15),
                            child: CustomButton(
                              text: "Cancel",
                              backgroundColor:
                              MainTheme.of(context).dangerColor,
                              onTap: () {
                                setState(() {
                                  checkboxvisible = false;
                                  isShopping = false;
                                });
                              },
                            ),
                          ),
                        )
                      ]
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget dialogBuilder() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          height: 240,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Are you Sure that you took all the Items?",
                    style: MainTheme.of(context).bodyMedium,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Click next to type in what you paid",
                    style: MainTheme.of(context).displayMedium,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(mainAxisSize: MainAxisSize.max, children: [
                    Expanded(
                      flex: 2,
                      child: CustomButton(
                        text: "Next",
                        onTap: () {
                          setState(() {});
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                        child: CustomButton(
                          text: "Cancel",
                          backgroundColor: MainTheme.of(context).dangerColor,
                          onTap: () {
                            setState(() {
                              Navigator.of(context, rootNavigator: true).pop();
                            });
                          },
                        ),
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}