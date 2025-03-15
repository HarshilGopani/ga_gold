// To parse this JSON data, do
//
//     final getOneSampleModel = getOneSampleModelFromJson(jsonString);

import 'dart:convert';

GetOneSampleModel getOneSampleModelFromJson(String str) => GetOneSampleModel.fromJson(json.decode(str));

String getOneSampleModelToJson(GetOneSampleModel data) => json.encode(data.toJson());

class GetOneSampleModel {
    String? message;
    GetOneSampleData? data;
    int? status;
    bool? isSuccess;

    GetOneSampleModel({
        this.message,
        this.data,
        this.status,
        this.isSuccess,
    });

    factory GetOneSampleModel.fromJson(Map<String, dynamic> json) => GetOneSampleModel(
        message: json["Message"],
        data: json["Data"] == null ? null : GetOneSampleData.fromJson(json["Data"]),
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

class GetOneSampleData {
    String? id;
    String? user;
    String? orderNumber;
    int? bagNumber;
    List<GetOneSampleImage>? images;
    String? description;
    int? totalQuantity;
    String? orderTracking;
    int? createTimestamp;
    DateTime? createdAt;

    GetOneSampleData({
        this.id,
        this.user,
        this.orderNumber,
        this.bagNumber,
        this.images,
        this.description,
        this.totalQuantity,
        this.orderTracking,
        this.createTimestamp,
        this.createdAt,
    });

    factory GetOneSampleData.fromJson(Map<String, dynamic> json) => GetOneSampleData(
        id: json["_id"],
        user: json["user"],
        orderNumber: json["order_number"],
        bagNumber: json["bag_number"],
        images: json["images"] == null ? [] : List<GetOneSampleImage>.from(json["images"]!.map((x) => GetOneSampleImage.fromJson(x))),
        description: json["description"],
        totalQuantity: json["totalQuantity"],
        orderTracking: json["order_tracking"],
        createTimestamp: json["create_timestamp"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "order_number": orderNumber,
        "bag_number": bagNumber,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
        "description": description,
        "totalQuantity": totalQuantity,
        "order_tracking": orderTracking,
        "create_timestamp": createTimestamp,
        "createdAt": createdAt?.toIso8601String(),
    };
}

class GetOneSampleImage {
    String? path;

    GetOneSampleImage({
        this.path,
    });

    factory GetOneSampleImage.fromJson(Map<String, dynamic> json) => GetOneSampleImage(
        path: json["path"],
    );

    Map<String, dynamic> toJson() => {
        "path": path,
    };
}
