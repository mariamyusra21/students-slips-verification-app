import 'package:exam_slip_verification/constants.dart';
import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  FormTextField({
    Key? key,
    this.formIDController,
    required this.text,
    required this.readOnly,
    this.keyboardType,
    this.color,
    this.disabledColor,
    this.prefix,
  });

  final TextEditingController? formIDController;
  final String text;
  Widget? prefix;
  final bool readOnly;
  TextInputType? keyboardType;
  Color? color;
  Color? disabledColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5),
      // height: 10.h,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
      decoration: BoxDecoration(
        // shape: BoxShape.rectangle,
        // color: color ?? const Color.fromARGB(219, 255, 255, 255),
        color: appBgColor,
        borderRadius: BorderRadius.circular(15.0),
        // boxShadow: [BoxShadow(offset: Offset(dx, dy))]
      ),
      // color: appBgColor,
      child: TextFormField(
        enabled: readOnly,
        controller: formIDController,
        cursorColor: mainColor,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefix: prefix,
          hintText: text.toString(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
                color: mainColor,
                style: BorderStyle.solid,
                width: 1.7), // Border color
          ),
          enabledBorder: OutlineInputBorder(
            // Border color when enabled
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
                color: mainColor, style: BorderStyle.solid, width: 1.7),
          ),
          focusedBorder: OutlineInputBorder(
            // Border color when focused
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
                color: mainColor, style: BorderStyle.solid, width: 1.7),
          ),
          disabledBorder: OutlineInputBorder(
            // Border color when focused
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
