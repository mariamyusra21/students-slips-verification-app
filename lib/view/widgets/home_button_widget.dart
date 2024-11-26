import 'package:exam_slip_verification/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeButtonWidget extends StatelessWidget {
  const HomeButtonWidget({
    super.key,
    required this.text,
    required this.widget,
    // required this.ontap,
  });
  final String text;
  final Widget widget;
  // final Function ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      width: 39.w,
      decoration: BoxDecoration(
          color: mainColor, borderRadius: BorderRadius.circular(5.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          widget,
          Text(
            text,
            style: buttonTextStyle,
          ),
        ],
      ),
    );
  }
}
