import 'dart:convert';

OrderDetailModel orderDetailModelFromJson(String str) =>
    OrderDetailModel.fromJson(json.decode(str));

String orderDetailModelToJson(OrderDetailModel data) =>
    json.encode(data.toJson());

class OrderDetailModel {
  String? message;
  Data? data;
  int? status;
  bool? isSuccess;

  OrderDetailModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailModel(
        message: json["Message"],
        data: json["Data"] == null ? null : Data.fromJson(json["Data"]),
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

class Data {
  List<Doc>? docs;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  dynamic nextPage;

  Data({
    this.docs,
    this.totalDocs,
    this.limit,
    this.totalPages,
    this.page,
    this.pagingCounter,
    this.hasPrevPage,
    this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        docs: json["docs"] == null
            ? []
            : List<Doc>.from(json["docs"]!.map((x) => Doc.fromJson(x))),
        totalDocs: json["totalDocs"],
        limit: json["limit"],
        totalPages: json["totalPages"],
        page: json["page"],
        pagingCounter: json["pagingCounter"],
        hasPrevPage: json["hasPrevPage"],
        hasNextPage: json["hasNextPage"],
        prevPage: json["prevPage"],
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
        "docs": docs == null
            ? []
            : List<dynamic>.from(docs!.map((x) => x.toJson())),
        "totalDocs": totalDocs,
        "limit": limit,
        "totalPages": totalPages,
        "page": page,
        "pagingCounter": pagingCounter,
        "hasPrevPage": hasPrevPage,
        "hasNextPage": hasNextPage,
        "prevPage": prevPage,
        "nextPage": nextPage,
      };
}

class Doc {
  String? id;
  String? user;
  List<Product>? products;
  int? totalQuantity;
  int? totalBags;
  String? orderTracking;
  int? createTimestamp;
  DateTime? createdAt;
  String? docId;

  Doc({
    this.id,
    this.user,
    this.products,
    this.totalQuantity,
    this.totalBags,
    this.orderTracking,
    this.createTimestamp,
    this.createdAt,
    this.docId,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        id: json["_id"],
        user: json["user"],
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
        totalQuantity: json["totalQuantity"],
        totalBags: json["totalBags"],
        orderTracking: json["order_tracking"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        docId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "totalQuantity": totalQuantity,
        "totalBags": totalBags,
        "order_tracking": orderTracking,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
        "id": docId,
      };
}

class Product {
  String? categoryId;
  String? categoryName;
  String? productId;
  String? productName;
  String? productImage;
  String? productWeight;
  int? quantity;
  int? remainingQuantity;
  String? description;
  String? manufactureid;
  String? productOrderTracking;

  Product({
    this.categoryId,
    this.categoryName,
    this.productId,
    this.productName,
    this.productImage,
    this.productWeight,
    this.quantity,
    this.remainingQuantity,
    this.description,
    this.manufactureid,
    this.productOrderTracking,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
        productId: json["productId"],
        productName: json["productName"],
        productImage: json["productImage"],
        productWeight: json["productWeight"],
        quantity: json["quantity"],
        remainingQuantity: json["remaining_quantity"],
        description: json["description"],
        manufactureid: json["manufactureid"],
        productOrderTracking: json["product_order_tracking"],
      );

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "categoryName": categoryName,
        "productId": productId,
        "productName": productName,
        "productImage": productImage,
        "productWeight": productWeight,
        "quantity": quantity,
        "remaining_quantity": remainingQuantity,
        "description": description,
        "manufactureid": manufactureid,
        "product_order_tracking": productOrderTracking,
      };
}
