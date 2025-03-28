import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? message;
  Data? data;
  int? status;
  bool? isSuccess;

  LoginModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json["Message"],
        data: json["Data"] == null || json["Data"] == 0
            ? null
            : Data.fromJson(json["Data"]),
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
  String? accessToken;
  bool? isapproved;

  Data({
    this.accessToken,
    this.isapproved,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["accessToken"],
        isapproved: json["isapproved"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "isapproved": isapproved,
      };
}
