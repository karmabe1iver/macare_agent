// To parse this JSON data, do
//
//     final addTestResponseModel = addTestResponseModelFromJson(jsonString);

import 'dart:convert';

List<AddTestResponseModel> addTestResponseModelFromJson(String str) => List<AddTestResponseModel>.from(json.decode(str).map((x) => AddTestResponseModel.fromJson(x)));

String addTestResponseModelToJson(List<AddTestResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddTestResponseModel {
  String? id;
  String? testName;
  String? testFee;
  String? testStatus;
  bool? deleteStatus;
  DateTime? createdOn;
  String? bookingReference;

  AddTestResponseModel({
    this.id,
    this.testName,
    this.testFee,
    this.testStatus,
    this.deleteStatus,
    this.createdOn,
    this.bookingReference,
  });

  factory AddTestResponseModel.fromJson(Map<String, dynamic> json) => AddTestResponseModel(
    id: json["id"],
    testName: json["test_name"],
    testFee: json["test_fee"],
    testStatus: json["test_status"],
    deleteStatus: json["delete_status"],
    createdOn: DateTime.parse(json["created_on"]),
    bookingReference: json["booking_reference"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "test_name": testName,
    "test_fee": testFee,
    "test_status": testStatus,
    "delete_status": deleteStatus,
    "created_on": createdOn,
    "booking_reference": bookingReference,
  };
}
