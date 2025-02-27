

// RepairOrderHistoryModel repairOrderHistoryModelFromJson(String str) =>
//     RepairOrderHistoryModel.fromJson(json.decode(str));

// String repairOrderHistoryModelToJson(RepairOrderHistoryModel data) =>
//     json.encode(data.toJson());

class RepairOrderHistoryModel {
  String? message;
  RepairOrderHistoryData? data;
  int? status;
  bool? isSuccess;

  RepairOrderHistoryModel({
    this.message,
    this.data,
    this.status,
    this.isSuccess,
  });

  // factory RepairOrderHistoryModel.fromJson(Map<String, dynamic> json) =>
  //     RepairOrderHistoryModel(
  //       message: json["Message"],
  //       data: json["Data"] == null
  //           ? null
  //           : RepairOrderHistoryData.fromJson(json["Data"]),
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

class RepairOrderHistoryData {
  List<RepairOrderHistoryDoc>? docs;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  dynamic nextPage;

  RepairOrderHistoryData({
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

  // factory RepairOrderHistoryData.fromJson(Map<String, dynamic> json) =>
  //     RepairOrderHistoryData(
  //       docs: json["docs"] == null
  //           ? []
  //           : List<RepairOrderHistoryDoc>.from(
  //               json["docs"]!.map((x) => RepairOrderHistoryDoc.fromJson(x))),
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

class RepairOrderHistoryDoc {
  String? id;
  String? user;
  String? orderNumber;
  String? description;
  String? file;
  int? bagNumber;
  String? orderTracking;
  int? createTimestamp;
  DateTime? createdAt;
  String? docId;

  RepairOrderHistoryDoc({
    this.id,
    this.user,
    this.orderNumber,
    this.description,
    this.bagNumber,
    this.file,
    this.orderTracking,
    this.createTimestamp,
    this.createdAt,
    this.docId,
  });

  // factory RepairOrderHistoryDoc.fromJson(Map<String, dynamic> json) =>
  //     RepairOrderHistoryDoc(
  //       id: json["_id"],
  //       user: json["user"],
  //       orderNumber: json["order_number"],
  //       description: json["description"],
  //       bagNumber: json["bag_number"],
  //       file: json["file"],
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
  //       "description": description,
  //       "bag_number": bagNumber,
  //       "file": file,
  //       "order_tracking": orderTracking,
  //       "create_timestamp": createTimestamp,
  //       "createdAt": createdAt?.toIso8601String(),
  //       "id": docId,
  //     };
}
