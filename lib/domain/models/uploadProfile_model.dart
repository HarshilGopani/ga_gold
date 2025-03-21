import 'dart:convert';

UploadProfileModel uploadProfileModelFromJson(String str) =>
    UploadProfileModel.fromJson(json.decode(str));

String uploadProfileModelToJson(UploadProfileModel data) =>
    json.encode(data.toJson());

class UploadProfileModel {
  String? message;
  dynamic data;
  int? status;
  bool? isSuccess;

  UploadProfileModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory UploadProfileModel.fromJson(Map<String, dynamic> json) =>
      UploadProfileModel(
        message: json["Message"],
        data: json["Data"] is int
            ? json["Data"]
            : json["Data"] == null
                ? null
                : Data.fromJson(json["Data"]),
        status: json["Status"],
        isSuccess: json["IsSuccess"],
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "Data": data is Data ? data?.toJson() : data,
        "Status": status,
        "IsSuccess": isSuccess,
      };
}

class Data {
  String? profilePic;
  String? updatedBy;
  DateTime? updatedAt;

  Data({
    this.profilePic,
    this.updatedBy,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        profilePic: json["profile_pic"],
        updatedBy: json["updatedBy"],
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "profile_pic": profilePic,
        "updatedBy": updatedBy,
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
