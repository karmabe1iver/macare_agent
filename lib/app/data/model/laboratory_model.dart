// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

List<LaboratoryResponseModel> laboratoryResponseModelFromJson(String str) => List<LaboratoryResponseModel>.from(json.decode(str).map((x) => LaboratoryResponseModel.fromJson(x)));

String laboratoryResponseModelToJson(List<LaboratoryResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LaboratoryResponseModel {
  String? allocationStatus;
  String? agentUpdateReference;
  String? laboratoryName;
  String? laboratoryAddress;
  String? laboratoryContact;
  dynamic latitude;
  dynamic longitude;
  dynamic laboratoryBookingTime;
  dynamic laboratoryBookingAllocation;
  String? laboratorySampleType;
  dynamic laboratoryBookingDate;
  String? bRef;
  String? lbReference;
  String? customerNameForCollection;
  String? customerAddressForCollection;
  dynamic customerPhoneForCollection;
  dynamic customerEmailForCollection;
  String?customerNearestLandmark;
  dynamic customerLatitude;
  dynamic customerLongitude;
  String? customerNameBookedBy;
  String? customerAddressBookedBy;
  String? customerPhoneBookedBy;
  String? customerEmailBookedBy;

  LaboratoryResponseModel({
    this.allocationStatus,
    this.agentUpdateReference,
    this.laboratoryName,
    this.laboratoryAddress,
    this.laboratoryContact,
    this.latitude,
    this.longitude,
    this.laboratoryBookingTime,
    this.laboratoryBookingAllocation,
    this.laboratorySampleType,
    this.laboratoryBookingDate,
    this.bRef,
    this.lbReference,
    this.customerNameForCollection,
    this.customerAddressForCollection,
    this.customerPhoneForCollection,
    this.customerEmailForCollection,
    this.customerNearestLandmark,
    this.customerLatitude,
    this.customerLongitude,
    this.customerNameBookedBy,
    this.customerAddressBookedBy,
    this.customerPhoneBookedBy,
    this.customerEmailBookedBy,
  });

  factory LaboratoryResponseModel.fromJson(Map<String, dynamic> json) => LaboratoryResponseModel(
    allocationStatus: json["allocation_status"],
    agentUpdateReference: json["agent_update_reference"],
    laboratoryName: json["laboratory_name"],
    laboratoryAddress: json["laboratory_address"],
    laboratoryContact: json["laboratory_contact"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    laboratoryBookingTime: json["laboratory_booking_time"],
    laboratoryBookingAllocation: json["laboratory_booking_allocation"],
    laboratorySampleType: json["laboratory_sample_type"],
    laboratoryBookingDate: json["laboratory_booking_date"],
    bRef: json["b_ref"],
    lbReference: json["lb_reference"],
    customerNameForCollection: json["customer_name_for_collection"],
    customerAddressForCollection: json["customer_address_for_collection"],
    customerPhoneForCollection: json["customer_phone_for_collection"],
    customerEmailForCollection: json["customer_email_for_collection"],
    customerNearestLandmark: json["customer_nearest_landmark"],
    customerLatitude: json["customer_latitude"],
    customerLongitude: json["customer_longitude"],
    customerNameBookedBy: json["customer_name_booked_by"],
    customerAddressBookedBy: json["customer_address_booked_by"],
    customerPhoneBookedBy: json["customer_phone_booked_by"],
    customerEmailBookedBy: json["customer_email_booked_by"],
  );

  Map<String, dynamic> toJson() => {
    "allocation_status": allocationStatus,
    "agent_update_reference": agentUpdateReference,
    "laboratory_name": laboratoryName,
    "laboratory_address": laboratoryAddress,
    "laboratory_contact": laboratoryContact,
    "latitude": latitude,
    "longitude": longitude,
    "laboratory_booking_time": laboratoryBookingTime,
    "laboratory_booking_allocation": laboratoryBookingAllocation,
    "laboratory_sample_type": laboratorySampleType,
    "laboratory_booking_date": laboratoryBookingDate,
    "b_ref": bRef,
    "lb_reference": lbReference,
    "customer_name_for_collection": customerNameForCollection,
    "customer_address_for_collection": customerAddressForCollection,
    "customer_phone_for_collection": customerPhoneForCollection,
    "customer_email_for_collection": customerEmailForCollection,
    "customer_nearest_landmark": customerNearestLandmark,
    "customer_latitude": customerLatitude,
    "customer_longitude": customerLongitude,
    "customer_name_booked_by": customerNameBookedBy,
    "customer_address_booked_by": customerAddressBookedBy,
    "customer_phone_booked_by": customerPhoneBookedBy,
    "customer_email_booked_by": customerEmailBookedBy,
  };
}

