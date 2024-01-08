// To parse this JSON data, do
//
//     final deliveryResponseModel = deliveryResponseModelFromJson(jsonString);

import 'dart:convert';

List<DeliveryResponseModel> deliveryResponseModelFromJson(String str) => List<DeliveryResponseModel>.from(json.decode(str).map((x) => DeliveryResponseModel.fromJson(x)));

String deliveryResponseModelToJson(List<DeliveryResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DeliveryResponseModel {
  String? allocationReference;
  String? allocationStatus;
  dynamic? orderReference;
  dynamic? orderDate;
  int? orderAmount;
  String? orderStatus;
  List<PharmacyInfo>? pharmacyInfo;
  List<OrderItem>? orderItems;
  List<PrescriptionInfo>? prescriptionInfo;
  List<DeliveryDetail>? deliveryDetails;
  String? type;
  String? prescriptionReference;

  DeliveryResponseModel({
    this.allocationReference,
    this.allocationStatus,
    this.orderReference,
    this.orderDate,
    this.orderAmount,
    this.orderStatus,
    this.pharmacyInfo,
    this.orderItems,
    this.prescriptionInfo,
    this.deliveryDetails,
    this.type,
    this.prescriptionReference,
  });

  factory DeliveryResponseModel.fromJson(Map<String, dynamic> json) => DeliveryResponseModel(
    allocationReference: json["allocation_reference"],
    allocationStatus: json["allocation_status"],
    orderReference: json["order_reference"],
    orderDate: json["order_date"],
    orderAmount: json["order_amount"],
    orderStatus: json["order_status"],
    pharmacyInfo: List<PharmacyInfo>.from(json["pharmacy_info"].map((x) => PharmacyInfo.fromJson(x))),
    orderItems: List<OrderItem>.from(json["order_items"].map((x) => OrderItem.fromJson(x))),
    prescriptionInfo: List<PrescriptionInfo>.from(json["prescription_info"].map((x) => PrescriptionInfo.fromJson(x))),
    deliveryDetails: List<DeliveryDetail>.from(json["delivery_details"].map((x) => DeliveryDetail.fromJson(x))),
    type: json["type"],
    prescriptionReference: json["prescription_reference"],
  );

  Map<String, dynamic> toJson() => {
    "allocation_reference": allocationReference,
    "allocation_status": allocationStatus,
    "order_reference": orderReference,
    "order_date": orderDate,
    "order_amount": orderAmount,
    "order_status": orderStatus,
    "pharmacy_info": List<dynamic>.from(pharmacyInfo!.map((x) => x.toJson())),
    "order_items": List<dynamic>.from(orderItems!.map((x) => x.toJson())),
    "prescription_info": List<dynamic>.from(prescriptionInfo!.map((x) => x.toJson())),
    "delivery_details": List<dynamic>.from(deliveryDetails!.map((x) => x.toJson())),
    "type": type,
    "prescription_reference": prescriptionReference,
  };
}

class DeliveryDetail {
  String? id;
  String? customerName;
  String? customerAddress;
  String? customerPhone;
  String? customerNearestLandmark;
  String? customerLatitude;
  String? customerLongitude;
  String? pinCode;
  bool? deleteStatus;
  DateTime? createdOn;
  String? customerReference;
  String? branchReference;

  DeliveryDetail({
    this.id,
    this.customerName,
    this.customerAddress,
    this.customerPhone,
    this.customerNearestLandmark,
    this.customerLatitude,
    this.customerLongitude,
    this.pinCode,
    this.deleteStatus,
    this.createdOn,
    this.customerReference,
    this.branchReference,
  });

  factory DeliveryDetail.fromJson(Map<String, dynamic> json) => DeliveryDetail(
    id: json["id"],
    customerName: json["customer_name"],
    customerAddress: json["customer_address"],
    customerPhone: json["customer_phone"],
    customerNearestLandmark: json["customer_nearest_landmark"],
    customerLatitude: json["customer_latitude"],
    customerLongitude: json["customer_longitude"],
    pinCode: json["pin_code"],
    deleteStatus: json["delete_status"],
    createdOn: DateTime.parse(json["created_on"]),
    customerReference: json["customer_reference"],
    branchReference: json["branch_reference"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_name": customerName,
    "customer_address": customerAddress,
    "customer_phone": customerPhone,
    "customer_nearest_landmark": customerNearestLandmark,
    "customer_latitude": customerLatitude,
    "customer_longitude": customerLongitude,
    "pin_code": pinCode,
    "delete_status": deleteStatus,
    "created_on": createdOn!.toIso8601String(),
    "customer_reference": customerReference,
    "branch_reference": branchReference,
  };
}

class OrderItem {
  String? id;
  String? productName;
  double? productPrice;
  String? productStock;
  dynamic
  productOfferPercentage;
  double? productOfferPrice;
  String? maxAllowedSellingQuantity;
  String? productImage;
  String? manufacturerName;
  bool? deleteStatus;
  String? listingPriority;
  ProductType? productType;
  dynamic createdOn;
  String? branchReference;
  String? quantity;

  OrderItem({
    this.id,
    this.productName,
    this.productPrice,
    this.productStock,
    this.productOfferPercentage,
    this.productOfferPrice,
    this.maxAllowedSellingQuantity,
    this.productImage,
    this.manufacturerName,
    this.deleteStatus,
    this.listingPriority,
    this.productType,
    this.createdOn,
    this.branchReference,
    this.quantity,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    id: json["id"],
    productName: json["product_name"],
    productPrice: json["product_price"].toDouble(),
    productStock: json["product_stock"],
    productOfferPercentage: json["product_offer_percentage"],
    productOfferPrice: json["product_offer_price"].toDouble(),
    maxAllowedSellingQuantity: json["max_allowed_selling_quantity"],
    productImage: json["product_image"],
    manufacturerName: json["manufacturer_name"],
    deleteStatus: json["delete_status"],
    listingPriority: json["listing_priority"],
    productType: productTypeValues.map[json["product_type"]],
    createdOn: DateTime.parse(json["created_on"]),
    branchReference: json["branch_reference"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_name": productName,
    "product_price": productPrice,
    "product_stock": productStock,
    "product_offer_percentage": productOfferPercentage,
    "product_offer_price": productOfferPrice,
    "max_allowed_selling_quantity": maxAllowedSellingQuantity,
    "product_image": productImage,
    "manufacturer_name": manufacturerName,
    "delete_status": deleteStatus,
    "listing_priority": listingPriority,
    "product_type": productTypeValues.reverse[productType],
    "created_on": createdOn,
    "branch_reference": branchReference,
    "quantity": quantity,
  };
}

enum ProductType {
  OPTICAL,
  OTC
}

final productTypeValues = EnumValues({
  "optical": ProductType.OPTICAL,
  "otc": ProductType.OTC
});

class PharmacyInfo {
  String? branchName;
  String? id;

  PharmacyInfo({
    this.branchName,
    this.id,
  });

  factory PharmacyInfo.fromJson(Map<String, dynamic> json) => PharmacyInfo(
    branchName: json["branch_name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "branch_name": branchName,
    "id": id,
  };
}

class PrescriptionInfo {
  String? id;
  String? descriptions;
  String? prescriptionFile;
  bool? deleteStatus;
  String? status;
  String? reason;
  String? billNumber;
  String? billAmount;
  String? paymentMethod;
  DateTime? createdOn;
  String? customerReference;
  String? pharmacyReference;
  String? deliveryAddressReference;

  PrescriptionInfo({
    this.id,
    this.descriptions,
    this.prescriptionFile,
    this.deleteStatus,
    this.status,
    this.reason,
    this.billNumber,
    this.billAmount,
    this.paymentMethod,
    this.createdOn,
    this.customerReference,
    this.pharmacyReference,
    this.deliveryAddressReference,
  });

  factory PrescriptionInfo.fromJson(Map<String, dynamic> json) => PrescriptionInfo(
    id: json["id"],
    descriptions: json["descriptions"],
    prescriptionFile: json["prescription_file"],
    deleteStatus: json["delete_status"],
    status: json["status"],
    reason: json["reason"],
    billNumber: json["bill_number"],
    billAmount: json["bill_amount"],
    paymentMethod: json["payment_method"],
    createdOn: DateTime.parse(json["created_on"]),
    customerReference: json["customer_reference"],
    pharmacyReference: json["pharmacy_reference"],
    deliveryAddressReference: json["delivery_address_reference"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "descriptions": descriptions,
    "prescription_file": prescriptionFile,
    "delete_status": deleteStatus,
    "status": status,
    "reason": reason,
    "bill_number": billNumber,
    "bill_amount": billAmount,
    "payment_method": paymentMethod,
    "created_on": createdOn!.toIso8601String(),
    "customer_reference": customerReference,
    "pharmacy_reference": pharmacyReference,
    "delivery_address_reference": deliveryAddressReference,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
