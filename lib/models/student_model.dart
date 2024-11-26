class Student {
  var image;
  final String id;
  final String? name;
  final String? rollNo;
  final String? fName;
  final String? year;
  final String? part;
  final String? examType;
  final String? semester;
  final String? challanNo;
  final String? paidStatus;

  Student({
    required this.id,
    required this.name,
    required this.fName,
    required this.rollNo,
    required this.image,
    required this.semester,
    required this.year,
    required this.examType,
    required this.part,
    required this.challanNo,
    required this.paidStatus,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
        id: json['ID'],
        image: json['IMAGE'],
        name: json['NAME'],
        fName: json['FNAME'],
        rollNo: json['student_registration_ROLL_NO'],
        year: json['EXAM_YEAR'],
        examType: json['EXAM_TYPE'],
        part: json['part'],
        semester: json['SEMESTER'],
        challanNo: json['CHALLAN_NO'],
        paidStatus: json['PAID_STATUS']);
  }
}
