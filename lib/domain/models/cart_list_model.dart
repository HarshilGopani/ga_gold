import 'dart:convert';

import 'package:flutter/cupertino.dart';

CartItemModel cartItemModelFromJson(String str) =>
    CartItemModel.fromJson(json.decode(str));

String cartItemModelToJson(CartItemModel data) => json.encode(data.toJson());

class CartItemModel {
  String? message;
  CartItemData? data;
  int? status;
  bool? isSuccess;

  CartItemModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        message: json["Message"],
        data: json["Data"] == null || json["Data"] == 0
            ? null
            : CartItemData.fromJson(json["Data"]),
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

class CartItemData {
  String? id;
  List<CartItemProductElement>? products;
  int? totalQuantity;

  CartItemData({
    this.id,
    this.products,
    this.totalQuantity,
  });

  factory CartItemData.fromJson(Map<String, dynamic> json) => CartItemData(
        id: json["_id"],
        products: json["products"] == null
            ? []
            : List<CartItemProductElement>.from(json["products"]!
                .map((x) => CartItemProductElement.fromJson(x))),
        totalQuantity: json["totalQuantity"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "totalQuantity": totalQuantity,
      };
}

class CartItemProductElement {
  CartItemProductProduct? product;
  Category? category;
  int quantity;
  String? description;
  String? priority;
  String? weight;
  String? size;
  TextEditingController? tcGoldPurity;
  TextEditingController? tcWeight ;
  TextEditingController? tcSize ;

  CartItemProductElement(
      {this.product,
      this.category,
      this.quantity = 0,
      this.description,
      this.weight,
      this.size,
      this.priority,
      this.tcGoldPurity,
       this.tcSize,
       this.tcWeight});

  factory CartItemProductElement.fromJson(Map<String, dynamic> json) =>
      CartItemProductElement(
        product: json["product"] == null
            ? null
            : CartItemProductProduct.fromJson(json["product"]),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        quantity: json["quantity"],
        description: json["description"],
        priority: json["priority"],
        size: json["size"],
        weight: json["weight"],
        tcGoldPurity: json["tcGoldPurity"],
        tcSize: json["tcSize"],
        tcWeight: json["tcWeight"],
      );

  Map<String, dynamic> toJson() => {
        "product": product?.toJson(),
        "category": category?.toJson(),
        "quantity": quantity,
        "description": description,
        "priority": priority,
        "size": size,
        "weight": weight,
        "tcGoldPurity": tcGoldPurity,
        "tcSize": tcSize,
        "tcWeight": tcWeight,
      };
}

class Category {
  String? id;
  String? name;
  bool? status;
  int? createTimestamp;
  DateTime? createdAt;

  Category({
    this.id,
    this.name,
    this.status,
    this.createTimestamp,
    this.createdAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["name"],
        status: json["status"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "status": status,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
      };
}

class CartItemProductProduct {
  String? id;
  String? category;
  String? name;
  double? weight;
  String? image;
  bool? status;
  int? createTimestamp;
  DateTime? createdAt;

  CartItemProductProduct({
    this.id,
    this.category,
    this.name,
    this.weight,
    this.image,
    this.status,
    this.createTimestamp,
    this.createdAt,
  });

  factory CartItemProductProduct.fromJson(Map<String, dynamic> json) =>
      CartItemProductProduct(
        id: json["_id"],
        category: json["category"],
        name: json["name"],
        weight: json["weight"]?.toDouble(),
        image: json["image"],
        status: json["status"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "category": category,
        "name": name,
        "weight": weight,
        "image": image,
        "status": status,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
      };
}

class Product {
  String? productId;
  int? quantity;
  String? description;
  String? priority;
  String? weight;
  String? size;

  Product(
      {this.productId,
      this.quantity,
      this.description,
      this.weight,
      this.size,
      this.priority});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"],
        quantity: json["quantity"],
        priority: json["priority"],
        weight: json["weight"],
        size: json["size"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
        "priority": priority,
        "weight": weight,
        "size": size,
        "description": description,
      };
}
