// To parse this JSON data, do
//
//     final deliveryDetailsCon2ResponseModel = deliveryDetailsCon2ResponseModelFromJson(jsonString);

import 'dart:convert';

DeliveryDetailsCon2ResponseModel deliveryDetailsCon2ResponseModelFromJson(String str) => DeliveryDetailsCon2ResponseModel.fromJson(json.decode(str));

String deliveryDetailsCon2ResponseModelToJson(DeliveryDetailsCon2ResponseModel data) => json.encode(data.toJson());

class DeliveryDetailsCon2ResponseModel {
  String? message;

  DeliveryDetailsCon2ResponseModel({
    this.message,
  });

  factory DeliveryDetailsCon2ResponseModel.fromJson(Map<String, dynamic> json) => DeliveryDetailsCon2ResponseModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
