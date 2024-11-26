
import 'package:exam_slip_verification/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Utils {
 

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black,
        textColor: Colors.white);
  }


  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.blue,
      // elevation: 5,
      margin: EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      action: SnackBarAction(
          label: 'Open Home',
          textColor: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.mainView);
          }),
    ));
  }
}
