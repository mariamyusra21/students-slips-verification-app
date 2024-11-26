import 'package:exam_slip_verification/constants.dart';
import 'package:exam_slip_verification/models/courses_model.dart';
import 'package:exam_slip_verification/view/qr_scanner_view.dart';
import 'package:exam_slip_verification/view/widgets/home_button_widget.dart';
import 'package:exam_slip_verification/view/widgets/slip_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CoursesDetailView extends StatefulWidget {
  CoursesDetailView(
      {super.key,
      required this.formID,
      required this.rollNo,
      required this.name,
      required this.image,
      required this.courseData});

  final String formID;
  final String rollNo;
  final String name;
  dynamic image;
  final List<Courses> courseData;

  @override
  State<CoursesDetailView> createState() => _CoursesDetailViewState();
}

class _CoursesDetailViewState extends State<CoursesDetailView> {
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
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 10, top: 10),
              child: Text(
                'Controller of Examination (Semester)',
                style: TextStyle(
                    fontSize: 16.sp,
                    color: mainColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 10),
              child: Text(
                'EXAMINATION SLIP',
                style: TextStyle(
                    fontSize: 17.sp,
                    color: mainColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
            // for (var enrolment in model.studentData)
            Row(
              // mainAxisAlignment: MainAxisAlignment.spacesEvenly,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: SlipCard(
                    text1: Text('Form No: ${widget.formID}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                          color: Colors.white,
                        )),
                    text2: Text(
                      // ${enrolment.semester} SEMESTER
                      'Roll No: ${widget.rollNo}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                        color: Colors.white,
                      ),
                    ),
                    text3: Text(
                      // ${enrolment.semester} SEMESTER
                      'Name: ${widget.name}',
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
                    // width: 30.w,
                    child: Image.memory(
                      widget.image,
                    ),
                  ),
                ),
              ],
            ),
            // Table(
            //   defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            //   border: TableBorder.all(
            //       width: 1.0, color: Colors.grey, style: BorderStyle.solid),
            //   children: [
            //     TableRow(children: [
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Text(
            //           'Course ID',
            //           style: TextStyle(
            //               color: Colors.black, fontWeight: FontWeight.w600),
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Text(
            //           'Course Title',
            //           style: TextStyle(
            //               color: Colors.black, fontWeight: FontWeight.w600),
            //         ),
            //       )
            //     ]),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Card(
                elevation: 10,
                color: drawerBgColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                surfaceTintColor: Colors.grey,
                margin: EdgeInsets.only(left: 7, top: 5, right: 7, bottom: 5),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.all(
                    width: 1.0,
                    color: Colors.grey,
                    style: BorderStyle.solid,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  children: [
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Course ID',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Course Title',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                      )
                    ]),
                    for (var courses in widget.courseData) ...[
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${courses.courseNo}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${courses.courseTitle}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ]),
                    ]
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => QRScannerView())),
                  child: HomeButtonWidget(
                    widget: Icon(
                      Icons.qr_code_scanner,
                      color: appBgColor,
                      size: 25,
                    ),
                    text: 'Scan New Slip',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
