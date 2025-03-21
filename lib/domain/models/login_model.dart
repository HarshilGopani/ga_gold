import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? message;
  dynamic data;
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
    "Data": data is Data ? (data as Data).toJson() : data,
    "Status": status,
    "IsSuccess": isSuccess,
  };
}

class Data {
  String? accessToken;

  Data({
    this.accessToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accessToken: json["accessToken"],
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
  };
}
