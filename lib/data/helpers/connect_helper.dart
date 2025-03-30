// coverage:ignore-file
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:Ga_Gold/app/app.dart';
import 'package:Ga_Gold/data/data.dart';
import 'package:Ga_Gold/data/helpers/end_points.dart';
import 'package:Ga_Gold/domain/domain.dart';
import 'package:get/get.dart';
import 'package:http_parser/src/media_type.dart' as mediaType;
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mime/mime.dart';

/// The helper class which will connect to the world to get the data.
class ConnectHelper {
  ConnectHelper() {
    _init();
  }

  late Dio dio;

  /// Api wrapper initialization
  final apiWrapper = ApiWrapper();

  /// Device info plugin initialization
  final deviceinfo = DeviceInfoPlugin();

  /// To get android device info
  AndroidDeviceInfo? androidDeviceInfo;

  /// To get iOS device info
  IosDeviceInfo? iosDeviceInfo;

  // IosDeviceInfo? iosDeviceInfo;

  // coverage:ignore-start
  /// initialize the andorid device information
  void _init() async {
    if (GetPlatform.isAndroid) {
      androidDeviceInfo = await deviceinfo.androidInfo;
    } else {
      iosDeviceInfo = await deviceinfo.iosInfo;
    }
    dio = Dio();
  }

  // coverage:ignore-end

  /// Device id
  String? get deviceId => GetPlatform.isAndroid
      ? androidDeviceInfo?.id
      : iosDeviceInfo?.identifierForVendor;

  /// Device make brand
  String? get deviceMake =>
      GetPlatform.isAndroid ? androidDeviceInfo?.brand : 'Apple';

  /// Device Model
  String? get deviceModel =>
      GetPlatform.isAndroid ? androidDeviceInfo?.model : iosDeviceInfo?.model;

  /// Device is a type of 1 for Android and 2 for iOS
  String get deviceTypeCode => GetPlatform.isAndroid ? '1' : '2';

  /// Device OS
  String get deviceOs => GetPlatform.isAndroid ? 'ANDROID' : 'IOS';

  /// API to get the IP of the user
  Future<String> getIp() async {
    var ip = '';
    if (await Utility.isNetworkAvailable()) {
      for (var interface in await NetworkInterface.list()) {
        for (var addr in interface.addresses) {
          ip = addr.address;
        }
      }
      return ip.isNotEmpty ? ip : '0.0.0.0';
    }
    return '0.0.0.0';
  }

  Future<ResponseModel> getAllCategories({
    bool isLoading = false,
  }) async {
    var response = await apiWrapper.makeRequest(
      EndPoints.getAllCategories,
      Request.get,
      null,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postAllProduct({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required int min,
    required int max,
    required String category,
    required String sortField,
    required var sortOption,
  }) async {
    var data = {
      "page": page,
      "limit": limit,
      "search": search,
      "category": category,
      "min": min,
      "max": max,
      "sortField": sortField,
      "sortOption": sortOption
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postAllProduct,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postGetAllCartProduct({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async {
    var data = {
      "page": page,
      "limit": limit,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postGetAllCartProduct,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postCartProductRemove({
    bool isLoading = false,
    required String productId,
  }) async {
    var data = {
      "productId": productId,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postCartProductRemove,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postWishlist({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async {
    var data = {
      "page": page,
      "limit": limit,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postWishlist,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postWishlistAddRemove({
    bool isLoading = false,
    required String productId,
  }) async {
    var data = {
      "productid": productId,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postWishlistAddRemove,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postAddToCart({
    bool isLoading = false,
    required String productId,
    required int quantity,
    required String description,
  }) async {
    var data = {
      "productId": productId,
      "quantity": quantity,
      "description": description,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postAddToCart,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> loginApi({
    bool isLoading = false,
    required String mobile,
    required String password,
    required String fcm,
  }) async {
    var data = {"username": mobile, "password": password, "fcm": fcm};
    var response = await apiWrapper.makeRequest(
      EndPoints.login,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(isDefaultAuthorizationKeyAdd: false),
    );
    return response;
  }

  Future<ResponseModel> forgotPass({
    bool isLoading = false,
    required String email,
  }) async {
    var data = {"email": email};
    var response = await apiWrapper.makeRequest(
      EndPoints.forgotpass,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> getProfile({bool isLoading = false}) async {
    var response = await apiWrapper.makeRequest(
      EndPoints.getProfile,
      Request.get,
      null,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> registerApi({
    bool isLoading = false,
    required String name,
    required String email,
    required String companyname,
    required String city,
    required String countryCode,
    required String mobile,
    required String password,
    required List<String> images,
  }) async {
    var data = {
      "name": name,
      "email": email,
      "companyname": companyname,
      "city": city,
      "countryCode": countryCode,
      "mobile": mobile,
      "country_wise_contact": {
        "number": mobile.isEmpty ? "" : "0$mobile",
        "internationalNumber": "$countryCode $mobile",
        "nationalNumber": "0$mobile",
        "e164Number": countryCode + mobile,
        "countryCode": PhoneNumber.getISO2CodeByPrefix(countryCode),
        "dialCode": countryCode,
      },
      "password": password,
      "images": images,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.register,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(isDefaultAuthorizationKeyAdd: false),
    );
    return response;
  }

  Future<ResponseModel> repairOrderList({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async {
    var data = {"page": page, "limit": limit};
    var response = await apiWrapper.makeRequest(
      EndPoints.repairOrderList,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> repairOrderImage({
    bool isLoading = false,
    required String filePath,
  }) async {
    var type = lookupMimeType(filePath)!.split('/');

    var response = await apiWrapper.makeRequest(
      EndPoints.repairOrderImage,
      Request.awsUpload,
      filePath,
      isLoading,
      Utility.commonHeader(),
      mediaType: mediaType.MediaType(type[0], type[1]),
    );
    return response;
  }

  Future<ResponseModel> uploadImage({
    bool isLoading = false,
    required String filePath,
  }) async {
    var type = lookupMimeType(filePath)!.split('/');

    var response = await apiWrapper.makeRequest(
      EndPoints.uploadImage,
      Request.awsUpload,
      filePath,
      isLoading,
      Utility.commonHeader(),
      mediaType: mediaType.MediaType(type[0], type[1]),
    );
    return response;
  }

  Future<ResponseModel> sampleOrderImage({
    bool isLoading = false,
    required String filePath,
  }) async {
    var type = lookupMimeType(filePath)!.split('/');

    var response = await apiWrapper.makeRequest(
      EndPoints.sampleOrderImage,
      Request.awsUpload,
      filePath,
      isLoading,
      Utility.commonHeader(),
      mediaType: mediaType.MediaType(type[0], type[1]),
    );
    return response;
  }

  Future<ResponseModel> postSampleOrder({
    bool isLoading = false,
    required List<SampleOrderImageDatum> images,
    required int totalQuantity,
    required String description,
    required String productName,
    required String priority,
    required String weight,
    required String size,
  }) async {
    var data = {
      "images": images,
      "totalQuantity": totalQuantity,
      "description": description,
      "productname": productName,
      "priority": priority,
      "weight": weight,
      "size": size,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postSampleOrder,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postSampleOrderHistory({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async {
    var data = {"page": page, "limit": limit};
    var response = await apiWrapper.makeRequest(
      EndPoints.sampleOrderHistory,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> getOneSample({
    bool isLoading = false,
    required String sampleOrderId,
  }) async {
    var data = {"sampleOrderId": sampleOrderId};
    var response = await apiWrapper.makeRequest(
      EndPoints.getOneSampleOrder,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postGetOnebag({
    bool isLoading = false,
    required String orderId,
    required String bagId,
  }) async {
    var data = {"orderId": orderId, "bagId": bagId};
    var response = await apiWrapper.makeRequest(
      EndPoints.postGetOnebag,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postOrderCreate({
    bool isLoading = false,
    required String cartId,
    required List<Product> products,
    required String main_description,
  }) async {
    var data = {
      "products": products,
      // "main_description": main_description,
      "cartid": cartId,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postOrderCreate,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postOrderHistory({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async {
    var data = {"page": page, "limit": limit};
    var response = await apiWrapper.makeRequest(
      EndPoints.postOrderHistory,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postOrderGetOne({
    bool isLoading = false,
    required String orderId,
  }) async {
    var data = {"orderId": orderId};
    var response = await apiWrapper.makeRequest(
      EndPoints.postOrderGetOne,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postRepairOrder({
    bool isLoading = false,
    required String file,
    required String description,
    required String productName,
    required String priority,
    required String weight,
    required String size,
  }) async {
    var data = {
      "file": file,
      "description": description,
      "productname": productName,
      "priority": priority,
      "weight": weight,
      "size": size,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postRepairOrder,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> getOneRepairOrder({
    bool isLoading = false,
    required String repairingOrderId,
  }) async {
    var data = {"repairingOrderId": repairingOrderId};
    var response = await apiWrapper.makeRequest(
      EndPoints.getOneRepairOrder,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  // Future<ResponseModel> postUploadProfile({
  //   bool isLoading = false,
  //   required String filePath,
  // }) async {
  //   var type = lookupMimeType(filePath)!.split('/');

  //   var response = await apiWrapper.makeRequest(
  //     EndPoints.postUploadProfile,
  //     Request.awsUpload,
  //     filePath,
  //     isLoading,
  //     Utility.commonHeader(),
  //     mediaType: mediaType.MediaType(type[0], type[1]),
  //   );
  //   return response;
  // }

  Future<ResponseModel> postUploadProfile({
    bool isLoading = false,
    required String filePath,
  }) async {
    var response = await apiWrapper.makeRequest(
      EndPoints.postUploadProfile,
      Request.filePath,
      filePath,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }
}

class SmapleUploadDatum {
  String? fileId;
  String? path;

  SmapleUploadDatum({this.fileId, this.path});

  factory SmapleUploadDatum.fromJson(Map<String, dynamic> json) =>
      SmapleUploadDatum(fileId: json["fileId"], path: json["path"]);

  Map<String, dynamic> toJson() => {"fileId": fileId, "path": path};
}
