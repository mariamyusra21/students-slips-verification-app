import 'package:exam_slip_verification/constants.dart';
import 'package:exam_slip_verification/utils/routes/routes_name.dart';
import 'package:exam_slip_verification/view/slip_view.dart';
import 'package:exam_slip_verification/view/widgets/form_textfield.dart';
import 'package:exam_slip_verification/view/widgets/home_button_widget.dart';
import 'package:exam_slip_verification/view_models/slip_view_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final TextEditingController formIDController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    formIDController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: drawerBgColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: drawerBgColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                'assets/images/usindh image.png',
                height: 50,
              ),
            ),
            Text('University of Sindh', style: appBarTextStyle),
          ],
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                'Verify Examination Slip',
                style: headingTextStyle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 15),
            child: Text(
              'Enter Form Number:',
              style: textTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: FormTextField(
              formIDController: formIDController,
              text: 'Example: 415678',
              readOnly: true,
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 225.0),
            child: InkWell(
              onTap: () {
                print(formIDController.text);
                // SlipAPI().verifySlip(formIDController.text);
                SlipViewModel().fetchData(formIDController.text);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SlipView(
                              formID: formIDController.text,
                            )));
                // clearController();
                // setState(() {
                //   formIDController.clear();
                // });
                // if (formIDController.text == formCode) {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const VerifiedSlipScreen(),
                //     ),
                //   );
                // }
              },
              child: Container(
                // height: 5.h,
                height: 5.h,
                width: 30.w,
                // width: 30.w,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(5.0)),
                child: Center(
                  child: Text(
                    'Verify',
                    style: buttonTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.qr_scanner_view);
              },
              child: HomeButtonWidget(
                widget: Icon(
                  Icons.qr_code,
                  color: appBgColor,
                  size: 25,
                ),
                text: 'Scan New Slip',
              ),

              /*Container(
                // height: 48,
                // width: 48,
                height: 7.h,
                width: 50.w,
                // alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(5.0)),
                child: Padding(
                  padding: const EdgeInsets.all(48.0),
                  child: Text(
                    'Scan QR Code',
                    style: buttonTextStyle,
                    // textAlign: TextAlign.center,
                  ),
                  */ /* Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      */ /* */ /*Icon(
                        Icons.qr_code_scanner,
                        color: appBgColor,
                        size: 20,
                      ),*/ /* */ /*
                      Text(
                        'Scan QR Code',
                        style: buttonTextStyle,
                        // textAlign: TextAlign.center,
                      ),
                    ],
                  ),*/ /*
                ),
              ),*/
            ),
          ),
        ],
      ),
    );
  }
}
