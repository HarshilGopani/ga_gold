

// SampleOrderHistoryModel sampleOrderHistoryModelFromJson(String str) =>
//     SampleOrderHistoryModel.fromJson(json.decode(str));

// String sampleOrderHistoryModelToJson(SampleOrderHistoryModel data) =>
//     json.encode(data.toJson());

import '../domain.dart';

class SampleOrderHistoryModel {
  String? message;
  SampleOrderHistoryData? data;
  int? status;
  bool? isSuccess;

  SampleOrderHistoryModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  // factory SampleOrderHistoryModel.fromJson(Map<String, dynamic> json) =>
  //     SampleOrderHistoryModel(
  //       message: json["Message"],
  //       data: json["Data"] == null
  //           ? null
  //           : SampleOrderHistoryData.fromJson(json["Data"]),
  //       status: json["Status"],
  //       isSuccess: json["IsSuccess"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "Message": message,
  //       "Data": data?.toJson(),
  //       "Status": status,
  //       "IsSuccess": isSuccess,
  //     };
}

class SampleOrderHistoryData {
  List<SampleOrderHistoryDoc>? docs;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  dynamic nextPage;

  SampleOrderHistoryData({
    this.docs,
    this.totalDocs,
    this.limit,
    this.totalPages,
    this.page,
    this.pagingCounter,
    this.hasPrevPage,
    this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });

  // factory SampleOrderHistoryData.fromJson(Map<String, dynamic> json) =>
  //     SampleOrderHistoryData(
  //       docs: json["docs"] == null
  //           ? []
  //           : List<SampleOrderHistoryDoc>.from(
  //               json["docs"]!.map((x) => SampleOrderHistoryDoc.fromJson(x))),
  //       totalDocs: json["totalDocs"],
  //       limit: json["limit"],
  //       totalPages: json["totalPages"],
  //       page: json["page"],
  //       pagingCounter: json["pagingCounter"],
  //       hasPrevPage: json["hasPrevPage"],
  //       hasNextPage: json["hasNextPage"],
  //       prevPage: json["prevPage"],
  //       nextPage: json["nextPage"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "docs": docs == null
  //           ? []
  //           : List<dynamic>.from(docs!.map((x) => x.toJson())),
  //       "totalDocs": totalDocs,
  //       "limit": limit,
  //       "totalPages": totalPages,
  //       "page": page,
  //       "pagingCounter": pagingCounter,
  //       "hasPrevPage": hasPrevPage,
  //       "hasNextPage": hasNextPage,
  //       "prevPage": prevPage,
  //       "nextPage": nextPage,
  //     };
}

class SampleOrderHistoryDoc {
  String? id;
  String? user;
  String? orderNumber;
  int? bagNumber;
  List<RepairOrderUploadImageData>? images;
  String? description;
  String? orderTracking;
  int? createTimestamp;
  DateTime? createdAt;
  String? docId;

  SampleOrderHistoryDoc({
    this.id,
    this.user,
    this.orderNumber,
    this.bagNumber,
    this.images,
    this.description,
    this.orderTracking,
    this.createTimestamp,
    this.createdAt,
    this.docId,
  });

  // factory SampleOrderHistoryDoc.fromJson(Map<String, dynamic> json) =>
  //     SampleOrderHistoryDoc(
  //       id: json["_id"],
  //       user: json["user"],
  //       orderNumber: json["order_number"],
  //       bagNumber: json["bag_number"],
  //       description: json["description"],
  //       images: json["images"] == null
  //           ? []
  //           : List<RepairOrderUploadImageData>.from(json["images"]!.map((x) => RepairOrderUploadImageData.fromJson(x))),
  //       orderTracking: json["order_tracking"],
  //       createTimestamp: json["create_timestamp"],
  //       createdAt: json["createdAt"] == null
  //           ? null
  //           : DateTime.parse(json["createdAt"]),
  //       docId: json["id"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "_id": id,
  //       "user": user,
  //       "order_number": orderNumber,
  //       "bag_number": bagNumber,
  //       "description": description,
  //       "images": images == null
  //           ? []
  //           : List<dynamic>.from(images!.map((x) => x.toJson())),
  //       "order_tracking": orderTracking,
  //       "create_timestamp": createTimestamp,
  //       "createdAt": createdAt?.toIso8601String(),
  //       "id": docId,
  //     };
}
