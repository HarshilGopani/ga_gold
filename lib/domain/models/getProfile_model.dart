// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) =>
    GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) =>
    json.encode(data.toJson());

class GetProfileModel {
  String? message;
  GetProfileData? data;
  int? status;
  bool? isSuccess;

  GetProfileModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      GetProfileModel(
        message: json["Message"],
        data:
            json["Data"] == null ? null : GetProfileData.fromJson(json["Data"]),
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

class GetProfileData {
  String? id;
  String? profilePic;
  String? email;
  String? countryCode;
  String? mobile;
  bool? productVisible;
  String? channelid;
  String? name;
  bool? status;
  GetProfileCountryWiseContact? countryWiseContact;

  GetProfileData({
    this.id,
    this.profilePic,
    this.email,
    this.countryCode,
    this.mobile,
    this.productVisible,
    this.channelid,
    this.status,
    this.name,
    this.countryWiseContact,
  });

  factory GetProfileData.fromJson(Map<String, dynamic> json) => GetProfileData(
        id: json["_id"],
        profilePic: json["profile_pic"],
        email: json["email"],
        countryCode: json["countryCode"],
        mobile: json["mobile"],
        productVisible: json["product_visible"],
        channelid: json["channelid"],
        status: json["status"],
        name: json["name"],
        countryWiseContact: json["country_wise_contact"] == null
            ? null
            : GetProfileCountryWiseContact.fromJson(
                json["country_wise_contact"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "profile_pic": profilePic,
        "email": email,
        "countryCode": countryCode,
        "mobile": mobile,
        "product_visible": productVisible,
        "channelid": channelid,
        "status": status,
        "name": name,
        "country_wise_contact": countryWiseContact?.toJson(),
      };
}

class GetProfileCountryWiseContact {
  String? number;
  String? internationalNumber;
  String? nationalNumber;
  String? e164Number;
  String? countryCode;
  String? dialCode;

  GetProfileCountryWiseContact({
    this.number,
    this.internationalNumber,
    this.nationalNumber,
    this.e164Number,
    this.countryCode,
    this.dialCode,
  });

  factory GetProfileCountryWiseContact.fromJson(Map<String, dynamic> json) =>
      GetProfileCountryWiseContact(
        number: json["number"],
        internationalNumber: json["internationalNumber"],
        nationalNumber: json["nationalNumber"],
        e164Number: json["e164Number"],
        countryCode: json["countryCode"],
        dialCode: json["dialCode"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "internationalNumber": internationalNumber,
        "nationalNumber": nationalNumber,
        "e164Number": e164Number,
        "countryCode": countryCode,
        "dialCode": dialCode,
      };
}
