import 'dart:convert';

RepairOrderUploadImageApi repairOrderUploadImageApiFromJson(String str) =>
    RepairOrderUploadImageApi.fromJson(json.decode(str));

String repairOrderUploadImageApiToJson(RepairOrderUploadImageApi data) =>
    json.encode(data.toJson());

class RepairOrderUploadImageApi {
  String? message;
  RepairOrderUploadImageData? data;
  int? status;
  bool? isSuccess;

  RepairOrderUploadImageApi({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  factory RepairOrderUploadImageApi.fromJson(Map<String, dynamic> json) =>
      RepairOrderUploadImageApi(
        message: json["Message"],
        data: json["Data"] == null ? null : RepairOrderUploadImageData.fromJson(json["Data"]),
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

class RepairOrderUploadImageData {
  String? fileId;
  String? path;

  RepairOrderUploadImageData({
    this.fileId,
    this.path,
  });

  factory RepairOrderUploadImageData.fromJson(Map<String, dynamic> json) => RepairOrderUploadImageData(
        fileId: json["fileId"],
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "fileId": fileId,
        "path": path,
      };
}
