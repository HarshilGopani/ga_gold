import 'dart:convert';

GetOneBagModel getOneBagModelFromJson(String str) =>
    GetOneBagModel.fromJson(json.decode(str));

String getOneBagModelToJson(GetOneBagModel data) => json.encode(data.toJson());

class GetOneBagModel {
  String? message;
  GetOneBagData? data;
  int? status;
  bool? isSuccess;

  GetOneBagModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory GetOneBagModel.fromJson(Map<String, dynamic> json) => GetOneBagModel(
        message: json["Message"],
        data:
            json["Data"] == null ? null : GetOneBagData.fromJson(json["Data"]),
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

class GetOneBagData {
  String? id;
  String? order;
  int? bagNumber;
  String? categoryId;
  String? categoryName;
  List<GetOneBagProduct>? products;
  String? bagDescription;
  int? totalQuantityInBag;
  DateTime? deliveryDate;
  int? deliveryTimestamp;
  bool? status;
  int? createTimestamp;
  DateTime? createdAt;

  GetOneBagData({
    this.id,
    this.order,
    this.bagNumber,
    this.categoryId,
    this.categoryName,
    this.products,
    this.bagDescription,
    this.totalQuantityInBag,
    this.deliveryDate,
    this.deliveryTimestamp,
    this.status,
    this.createTimestamp,
    this.createdAt,
  });

  factory GetOneBagData.fromJson(Map<String, dynamic> json) => GetOneBagData(
        id: json["_id"],
        order: json["order"],
        bagNumber: json["bag_number"],
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
        products: json["products"] == null
            ? []
            : List<GetOneBagProduct>.from(
                json["products"]!.map((x) => GetOneBagProduct.fromJson(x))),
        bagDescription: json["bagDescription"],
        totalQuantityInBag: json["totalQuantityInBag"],
        deliveryDate: json["delivery_date"] == null
            ? null
            : DateTime.parse(json["delivery_date"]),
        deliveryTimestamp: json["deliveryTimestamp"],
        status: json["status"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "order": order,
        "bag_number": bagNumber,
        "categoryId": categoryId,
        "categoryName": categoryName,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "bagDescription": bagDescription,
        "totalQuantityInBag": totalQuantityInBag,
        "delivery_date":
            "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
        "deliveryTimestamp": deliveryTimestamp,
        "status": status,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
      };
}

class GetOneBagProduct {
  String? productId;
  String? name;
  String? image;
  String? weight;
  int? bagQuantity;

  GetOneBagProduct({
    this.productId,
    this.name,
    this.image,
    this.weight,
    this.bagQuantity,
  });

  factory GetOneBagProduct.fromJson(Map<String, dynamic> json) =>
      GetOneBagProduct(
        productId: json["productId"],
        name: json["name"],
        image: json["image"],
        weight: json["weight"],
        bagQuantity: json["bag_quantity"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "name": name,
        "image": image,
        "weight": weight,
        "bag_quantity": bagQuantity,
      };
}
