import 'package:exam_slip_verification/constants.dart';
import 'package:exam_slip_verification/view/slip_view.dart';
import 'package:exam_slip_verification/view_models/slip_view_model.dart';
import 'package:flutter/material.dart';
import 'package:qr_mobile_vision/qr_camera.dart';

class QRScannerView extends StatefulWidget {
  const QRScannerView({super.key});

  @override
  State<QRScannerView> createState() => _QRScannerViewState();
}

class _QRScannerViewState extends State<QRScannerView> {
  String? qr;
  bool camState = true;
  bool dirState = false;
  bool isNavigating = false; // Add this flag
  List<BarcodeFormats> supportedFormat = [BarcodeFormats.ITF];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: drawerBgColor,
      appBar: AppBar(
        /* centerTitle: true,*/
        backgroundColor: drawerBgColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Scan QR Code of Examination Slip',
              style: headingTextStyle,
            ),
          ),
          Expanded(
            child: camState
                ? Center(
                    child: SizedBox(
                      width: 300.0,
                      height: 600.0,
                      child: QrCamera(
                        fit: BoxFit.fill,
                        onError: (context, error) => Text(
                          error.toString(),
                          style: const TextStyle(color: Colors.red),
                        ),
                        cameraDirection: CameraDirection.BACK,
                        qrCodeCallback: (code) {
                          if (code != null &&
                              code.isNotEmpty &&
                              !isNavigating) {
                            setState(() {
                              qr = code.replaceFirst(
                                  RegExp(r'^0+'), ''); // Remove leading zeros
                              isNavigating = true; // Set the flag
                            });
                            Future.microtask(() {
                              SlipViewModel().fetchData(qr!);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SlipView(formID: qr!),
                                ),
                              ).then((_) {
                                setState(() {
                                  isNavigating =
                                      false; // Reset the flag when done
                                });
                              });
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: mainColor,
                              width: 7.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : const Center(child: Text("Camera inactive")),
          ),
          Text("QR CODE: $qr"),
        ],
      ),
    );
  }
}
