// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? name;
  String? phoneNumber;
  String? mailId;
  String? gender;
  String? registrationNumber;
  int? yearOfGraduation;
  String? hostelBlock;
  String? nri;
  String? religion;
  String? nativeLanguage;
  String? nativeStateOrUt;
  String? careerInterests;
  double? cgpa;
  String? highSchoolBoard;
  List<String>? areaOfInterests;

  User({
    this.name,
    this.phoneNumber,
    this.mailId,
    this.gender,
    this.registrationNumber,
    this.yearOfGraduation,
    this.hostelBlock,
    this.nri,
    this.religion,
    this.nativeLanguage,
    this.nativeStateOrUt,
    this.careerInterests,
    this.cgpa,
    this.highSchoolBoard,
    this.areaOfInterests,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
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
        "Area of Interests": areaOfInterests != null
            ? List<dynamic>.from(areaOfInterests!.map((x) => x))
            : null,
      };
}
