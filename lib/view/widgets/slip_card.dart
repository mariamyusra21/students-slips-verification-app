import 'package:exam_slip_verification/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SlipCard extends StatelessWidget {
  const SlipCard({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
  });

  final Text text1;
  final Text text2;
  final Text text3;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: mainColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      surfaceTintColor: Colors.grey,
      margin: EdgeInsets.only(left: 7, top: 5, right: 7, bottom: 5),
      child: Container(
        width: 63.w,
        height: 11.h,
        // color: mainColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              text1,
              SizedBox(
                height: 5,
              ),
              text2,
              SizedBox(
                height: 5,
              ),
              text3,
            ],
          ),
        ),
      ),
    );
  }
}
