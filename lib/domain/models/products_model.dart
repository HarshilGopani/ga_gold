// ProductsModel productsModelFromJson(String str) =>
//     ProductsModel.fromJson(json.decode(str));

class ProductsModel {
  String? message;
  ProductsData? data;
  int? status;
  bool? isSuccess;

  ProductsModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  // factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
  //       message: json["Message"],
  //       data: json["Data"] == null || json["Data"] == 0
  //           ? null
  //           : ProductsData.fromJson(json["Data"]),
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

class ProductsData {
  List<ProductsDoc>? docs;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  int? nextPage;

  ProductsData({
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

  // factory ProductsData.fromJson(Map<String, dynamic> json) => ProductsData(
  //       docs: json["docs"] == null
  //           ? []
  //           : List<ProductsDoc>.from(
  //               json["docs"]!.map((x) => ProductsDoc.fromJson(x))),
  //       totalDocs: json["totalDocs"],
  //       limit: json["limit"],
  //       totalPages: json["totalPages"],
  //       page: json["page"],
  //       pagingCounter: json["pagingCounter"],
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
  //       "pagingCounter": pagingCounter,
  //       "hasPrevPage": hasPrevPage,
  //       "hasNextPage": hasNextPage,
  //       "prevPage": prevPage,
  //       "nextPage": nextPage,
  //     };
}

class ProductsDoc {
  String? id;
  ProductsCategory? category;
  String? name;
  num? weight;
  int? quantity;
  List<String>? productType;
  String? image;
  bool? status;
  int? createTimestamp;
  DateTime? createdAt;
  String? docId;
  bool? inCart;
  int cartQuantity;
  bool? wishlistStatus;

  ProductsDoc({
    this.id,
    this.category,
    this.name,
    this.weight,
    this.quantity,
    this.productType,
    this.image,
    this.status,
    this.createTimestamp,
    this.createdAt,
    this.docId,
    this.inCart,
    this.cartQuantity = 0,
    this.wishlistStatus,
  });

  // factory ProductsDoc.fromJson(Map<String, dynamic> json) => ProductsDoc(
  //       id: json["_id"],
  //       category: json["category"] == null
  //           ? null
  //           : ProductsCategory.fromJson(json["category"]),
  //       name: json["name"],
  //       weight: json["weight"],
  //       quantity: json["quantity"],
  //       productType: json["productType"] == null
  //           ? []
  //           : List<String>.from(json["productType"]!.map((x) => x)),
  //       image: json["image"],
  //       status: json["status"],
  //       createTimestamp: json["create_timestamp"],
  //       createdAt: json["createdAt"] == null
  //           ? null
  //           : DateTime.parse(json["createdAt"]),
  //       docId: json["id"],
  //       inCart: json["in_cart"],
  //       cartQuantity: json["cartquantity"],
  //       wishlistStatus: json["wishlist_status"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "_id": id,
  //       "category": category?.toJson(),
  //       "name": name,
  //       "weight": weight,
  //       "quantity": quantity,
  //       "productType": productType == null
  //           ? []
  //           : List<dynamic>.from(productType!.map((x) => x)),
  //       "image": image,
  //       "status": status,
  //       "create_timestamp": createTimestamp,
  //       "createdAt": createdAt?.toIso8601String(),
  //       "id": docId,
  //       "in_cart": inCart,
  //       "cartquantity": cartQuantity,
  //       "wishlist_status": wishlistStatus,
  //     };
}

class ProductsCategory {
  String? id;
  String? name;
  bool? status;
  int? createTimestamp;
  DateTime? createdAt;

  ProductsCategory({
    this.id,
    this.name,
    this.status,
    this.createTimestamp,
    this.createdAt,
  });

  // factory ProductsCategory.fromJson(Map<String, dynamic> json) =>
  //     ProductsCategory(
  //       id: json["_id"],
  //       name: json["name"],
  //       status: json["status"],
  //       createTimestamp: json["create_timestamp"],
  //       createdAt: json["createdAt"] == null
  //           ? null
  //           : DateTime.parse(json["createdAt"]),
  //     );

  // Map<String, dynamic> toJson() => {
  //       "_id": id,
  //       "name": name,
  //       "status": status,
  //       "create_timestamp": createTimestamp,
  //       "createdAt": createdAt?.toIso8601String(),
  //     };
}
