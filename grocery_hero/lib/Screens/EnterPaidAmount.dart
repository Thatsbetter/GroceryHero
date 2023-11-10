import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:grocery_hero/Helper/CustomButton.dart';
import 'package:grocery_hero/Helper/FlutterFlowIconButton.dart';
import 'package:grocery_hero/Helper/MainTheme.dart';

class EnterPaidAmount extends StatefulWidget {
  const EnterPaidAmount({Key? key}) : super(key: key);

  @override
  _EnterPaidAmountState createState() => _EnterPaidAmountState();
}

class _EnterPaidAmountState extends State<EnterPaidAmount> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController? textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(); // Initialize the text controller
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: MainTheme.of(context).primaryBackground,
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height * 0.09),
        child: AppBar(
          backgroundColor: MainTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(-1, 0),
            child: FlutterFlowIconButton(
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
          ),
          title: Align(
            alignment: AlignmentDirectional(-1, 0),
            child: Text(
              'My Cart',
              textAlign: TextAlign.center,
              style: MainTheme.of(context).titleMedium.override(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        // Wrap the Scaffold with SingleChildScrollView
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
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                      const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                          color: Color(0x7CFFFFFF),
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                        ),
                        alignment: AlignmentDirectional(-1, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: Text(
                                    'Please Enter the amount you paid',
                                    style: MainTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                child: Container(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: textController,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle:
                                      MainTheme.of(context).labelMedium,
                                      hintStyle:
                                      MainTheme.of(context).labelMedium,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: MainTheme.of(context).black,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: MainTheme.of(context)
                                              .primaryColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                          MainTheme.of(context).dangerColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: MainTheme.of(context).black,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    style: MainTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                    ),
                                    autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        print("empty");
                                        return 'Please enter a value';
                                      }

                                      final euroRegExp =
                                      RegExp(r'^\d+(\.\d{1,2})?$');
                                      if (!euroRegExp.hasMatch(value)) {
                                        print("not match");
                                        return 'Please enter a valid Euro value';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: CustomButton(
                                  text: "Continue",
                                  onTap: () {},
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: CustomButton(
                                      backgroundColor:
                                      MainTheme.of(context).dangerColor,
                                      text: "Cancel",
                                      onTap: () {}),
                                ))
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
      ),
    );
  }
}