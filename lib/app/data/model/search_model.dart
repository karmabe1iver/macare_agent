// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

List<SearchModel> searchModelFromJson(String str) => List<SearchModel>.from(json.decode(str).map((x) => SearchModel.fromJson(x)));

String searchModelToJson(List<SearchModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchModel {
  String? id;
  String? testName;
  dynamic testPrice;

  SearchModel({
    this.id,
    this.testName,
    this.testPrice,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    id: json["id"],
    testName: json["test_name"],
    testPrice: json["test_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "test_name": testName,
    "test_price": testPrice,
  };
}
