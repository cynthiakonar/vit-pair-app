// To parse this JSON data, do
//
//     final senior = seniorFromJson(jsonString);

import 'dart:convert';

Senior seniorFromJson(String str) => Senior.fromJson(json.decode(str));

String seniorToJson(Senior data) => json.encode(data.toJson());

class Senior {
  String name;
  String phoneNumber;
  String mailId;
  String gender;
  String registrationNumber;
  int yearOfGraduation;
  String hostelBlock;
  String nri;
  String religion;
  String nativeLanguage;
  String nativeStateOrUt;
  String careerInterests;
  double cgpa;
  String highSchoolBoard;
  List<String> areaOfInterests;

  Senior({
    required this.name,
    required this.phoneNumber,
    required this.mailId,
    required this.gender,
    required this.registrationNumber,
    required this.yearOfGraduation,
    required this.hostelBlock,
    required this.nri,
    required this.religion,
    required this.nativeLanguage,
    required this.nativeStateOrUt,
    required this.careerInterests,
    required this.cgpa,
    required this.highSchoolBoard,
    required this.areaOfInterests,
  });

  factory Senior.fromJson(Map<String, dynamic> json) => Senior(
        name: json["Name"],
        phoneNumber: json["Phone Number"],
        mailId: json["Mail ID"],
        gender: json["Gender"],
        registrationNumber: json["Registration Number"],
        yearOfGraduation: json["Year of Graduation"],
        hostelBlock: json["Hostel Block"],
        nri: json["NRI"],
        religion: json["Religion"],
        nativeLanguage: json["Native Language"],
        nativeStateOrUt: json["Native State or UT"],
        careerInterests: json["Career Interests"],
        cgpa: json["CGPA"]?.toDouble(),
        highSchoolBoard: json["High School Board"],
        areaOfInterests:
            List<String>.from(json["Area of Interests"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Phone Number": phoneNumber,
        "Mail ID": mailId,
        "Gender": gender,
        "Registration Number": registrationNumber,
        "Year of Graduation": yearOfGraduation,
        "Hostel Block": hostelBlock,
        "NRI": nri,
        "Religion": religion,
        "Native Language": nativeLanguage,
        "Native State or UT": nativeStateOrUt,
        "Career Interests": careerInterests,
        "CGPA": cgpa,
        "High School Board": highSchoolBoard,
        "Area of Interests": List<dynamic>.from(areaOfInterests.map((x) => x)),
      };
}
