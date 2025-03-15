import 'dart:convert';

UploadImage uploadImageFromJson(String str) => UploadImage.fromJson(json.decode(str));

String uploadImageToJson(UploadImage data) => json.encode(data.toJson());

class UploadImage {
    String message;
    List<UploadImageDatum> data;
    int status;
    bool isSuccess;

    UploadImage({
        required this.message,
        required this.data,
        required this.status,
        required this.isSuccess,
    });

    factory UploadImage.fromJson(Map<String, dynamic> json) => UploadImage(
        message: json["Message"],
        data: List<UploadImageDatum>.from(json["Data"].map((x) => UploadImageDatum.fromJson(x))),
        status: json["Status"],
        isSuccess: json["IsSuccess"],
    );

    Map<String, dynamic> toJson() => {
        "Message": message,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
        "Status": status,
        "IsSuccess": isSuccess,
    };
}

class UploadImageDatum {
    String url;

    UploadImageDatum({
        required this.url,
    });

    factory UploadImageDatum.fromJson(Map<String, dynamic> json) => UploadImageDatum(
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
    };
}
