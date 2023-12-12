// To parse this JSON data, do
//
//     final deliveryCon2ResponseModel = deliveryCon2ResponseModelFromJson(jsonString);

import 'dart:convert';

DeliveryCon2ResponseModel deliveryCon2ResponseModelFromJson(String str) => DeliveryCon2ResponseModel.fromJson(json.decode(str));

String deliveryCon2ResponseModelToJson(DeliveryCon2ResponseModel data) => json.encode(data.toJson());

class DeliveryCon2ResponseModel {
  String? message;

  DeliveryCon2ResponseModel({
    this.message,
  });

  factory DeliveryCon2ResponseModel.fromJson(Map<String, dynamic> json) => DeliveryCon2ResponseModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
