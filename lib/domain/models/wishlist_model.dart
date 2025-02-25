import 'dart:convert';

// WishlistModel wishlistModelFromJson(String str) =>
//     WishlistModel.fromJson(json.decode(str));

class WishlistModel {
  String? message;
  WishlistData? data;
  int? status;
  bool? isSuccess;

  WishlistModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  // factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
  //       message: json["Message"],
  //       data: json["Data"] == null || json["Data"] == 0 ? null : WishlistData.fromJson(json["Data"]),
  //       status: json["Status"],
  //       isSuccess: json["IsSuccess"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "Message": message,
  //       "Data": data?.toJson(),
  //       "Status": status,
  //       "IsSuccess": isSuccess,
  //     };
}

class WishlistData {
  List<WishlistDoc>? docs;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  dynamic nextPage;

  WishlistData({
    this.docs,
    this.totalDocs,
    this.limit,
    this.totalPages,
    this.page,
    this.hasPrevPage,
    this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });

  // factory WishlistData.fromJson(Map<String, dynamic> json) => WishlistData(
  //       docs: json["docs"] == null
  //           ? []
  //           : List<WishlistDoc>.from(
  //               json["docs"]!.map((x) => WishlistDoc.fromJson(x))),
  //       totalDocs: json["totalDocs"],
  //       limit: json["limit"],
  //       totalPages: json["totalPages"],
  //       page: json["page"],
  //       hasPrevPage: json["hasPrevPage"],
  //       hasNextPage: json["hasNextPage"],
  //       prevPage: json["prevPage"],
  //       nextPage: json["nextPage"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "docs": docs == null
  //           ? []
  //           : List<dynamic>.from(docs!.map((x) => x.toJson())),
  //       "totalDocs": totalDocs,
  //       "limit": limit,
  //       "totalPages": totalPages,
  //       "page": page,
  //       "hasPrevPage": hasPrevPage,
  //       "hasNextPage": hasNextPage,
  //       "prevPage": prevPage,
  //       "nextPage": nextPage,
  //     };
}

class WishlistDoc {
  String? id;
  WishlistProductid? productid;
  bool? status;
  bool? isDeleted;
  String? createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  bool? inCart;

  WishlistDoc({
    this.id,
    this.productid,
    this.status,
    this.isDeleted,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.inCart,
  });

  // factory WishlistDoc.fromJson(Map<String, dynamic> json) => WishlistDoc(
  //       id: json["_id"],
  //       productid: json["productid"] == null
  //           ? null
  //           : WishlistProductid.fromJson(json["productid"]),
  //       status: json["status"],
  //       isDeleted: json["isDeleted"],
  //       createdBy: json["createdBy"],
  //       updatedBy: json["updatedBy"],
  //       createdAt: json["createdAt"] == null
  //           ? null
  //           : DateTime.parse(json["createdAt"]),
  //       updatedAt: json["updatedAt"] == null
  //           ? null
  //           : DateTime.parse(json["updatedAt"]),
  //       v: json["__v"],
  //       inCart: json["in_cart"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "_id": id,
  //       "productid": productid?.toJson(),
  //       "status": status,
  //       "isDeleted": isDeleted,
  //       "createdBy": createdBy,
  //       "updatedBy": updatedBy,
  //       "createdAt": createdAt?.toIso8601String(),
  //       "updatedAt": updatedAt?.toIso8601String(),
  //       "__v": v,
  //       "in_cart": inCart,
  //     };
}

class WishlistProductid {
  String? id;
  String? category;
  String? name;
  num? weight;
  String? image;
  bool? status;
  int? createTimestamp;
  bool? isDeleted;
  String? createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int quantity;

  WishlistProductid({
    this.id,
    this.category,
    this.name,
    this.weight,
    this.image,
    this.status,
    this.createTimestamp,
    this.isDeleted,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.quantity = 0,
  });

  // factory WishlistProductid.fromJson(Map<String, dynamic> json) =>
  //     WishlistProductid(
  //       id: json["_id"],
  //       category: json["category"],
  //       name: json["name"],
  //       weight: json["weight"],
  //       image: json["image"],
  //       status: json["status"],
  //       createTimestamp: json["create_timestamp"],
  //       isDeleted: json["isDeleted"],
  //       createdBy: json["createdBy"],
  //       updatedBy: json["updatedBy"],
  //       createdAt: json["createdAt"] == null
  //           ? null
  //           : DateTime.parse(json["createdAt"]),
  //       updatedAt: json["updatedAt"] == null
  //           ? null
  //           : DateTime.parse(json["updatedAt"]),
  //       v: json["__v"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "_id": id,
  //       "category": category,
  //       "name": name,
  //       "weight": weight,
  //       "image": image,
  //       "status": status,
  //       "create_timestamp": createTimestamp,
  //       "isDeleted": isDeleted,
  //       "createdBy": createdBy,
  //       "updatedBy": updatedBy,
  //       "createdAt": createdAt?.toIso8601String(),
  //       "updatedAt": updatedAt?.toIso8601String(),
  //       "__v": v,
  //     };
}
