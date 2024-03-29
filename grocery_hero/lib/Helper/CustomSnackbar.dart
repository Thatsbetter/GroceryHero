import 'package:flutter/material.dart';

class CustomSnackbar {
  static void show(BuildContext context, String message,
      {Color backgroundColor = Colors.black87,
        double height = 60.0,
        double width = 200.0,
        double bottomMargin = 10.0,
        double sideMargin = 10.0}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(17.0),
          ),
          child: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 0.0,
        margin: EdgeInsets.only(bottom: bottomMargin, left: sideMargin, right: sideMargin),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17.0),
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }
}

