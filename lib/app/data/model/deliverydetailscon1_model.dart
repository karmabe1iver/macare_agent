// To parse this JSON data, do
//
//     final deliveryDetailsCon1ResponseModel = deliveryDetailsCon1ResponseModelFromJson(jsonString);

import 'dart:convert';

DeliveryDetailsCon1ResponseModel deliveryDetailsCon1ResponseModelFromJson(String str) => DeliveryDetailsCon1ResponseModel.fromJson(json.decode(str));

String deliveryDetailsCon1ResponseModelToJson(DeliveryDetailsCon1ResponseModel data) => json.encode(data.toJson());

class DeliveryDetailsCon1ResponseModel {
  String? message;

  DeliveryDetailsCon1ResponseModel({
    this.message,
  });

  factory DeliveryDetailsCon1ResponseModel.fromJson(Map<String, dynamic> json) => DeliveryDetailsCon1ResponseModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}

