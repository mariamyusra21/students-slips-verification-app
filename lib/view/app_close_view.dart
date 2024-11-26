import 'package:exam_slip_verification/constants.dart';
import 'package:flutter/material.dart';

class AppCloseView extends StatelessWidget {
  const AppCloseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: drawerBgColor,
      body: Center(
        child: Text('This application has expired\nPlease contact ITSC'),
      ),
    );
  }
}
