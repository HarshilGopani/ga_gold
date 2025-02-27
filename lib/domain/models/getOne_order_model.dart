// GetOneOrderModel getOneOrderModelFromJson(String str) =>
//     GetOneOrderModel.fromJson(json.decode(str));

// String getOneOrderModelToJson(GetOneOrderModel data) =>
//     json.encode(data.toJson());

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

// factory GetOneOrderModel.fromJson(Map<String, dynamic> json) =>
//     GetOneOrderModel(
//       message: json["Message"],
//       data: json["Data"] == null
//           ? null
//           : GetOneOrderData.fromJson(json["Data"]),
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

class GetOneOrderData {
  String? id;
  String? user;
  List<DataProduct>? products;
  String? mainDescription;
  int? totalQuantity;
  int? remainingTotalQuantity;
  int? totalBags;
  String? orderTracking;
  int? createTimestamp;
  DateTime? createdAt;
  List<Bag>? bags;

  GetOneOrderData({
    this.id,
    this.user,
    this.products,
    this.mainDescription,
    this.totalQuantity,
    this.remainingTotalQuantity,
    this.totalBags,
    this.orderTracking,
    this.createTimestamp,
    this.createdAt,
    this.bags,
  });

// factory GetOneOrderData.fromJson(Map<String, dynamic> json) =>
//     GetOneOrderData(
//       id: json["_id"],
//       user: json["user"],
//       products: json["products"] == null
//           ? []
//           : List<DataProduct>.from(
//               json["products"]!.map((x) => DataProduct.fromJson(x))),
//       mainDescription: json["main_description"],
//       totalQuantity: json["totalQuantity"],
//       remainingTotalQuantity: json["remainingTotalQuantity"],
//       totalBags: json["totalBags"],
//       orderTracking: json["order_tracking"],
//       createTimestamp: json["create_timestamp"],
//       createdAt: json["createdAt"] == null
//           ? null
//           : DateTime.parse(json["createdAt"]),
//       bags: json["bags"] == null
//           ? []
//           : List<Bag>.from(json["bags"]!.map((x) => Bag.fromJson(x))),
//     );

// Map<String, dynamic> toJson() => {
//       "_id": id,
//       "user": user,
//       "products": products == null
//           ? []
//           : List<dynamic>.from(products!.map((x) => x.toJson())),
//       "main_description": mainDescription,
//       "totalQuantity": totalQuantity,
//       "remainingTotalQuantity": remainingTotalQuantity,
//       "totalBags": totalBags,
//       "order_tracking": orderTracking,
//       "create_timestamp": createTimestamp,
//       "createdAt": createdAt?.toIso8601String(),
//       "bags": bags == null
//           ? []
//           : List<dynamic>.from(bags!.map((x) => x.toJson())),
//     };
}

class Bag {
  String? id;
  String? order;
  int? bagNumber;
  String? categoryId;
  String? categoryName;
  List<GetOneOrderBagProduct>? products;
  String? bagDescription;
  int? totalQuantityInBag;
  DateTime? deliveryDate;
  int? deliveryTimestamp;
  bool? status;
  int? createTimestamp;
  DateTime? createdAt;

  Bag({
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

// factory Bag.fromJson(Map<String, dynamic> json) => Bag(
//       id: json["_id"],
//       order: json["order"],
//       bagNumber: json["bag_number"],
//       categoryId: json["categoryId"],
//       categoryName: json["categoryName"],
//       products: json["products"] == null
//           ? []
//           : List<GetOneOrderBagProduct>.from(json["products"]!
//               .map((x) => GetOneOrderBagProduct.fromJson(x))),
//       bagDescription: json["bagDescription"],
//       totalQuantityInBag: json["totalQuantityInBag"],
//       deliveryDate: json["delivery_date"] == null
//           ? null
//           : DateTime.parse(json["delivery_date"]),
//       deliveryTimestamp: json["deliveryTimestamp"],
//       status: json["status"],
//       createTimestamp: json["create_timestamp"],
//       createdAt: json["createdAt"] == null
//           ? null
//           : DateTime.parse(json["createdAt"]),
//     );

// Map<String, dynamic> toJson() => {
//       "_id": id,
//       "order": order,
//       "bag_number": bagNumber,
//       "categoryId": categoryId,
//       "categoryName": categoryName,
//       "products": products == null
//           ? []
//           : List<dynamic>.from(products!.map((x) => x.toJson())),
//       "bagDescription": bagDescription,
//       "totalQuantityInBag": totalQuantityInBag,
//       "delivery_date":
//           "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
//       "deliveryTimestamp": deliveryTimestamp,
//       "status": status,
//       "create_timestamp": createTimestamp,
//       "createdAt": createdAt?.toIso8601String(),
//     };
}

class GetOneOrderBagProduct {
  String? productId;
  String? name;
  String? image;
  String? weight;
  int? bagQuantity;

  GetOneOrderBagProduct({
    this.productId,
    this.name,
    this.image,
    this.weight,
    this.bagQuantity,
  });

// factory GetOneOrderBagProduct.fromJson(Map<String, dynamic> json) =>
//     GetOneOrderBagProduct(
//       productId: json["productId"],
//       name: json["name"],
//       image: json["image"],
//       weight: json["weight"],
//       bagQuantity: json["bag_quantity"],
//     );

// Map<String, dynamic> toJson() => {
//       "productId": productId,
//       "name": name,
//       "image": image,
//       "weight": weight,
//       "bag_quantity": bagQuantity,
//     };
}

class DataProduct {
  String? categoryId;
  String? categoryName;
  String? productId;
  String? productName;
  String? productImage;
  String? productWeight;
  int? quantity;
  int? remainingQuantity;
  String? description;

  DataProduct({
    this.categoryId,
    this.categoryName,
    this.productId,
    this.productName,
    this.productImage,
    this.productWeight,
    this.quantity,
    this.remainingQuantity,
    this.description,
  });

// factory DataProduct.fromJson(Map<String, dynamic> json) => DataProduct(
//       categoryId: json["categoryId"],
//       categoryName: json["categoryName"],
//       productId: json["productId"],
//       productName: json["productName"],
//       productImage: json["productImage"],
//       productWeight: json["productWeight"],
//       quantity: json["quantity"],
//       remainingQuantity: json["remaining_quantity"],
//       description: json["description"],
//     );

// Map<String, dynamic> toJson() => {
//       "categoryId": categoryId,
//       "categoryName": categoryName,
//       "productId": productId,
//       "productName": productName,
//       "productImage": productImage,
//       "productWeight": productWeight,
//       "quantity": quantity,
//       "remaining_quantity": remainingQuantity,
//       "description": description,
//     };
}
