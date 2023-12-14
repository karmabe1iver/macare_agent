// To parse this JSON data, do
//
//     final addSelectedTestModel = addSelectedTestModelFromJson(jsonString);

import 'dart:convert';

List<AddSelectedTestModel> addSelectedTestModelFromJson(String str) => List<AddSelectedTestModel>.from(json.decode(str).map((x) => AddSelectedTestModel.fromJson(x)));

String addSelectedTestModelToJson(List<AddSelectedTestModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddSelectedTestModel {
  String testName;
  String testPrice;
  String bookingReference;

  AddSelectedTestModel({
    required this.testName,
    required this.testPrice,
    required this.bookingReference,
  });

  factory AddSelectedTestModel.fromJson(Map<String, dynamic> json) => AddSelectedTestModel(
    testName: json["testName"],
    testPrice: json["testPrice"],
    bookingReference: json["bookingReference"],
  );

  Map<String, dynamic> toJson() => {
    "test_name": testName,
    "test_fee": testPrice,
    "booking_reference": bookingReference,
  };
}
