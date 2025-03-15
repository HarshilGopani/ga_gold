// To parse this JSON data, do
//
//     final sampleOrderImage = sampleOrderImageFromJson(jsonString);

import 'dart:convert';

SampleOrderImage sampleOrderImageFromJson(String str) =>
    SampleOrderImage.fromJson(json.decode(str));

String sampleOrderImageToJson(SampleOrderImage data) =>
    json.encode(data.toJson());

class SampleOrderImage {
  String? message;
  List<SampleOrderImageDatum>? data;
  int? status;
  bool? isSuccess;

  SampleOrderImage({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory SampleOrderImage.fromJson(Map<String, dynamic> json) =>
      SampleOrderImage(
        message: json["Message"],
        data: json["Data"] == null
            ? []
            : List<SampleOrderImageDatum>.from(
                json["Data"]!.map((x) => SampleOrderImageDatum.fromJson(x))),
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

class SampleOrderImageDatum {
  String? fileId;
  String? path;

  SampleOrderImageDatum({
    this.fileId,
    this.path,
  });

  factory SampleOrderImageDatum.fromJson(Map<String, dynamic> json) =>
      SampleOrderImageDatum(
        fileId: json["fileId"],
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "fileId": fileId,
        "path": path,
      };
}
