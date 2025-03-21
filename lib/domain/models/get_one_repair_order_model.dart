import 'dart:convert';

GetOneRepairOrderModel getOneRepairOrderModelFromJson(String str) =>
    GetOneRepairOrderModel.fromJson(json.decode(str));

String getOneRepairOrderModelToJson(GetOneRepairOrderModel data) =>
    json.encode(data.toJson());

class GetOneRepairOrderModel {
  String? message;
  GetOneRepairOrderData? data;
  int? status;
  bool? isSuccess;

  GetOneRepairOrderModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory GetOneRepairOrderModel.fromJson(Map<String, dynamic> json) =>
      GetOneRepairOrderModel(
        message: json["Message"],
        data: json["Data"] == null
            ? null
            : GetOneRepairOrderData.fromJson(json["Data"]),
        status: json["Status"],
        isSuccess: json["IsSuccess"],
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "Data": data?.toJson(),
        "Status": status,
        "IsSuccess": isSuccess,
      };
}

class GetOneRepairOrderData {
  String? id;
  String? user;
  String? orderNumber;
  String? file;
  String productname;
  String priority;
  String weight;
  String size;
  String? description;
  int? bagNumber;
  String? orderTracking;
  int? createTimestamp;
  DateTime? createdAt;

  GetOneRepairOrderData({
    this.id,
    this.user,
    this.orderNumber,
    this.file,
    required this.productname,
    required this.priority,
    required this.weight,
    required this.size,
    this.description,
    this.bagNumber,
    this.orderTracking,
    this.createTimestamp,
    this.createdAt,
  });

  factory GetOneRepairOrderData.fromJson(Map<String, dynamic> json) =>
      GetOneRepairOrderData(
        id: json["_id"],
        user: json["user"],
        orderNumber: json["order_number"],
        file: json["file"],
        productname: json["productname"],
        priority: json["priority"],
        weight: json["weight"],
        size: json["size"],
        description: json["description"],
        bagNumber: json["bag_number"],
        orderTracking: json["order_tracking"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "order_number": orderNumber,
        "file": file,
        "description": description,
        "productname": productname,
        "priority": priority,
        "weight": weight,
        "size": size,
        "bag_number": bagNumber,
        "order_tracking": orderTracking,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
      };
}
