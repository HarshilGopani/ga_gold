import 'dart:convert';

GetCategoriesModel getCategoriesModelFromJson(String str) =>
    GetCategoriesModel.fromJson(json.decode(str));

class GetCategoriesModel {
  String? message;
  List<GetCategoriesData>? data;
  int? status;
  bool? isSuccess;

  GetCategoriesModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory GetCategoriesModel.fromJson(Map<String, dynamic> json) =>
      GetCategoriesModel(
        message: json["Message"],
        data: json["Data"] == null
            ? []
            : List<GetCategoriesData>.from(
                json["Data"]!.map((x) => GetCategoriesData.fromJson(x))),
        status: json["Status"],
        isSuccess: json["IsSuccess"],
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "Data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "Status": status,
        "IsSuccess": isSuccess,
      };
}

class GetCategoriesData {
  String? id;
  String? name;
  bool? status;
  int? createTimestamp;
  String? image;
  DateTime? createdAt;
  String? icon;

  GetCategoriesData({
    this.id,
    this.name,
    this.status,
    this.createTimestamp,
    this.image,
    this.createdAt,
    this.icon,
  });

  factory GetCategoriesData.fromJson(Map<String, dynamic> json) =>
      GetCategoriesData(
        id: json["_id"],
        name: json["name"],
        status: json["status"],
        createTimestamp: json["create_timestamp"],
        image: json["image"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "status": status,
        "create_timestamp": createTimestamp,
        "image": image,
        "createdAt": createdAt?.toIso8601String(),
        "icon": icon,
      };
}
