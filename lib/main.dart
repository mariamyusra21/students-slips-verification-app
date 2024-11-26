import 'package:exam_slip_verification/constants.dart';
import 'package:exam_slip_verification/utils/routes/routes.dart';
import 'package:exam_slip_verification/view/splash_view.dart';
import 'package:exam_slip_verification/view_models/slip_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SlipViewModel()),
      ],
      child: Builder(builder: (context) {
        return ResponsiveSizer(
            builder: (context, orientation, deviceType) => MaterialApp(
                  // home: SplashView(),
                  debugShowCheckedModeBanner: false,
                  home: SplashView(),
                  // initialRoute: RoutesName.splash_view,
                  onGenerateRoute: Routes.generateRoute,
                  theme: ThemeData(
                      fontFamily: 'TimesNewRoman',
                      scaffoldBackgroundColor: appBgColor,
                      appBarTheme: const AppBarTheme(
                          iconTheme: IconThemeData(color: mainColor))),
                ));
      }),
    );
  }
}
