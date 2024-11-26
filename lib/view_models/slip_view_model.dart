import 'dart:convert';
import 'dart:io';

import 'package:exam_slip_verification/API/app_exceptions.dart';
import 'package:exam_slip_verification/models/courses_model.dart';
import 'package:exam_slip_verification/models/student_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SlipViewModel with ChangeNotifier {
  List<Student> studentData = [];
  List<Courses> courseData = [];
  final _client = http.Client();

  bool _loading = false;

  get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> fetchData(String formID) async {
    Map<String, dynamic> request = {"form_no": formID};
    dynamic responseJson;
    try {
      final response = await _client.post(
        Uri.parse(apiLink),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request),
      );
      // .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
  
      final enrolmentJson = responseJson['ENROLMENT'];
      final coursesJsonList = responseJson['PAPER'];
      Paper paperList = Paper.fromJson(coursesJsonList);
      // print(enrolmentJson);
      // print(coursesJsonList);
      studentData.clear();
      courseData.clear();
      studentData.add(Student.fromJson(enrolmentJson));
      courseData.addAll(paperList.course);
      notifyListeners();
    } on SocketException {
      throw FetchDataException('No INTERNET Connection.');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 204:
        throw FetchDataException('Content not found');

      case 206:
        throw BadRequestException('Content not found');

      case 400:
        throw BadRequestException('Invalid Request');
      case 404:
        throw UnauthorizedException('Unauthorized User Request');

      default:
        throw FetchDataException(
            'Error occurred while communicating with server'
                    ' with status code' +
                response.statusCode.toString());
    }
  }
}
