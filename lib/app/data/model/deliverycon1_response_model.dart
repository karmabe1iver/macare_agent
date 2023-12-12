// To parse this JSON data, do
//
//     final deliveryCon1ResponseModel = deliveryCon1ResponseModelFromJson(jsonString);

import 'dart:convert';

DeliveryCon1ResponseModel deliveryCon1ResponseModelFromJson(String str) => DeliveryCon1ResponseModel.fromJson(json.decode(str));

String deliveryCon1ResponseModelToJson(DeliveryCon1ResponseModel data) => json.encode(data.toJson());

class DeliveryCon1ResponseModel {
  String? message;
  String? error;

  DeliveryCon1ResponseModel({
    this.message,
    this.error,
  });

  factory DeliveryCon1ResponseModel.fromJson(Map<String, dynamic> json) => DeliveryCon1ResponseModel(
    message: json["message"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "error": error,
  };
}
