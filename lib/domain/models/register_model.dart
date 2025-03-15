// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  String? message;
  int? data;
  int? status;
  bool? isSuccess;

  RegisterModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        message: json["Message"],
        data: json["Data"],
        status: json["Status"],
        isSuccess: json["IsSuccess"],
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "Data": data,
        "Status": status,
        "IsSuccess": isSuccess,
      };
}
