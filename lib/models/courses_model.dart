class Courses {
  final String? courseNo;
  final String? courseTitle;

  Courses({
    this.courseNo,
    this.courseTitle,
  });

  factory Courses.fromJson(Map<String, dynamic> json) {
    return Courses(
      courseNo: json['scheme_detail_COURSE_NO'],
      courseTitle: json['scheme_detail_COURSE_TITTLE'],
    );
  }
}

class Paper {
  final List<Courses> course;
  Paper({required this.course});

  factory Paper.fromJson(List<dynamic> json) {
    List<Courses> courses = json.map((courseJson) {
      return Courses.fromJson(courseJson);
    }).toList();
    return Paper(course: courses);
  }

  //  factory Paper.fromJson(List<dynamic> parsedJson) {

  // List<Courses> courses = jso((courseJson) {
  //     return Courses.fromJson(courseJson);
  //   }).toList();

  //   return new PhotosList(
  //     photos: photos
  //   );
  // }
}
