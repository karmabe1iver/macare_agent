// To parse this JSON data, do
//
//     final historyResponseModel = historyResponseModelFromJson(jsonString);

import 'dart:convert';

List<HistoryResponseModel> historyResponseModelFromJson(String str) => List<HistoryResponseModel>.from(json.decode(str).map((x) => HistoryResponseModel.fromJson(x)));

String historyResponseModelToJson(List<HistoryResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HistoryResponseModel {
  bool? bookingReferenceSameCollectionAddress;
  String? bookingReferenceSampleType;
  String? bookingReferenceBillNumber;
  String? bookingReferenceBillAmount;
  dynamic bookingReferenceBookingDate;
  dynamic bookingReferenceBookingTime;
  String? bookingReferenceLaboratoryReferenceIdBranchName;
  String? bookingReferenceLaboratoryReferenceIdBranchAddress;

  HistoryResponseModel({
    this.bookingReferenceSameCollectionAddress,
    this.bookingReferenceSampleType,
    this.bookingReferenceBillNumber,
    this.bookingReferenceBillAmount,
    this.bookingReferenceBookingDate,
    this.bookingReferenceBookingTime,
    this.bookingReferenceLaboratoryReferenceIdBranchName,
    this.bookingReferenceLaboratoryReferenceIdBranchAddress,
  });

  factory HistoryResponseModel.fromJson(Map<String, dynamic> json) => HistoryResponseModel(
    bookingReferenceSameCollectionAddress: json["booking_reference__same_collection_address"],
    bookingReferenceSampleType: json["booking_reference__sample_type"],
    bookingReferenceBillNumber: json["booking_reference__bill_number"],
    bookingReferenceBillAmount: json["booking_reference__bill_amount"],
    bookingReferenceBookingDate: DateTime.parse(json["booking_reference__booking_date"]),
    bookingReferenceBookingTime: json["booking_reference__booking_time"],
    bookingReferenceLaboratoryReferenceIdBranchName: json["booking_reference__laboratory_reference_id__branch_name"],
    bookingReferenceLaboratoryReferenceIdBranchAddress: json["booking_reference__laboratory_reference_id__branch_address"],
  );

  Map<String, dynamic> toJson() => {
    "booking_reference__same_collection_address": bookingReferenceSameCollectionAddress,
    "booking_reference__sample_type": bookingReferenceSampleType,
    "booking_reference__bill_number": bookingReferenceBillNumber,
    "booking_reference__bill_amount": bookingReferenceBillAmount,
    "booking_reference__booking_date": "${bookingReferenceBookingDate?.year.toString().padLeft(4, '0')}-${bookingReferenceBookingDate!.month.toString().padLeft(2, '0')}-${bookingReferenceBookingDate!.day.toString().padLeft(2, '0')}",
    "booking_reference__booking_time": bookingReferenceBookingTime,
    "booking_reference__laboratory_reference_id__branch_name": bookingReferenceLaboratoryReferenceIdBranchName,
    "booking_reference__laboratory_reference_id__branch_address": bookingReferenceLaboratoryReferenceIdBranchAddress,
  };
}
