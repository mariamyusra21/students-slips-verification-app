import 'package:exam_slip_verification/view/main_view.dart';
import 'package:flutter/material.dart';

class SplashService {
  void splashService(BuildContext context, DateTime appvalidity, DateTime now) {
    // if (now.isAfter(appvalidity) || now.isAtSameMomentAs(appvalidity)) {
    //   Future.delayed(Duration(seconds: 5), () async {
    //     Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (context) => AppCloseView()));
    //   });
    // } else {
    Future.delayed(Duration(seconds: 5), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainView()));
    });
    // }
  }
}
