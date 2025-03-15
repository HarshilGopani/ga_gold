import 'dart:convert';

ForgotPassModel forgotPassModelFromJson(String str) =>
    ForgotPassModel.fromJson(json.decode(str));

String forgotPassModelToJson(ForgotPassModel data) =>
    json.encode(data.toJson());

class ForgotPassModel {
  String? message;
  int? data;
  int? status;
  bool? isSuccess;

  ForgotPassModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory ForgotPassModel.fromJson(Map<String, dynamic> json) =>
      ForgotPassModel(
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
