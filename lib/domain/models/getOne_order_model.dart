// To parse this JSON data, do
//
//     final getOneOrderModel = getOneOrderModelFromJson(jsonString);

import 'dart:convert';

GetOneOrderModel getOneOrderModelFromJson(String str) =>
    GetOneOrderModel.fromJson(json.decode(str));

String getOneOrderModelToJson(GetOneOrderModel data) =>
    json.encode(data.toJson());

class GetOneOrderModel {
  String? message;
  GetOneOrderData? data;
  int? status;
  bool? isSuccess;

  GetOneOrderModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory GetOneOrderModel.fromJson(Map<String, dynamic> json) =>
      GetOneOrderModel(
        message: json["Message"],
        data: json["Data"] == null
            ? null
            : GetOneOrderData.fromJson(json["Data"]),
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

class GetOneOrderData {
  String? id;
  String? user;
  List<GetOneOrderProduct>? products;
  String? orderNo;
  num? totalQuantity;
  num? totalCartWeight;
  num? remainingTotalQuantity;
  num? totalBags;
  String? orderTracking;
  num? createTimestamp;
  DateTime? createdAt;
  DateTime? acceptedDate;
  num? acceptedTimestamp;
  DateTime? completedDate;
  num? completedTimestamp;

  String? invoiceUrl;

  GetOneOrderData({
    this.id,
    this.user,
    this.products,
    this.orderNo,
    this.totalQuantity,
    this.totalCartWeight,
    this.remainingTotalQuantity,
    this.totalBags,
    this.orderTracking,
    this.createTimestamp,
    this.createdAt,
    this.acceptedDate,
    this.acceptedTimestamp,
    this.completedDate,
    this.completedTimestamp,
    this.invoiceUrl,
  });

  factory GetOneOrderData.fromJson(Map<String, dynamic> json) =>
      GetOneOrderData(
        id: json["_id"],
        user: json["user"],
        products: json["products"] == null
            ? []
            : List<GetOneOrderProduct>.from(
                json["products"]!.map((x) => GetOneOrderProduct.fromJson(x))),
        orderNo: json["order_no"],
        totalQuantity: json["totalQuantity"],
        totalCartWeight: json["totalCartWeight"],
        remainingTotalQuantity: json["remainingTotalQuantity"],
        totalBags: json["totalBags"],
        orderTracking: json["order_tracking"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        acceptedDate: json["accepted_date"] == null
            ? null
            : DateTime.parse(json["accepted_date"]),
        acceptedTimestamp: json["accepted_timestamp"],
        completedDate: json["completed_date"] == null
            ? null
            : DateTime.parse(json["completed_date"]),
        completedTimestamp: json["completed_timestamp"],
        invoiceUrl: json["invoice_url"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "order_no": orderNo,
        "totalQuantity": totalQuantity,
        "totalCartWeight": totalCartWeight,
        "remainingTotalQuantity": remainingTotalQuantity,
        "totalBags": totalBags,
        "order_tracking": orderTracking,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
        if (acceptedDate != null)
          "accepted_date": acceptedDate?.toIso8601String(),
        if (acceptedTimestamp != null) "accepted_timestamp": acceptedTimestamp,
        if (invoiceUrl != null) "invoice_url": invoiceUrl,
        if (completedDate != null)
          "completed_date": completedDate?.toIso8601String(),
        if (completedTimestamp != null)
          "completed_timestamp": completedTimestamp,

        // "accepted_date": acceptedDate?.toIso8601String(),
        // "accepted_timestamp": acceptedTimestamp,
        // "invoice_url": invoiceUrl,
      };
}

class GetOneOrderProduct {
  String? categoryId;
  String? categoryName;
  String? productId;
  String? productName;
  String? productImage;
  String? productWeight;
  num? quantity;
  String? priority;
  String? weight;
  String? size;
  String? description;
  String? totalWeight;

  GetOneOrderProduct({
    this.categoryId,
    this.categoryName,
    this.productId,
    this.productName,
    this.productImage,
    this.productWeight,
    this.quantity,
    this.priority,
    this.weight,
    this.size,
    this.description,
    this.totalWeight,
  });

  factory GetOneOrderProduct.fromJson(Map<String, dynamic> json) =>
      GetOneOrderProduct(
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
        productId: json["productId"],
        productName: json["productName"],
        productImage: json["productImage"],
        productWeight: json["productWeight"],
        quantity: json["quantity"],
        priority: json["priority"],
        weight: json["weight"],
        size: json["size"],
        description: json["description"],
        totalWeight: json["totalWeight"],
      );

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "categoryName": categoryName,
        "productId": productId,
        "productName": productName,
        "productImage": productImage,
        "productWeight": productWeight,
        "quantity": quantity,
        "priority": priority,
        "weight": weight,
        "size": size,
        "description": description,
        "totalWeight": totalWeight,
      };
}
