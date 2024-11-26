import 'dart:convert';

import 'package:exam_slip_verification/constants.dart';
import 'package:exam_slip_verification/models/courses_model.dart';
import 'package:exam_slip_verification/models/student_model.dart';
import 'package:exam_slip_verification/view/course_details_view.dart';
import 'package:exam_slip_verification/view/qr_scanner_view.dart';
import 'package:exam_slip_verification/view/widgets/home_button_widget.dart';
import 'package:exam_slip_verification/view/widgets/slip_card.dart';
import 'package:exam_slip_verification/view_models/slip_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SlipView extends StatefulWidget {
  final String formID;
  const SlipView({super.key, required this.formID});

  @override
  State<SlipView> createState() => _SlipViewState();
}

class _SlipViewState extends State<SlipView> {
  dynamic image;
  late List<Courses> courseData = [];
  late String rollNo = '';
  late String name = '';
  late List<Student> studentData = [];

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
      body: FutureBuilder(
        future: Provider.of<SlipViewModel>(context, listen: false)
            .fetchData(widget.formID),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text('Please Wait...'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 50),
                  child: Text('Error: ${snapshot.error}'),
                ),
                InkWell(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QRScannerView(),
                    ),
                  ),
                  child: HomeButtonWidget(
                    widget: Icon(
                      Icons.qr_code,
                      color: appBgColor,
                      size: 25,
                    ),
                    text: 'Scan New Slip',
                  ),
                ),
              ],
            );
          } else {
            return Consumer<SlipViewModel>(
              builder: (context, model, child) {
                if (model.studentData.isEmpty && model.courseData.isEmpty) {
                  return Center(child: Text('No data available'));
                } else {
                  for (var enrolment in model.studentData) {
                    image = base64Decode(enrolment.image);
                    courseData = model.courseData;
                    rollNo = enrolment.rollNo.toString();
                    name = enrolment.name.toString();
                    studentData = model.studentData;
                  }

                  return SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, bottom: 10, top: 10),
                          child: Text(
                            'Controller of Examination (Semester)',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: mainColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, bottom: 10),
                          child: Text(
                            'EXAMINATION SLIP',
                            style: TextStyle(
                              fontSize: 17.sp,
                              color: mainColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        for (var enrolment in model.studentData)
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 3),
                                child: SlipCard(
                                  text1: Text(
                                    'Form No: ${enrolment.id}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  text2: Text(
                                    '${enrolment.year} ${enrolment.examType}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  text3: Text(
                                    'Roll No: ${rollNo}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 10, top: 10, bottom: 10),
                                child: Container(
                                  color: Colors.transparent,
                                  height: 10.h,
                                  child: Image.memory(image),
                                ),
                              ),
                            ],
                          ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Card(
                            elevation: 10,
                            color: drawerBgColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            surfaceTintColor: Colors.grey,
                            margin: EdgeInsets.only(
                                left: 7, top: 5, right: 7, bottom: 5),
                            child: Table(
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              border: TableBorder.all(
                                width: 1.0,
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              children: [
                                for (var enrolment in model.studentData) ...[
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Name: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '${enrolment.name.toString()}',
                                          style: TextStyle(
                                            color: mainColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Father\'s Name: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '${enrolment.fName.toString()}',
                                          style: TextStyle(
                                            color: mainColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Part & Semester: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Part: ${enrolment.part.toString()} & ${enrolment.semester} Semester',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Year: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '${enrolment.year.toString()}',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Exam Type: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '${enrolment.examType.toString()}',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // challan data for improver
                                  if (enrolment.paidStatus != null &&
                                      enrolment.paidStatus!.isNotEmpty)
                                    TableRow(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Payment Status: ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${enrolment.paidStatus}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ],
                            ),
                          ),
                        ),
                        // challan data for improvers only...
                        // for (var enrolment in model.studentData)
                        //   if (enrolment.challanNo != null &&
                        //       enrolment.challanDate != null &&
                        //       enrolment.challanRS != null)
                        //     Padding(
                        //       padding: const EdgeInsets.symmetric(
                        //           horizontal: 8.0, vertical: 10.0),
                        //       child: Card(
                        //         elevation: 10,
                        //         color: drawerBgColor,
                        //         shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(10),
                        //         ),
                        //         surfaceTintColor: Colors.grey,
                        //         margin: EdgeInsets.only(left: 7, right: 7),
                        //         child: Table(
                        //           defaultVerticalAlignment:
                        //               TableCellVerticalAlignment.middle,
                        //           border: TableBorder.all(
                        //             width: 1.0,
                        //             color: Colors.grey,
                        //             style: BorderStyle.solid,
                        //             borderRadius: BorderRadius.circular(10),
                        //           ),
                        //           children: [
                        //             TableRow(
                        //               children: [
                        //                 Padding(
                        //                   padding: const EdgeInsets.all(8.0),
                        //                   child: Text(
                        //                     'Challan Number: ',
                        //                     style: TextStyle(
                        //                       fontWeight: FontWeight.w600,
                        //                       color: Colors.black,
                        //                     ),
                        //                   ),
                        //                 ),
                        //                 Padding(
                        //                   padding: const EdgeInsets.all(8.0),
                        //                   child: Text(
                        //                     '${enrolment.challanNo}',
                        //                     style: TextStyle(
                        //                       fontWeight: FontWeight.w600,
                        //                       color: Colors.black,
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //             TableRow(
                        //               children: [
                        //                 Padding(
                        //                   padding: const EdgeInsets.all(8.0),
                        //                   child: Text(
                        //                     'Challan Date: ',
                        //                     style: TextStyle(
                        //                       fontWeight: FontWeight.w600,
                        //                       color: Colors.black,
                        //                     ),
                        //                   ),
                        //                 ),
                        //                 Padding(
                        //                   padding: const EdgeInsets.all(8.0),
                        //                   child: Text(
                        //                     '${enrolment.challanDate}',
                        //                     style: TextStyle(
                        //                       fontWeight: FontWeight.w600,
                        //                       color: Colors.black,
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //             TableRow(
                        //               children: [
                        //                 Padding(
                        //                   padding: const EdgeInsets.all(8.0),
                        //                   child: Text(
                        //                     'Challan Amount: ',
                        //                     style: TextStyle(
                        //                       fontWeight: FontWeight.w600,
                        //                       color: Colors.black,
                        //                     ),
                        //                   ),
                        //                 ),
                        //                 Padding(
                        //                   padding: const EdgeInsets.all(8.0),
                        //                   child: Text(
                        //                     '${enrolment.challanRS}',
                        //                     style: TextStyle(
                        //                       fontWeight: FontWeight.w600,
                        //                       color: Colors.black,
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),

                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => QRScannerView(),
                                ),
                              ),
                              child: HomeButtonWidget(
                                widget: Icon(
                                  Icons.qr_code,
                                  color: appBgColor,
                                  size: 25,
                                ),
                                text: 'Scan New Slip',
                              ),
                            ),
                            InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CoursesDetailView(
                                    formID: widget.formID,
                                    rollNo: rollNo,
                                    name: name,
                                    courseData: courseData,
                                    image: image,
                                  ),
                                ),
                              ),
                              child: HomeButtonWidget(
                                widget: Icon(
                                  Icons.list_alt,
                                  color: appBgColor,
                                  size: 25,
                                ),
                                text: 'View Courses',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
