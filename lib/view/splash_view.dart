import 'package:exam_slip_verification/constants.dart';
import 'package:exam_slip_verification/services/splash_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key, String? notificationPayload});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashService splashService = SplashService();
  DateTime currentDate = DateTime.now();
  String validTill = '20-06-2024';

  @override
  void initState() {
    DateTime appValidity = DateFormat('dd-MM-yyyy').parse(validTill);
    splashService.splashService(context, appValidity, currentDate);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: drawerBgColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/usindh image.png',
                height: 250,
                width: 150,
              ),
              const Text(
                'EXAM SLIP\nVERIFICATION',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: mainColor,
                    fontFamily: 'TimesNewRoman'),
              ),
            ],
          ),
        ));
  }
}
