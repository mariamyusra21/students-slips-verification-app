import 'package:exam_slip_verification/utils/routes/routes_name.dart';
import 'package:exam_slip_verification/view/main_view.dart';
import 'package:exam_slip_verification/view/qr_scanner_view.dart';
import 'package:exam_slip_verification/view/splash_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.mainView:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MainView());
      case RoutesName.qr_scanner_view:
        return MaterialPageRoute(
            builder: (BuildContext context) => const QRScannerView());
      case RoutesName.splash_view:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
