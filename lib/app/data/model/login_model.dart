// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  String? access;
  String? refresh;
  String? employeeReference;
  String? name;
  bool? userType;

  LoginResponseModel({
    this.access,
    this.refresh,
    this.employeeReference,
    this.name,
    this.userType,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    access: json["access"],
    refresh: json["refresh"],
    employeeReference: json["employee_reference"],
    name: json["name"],
    userType: json["user_type"],
  );

  Map<String, dynamic> toJson() => {
  "access": access,
  "refresh": refresh,
  "employee_reference": employeeReference,
  "name": name,
  "user_type": userType,
  };
}