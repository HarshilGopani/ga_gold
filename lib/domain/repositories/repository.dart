import 'dart:async';
import 'dart:convert';

import 'package:Ga_Gold/app/utils/utils.dart';
import 'package:Ga_Gold/data/data.dart';
import 'package:Ga_Gold/device/device.dart';
import 'package:Ga_Gold/domain/domain.dart';
import 'package:Ga_Gold/domain/models/uploadProfile_model.dart';
import 'package:Ga_Gold/domain/models/upload_image_model.dart';

/// The main repository which will get the data from [DeviceRepository] or the
/// [DataRepository].
class Repository {
  /// [_deviceRepository] : the local repository.
  /// [_dataRepository] : the data repository like api and all.
  Repository(this._deviceRepository, this._dataRepository);

  final DeviceRepository _deviceRepository;
  final DataRepository _dataRepository;

  /// Clear data from local storage for [key].
  void clearData(dynamic key) {
    try {
      _deviceRepository.clearData(
        key,
      );
    } catch (_) {
      _dataRepository.clearData(
        key,
      );
    }
  }

  /// Get the string value for the [key].
  ///
  /// [key] : The key whose value is needed.
  String getStringValue(String key) {
    try {
      return _deviceRepository.getStringValue(
        key,
      );
    } catch (_) {
      return _dataRepository.getStringValue(
        key,
      );
    }
  }

  /// Save the value to the string.
  ///
  /// [key] : The key to which [value] will be saved.
  /// [value] : The value which needs to be saved.
  void saveValue(dynamic key, dynamic value) {
    try {
      _deviceRepository.saveValue(
        key,
        value,
      );
    } catch (_) {
      _dataRepository.saveValue(
        key,
        value,
      );
    }
  }

  /// Get the bool value for the [key].
  ///
  /// [key] : The key whose value is needed.
  bool getBoolValue(String key) {
    try {
      return _deviceRepository.getBoolValue(
        key,
      );
    } catch (_) {
      return _dataRepository.getBoolValue(
        key,
      );
    }
  }

  /// Get the stored value for the [key].
  ///
  /// [key] : The key whose value is needed.
  bool getStoredValue(String key) {
    try {
      return _deviceRepository.getBoolValue(
        key,
      );
    } catch (_) {
      return _dataRepository.getBoolValue(
        key,
      );
    }
  }

  /// Get the secure value for the [key].
  /// [key] : The key whose value is needed.
  Future<String> getSecureValue(String key) async {
    try {
      return await _deviceRepository.getSecuredValue(key);
    } catch (_) {
      return await _dataRepository.getSecuredValue(key);
    }
  }

  /// Save the value to the string.
  ///
  /// [key] : The key to which [value] will be saved.
  /// [value] : The value which needs to be saved.
  void saveSecureValue(String key, String value) {
    try {
      _deviceRepository.saveValueSecurely(
        key,
        value,
      );
    } catch (_) {
      _dataRepository.saveValueSecurely(
        key,
        value,
      );
    }
  }

  /// Clear data from secure storage for [key].
  void deleteSecuredValue(String key) {
    try {
      _deviceRepository.deleteSecuredValue(
        key,
      );
    } catch (_) {
      _dataRepository.deleteSecuredValue(
        key,
      );
    }
  }

  /// Clear all data from secure storage .
  void deleteAllSecuredValues() {
    try {
      _deviceRepository.deleteAllSecuredValues();
    } catch (_) {
      _dataRepository.deleteAllSecuredValues();
    }
  }

  Future<GetCategoriesModel?> getAllCategories({
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.getAllCategories(
        isLoading: isLoading,
      );
      var loginModel = getCategoriesModelFromJson(response.data);
      if (loginModel.data != null) {
        return loginModel;
      } else {
        Utility.errorMessage(loginModel.message.toString());
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ProductsModel?> postAllProduct({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String category,
    required String min,
    required String max,

    required String sortField,
    required var sortOption,
  }) async {
    try {
      var response = await _dataRepository.postAllProduct(
        page: page,
        limit: limit,
        search: search,
        category: category,
        min: min,
        max: max,

        sortField: sortField,
        sortOption: sortOption,
        isLoading: isLoading,
      );
      var loginModel = productsModelFromJson(response.data);
      if (loginModel.data != null) {
        return loginModel;
      } else {
        Utility.errorMessage(loginModel.message.toString());
        return loginModel;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ResponseModel?> postAddToCart({
    bool isLoading = false,
    required String productId,
    required int quantity,
    required String description,
  }) async {
    try {
      var response = await _dataRepository.postAddToCart(
        productId: productId,
        quantity: quantity,
        description: description,
        isLoading: isLoading,
      );
      return response;
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<CartItemModel?> postGetAllCartProduct({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async {
    try {
      var response = await _dataRepository.postGetAllCartProduct(
        isLoading: isLoading,
        limit: limit,
        page: page,
      );
      var cartItemModel = cartItemModelFromJson(response.data);
      if (cartItemModel.data != null) {
        return cartItemModel;
      } else {
        Utility.errorMessage(cartItemModel.message.toString());
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ResponseModel?> postCartProductRemove({
    bool isLoading = false,
    required String productId,
  }) async {
    try {
      var response = await _dataRepository.postCartProductRemove(
        productId: productId,
        isLoading: isLoading,
      );
      return response;
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<WishlistModel?> postWishlist({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async {
    try {
      var response = await _dataRepository.postWishlist(
        page: page,
        limit: limit,
        isLoading: isLoading,
      );
      var loginModel = wishlistModelFromJson(response.data);
      if (loginModel.data != null) {
        return loginModel;
      } else {
        Utility.errorMessage(loginModel.message.toString());
        return loginModel;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ResponseModel?> postWishlistAddRemove({
    bool isLoading = false,
    required String productId,
  }) async {
    try {
      var response = await _dataRepository.postWishlistAddRemove(
        productId: productId,
        isLoading: isLoading,
      );
      return response;
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<LoginModel?> loginApi({
    bool isLoading = false,
    required String mobile,
    required String password,
    required String fcm,
  }) async {
    try {
      var response = await _dataRepository.loginApi(
        mobile: mobile,
        password: password,
        fcm: fcm,
        isLoading: isLoading,
      );
      var loginModel = loginModelFromJson(response.data);
      if (loginModel.data != null) {
        return loginModel;
      } else {
        Utility.errorMessage(loginModel.message.toString());
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ForgotPassModel?> forgotPass({
    bool isLoading = false,
    required String email,
  }) async {
    try {
      var response = await _dataRepository.forgotPass(
        email: email,
        isLoading: isLoading,
      );
      var forgotPassModel = forgotPassModelFromJson(response.data);
      if (forgotPassModel.data != null) {
        return forgotPassModel;
      } else {
        Utility.errorMessage(forgotPassModel.message.toString());
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<GetProfileModel?> getProfile({
    bool isLoading = false,
  }) async {
    try {
      var response = await _dataRepository.getProfile(
        isLoading: isLoading,
      );
      var profileModel = getProfileModelFromJson(response.data);
      if (profileModel.data != null) {
        return profileModel;
      } else {
        Utility.errorMessage(profileModel.message.toString());
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<UploadProfileModel?> postUploadProfile({
    bool isLoading = false,
    required String filePath,
  }) async {
    try {
      var response = await _dataRepository.postUploadProfile(
        isLoading: isLoading,
        filePath: filePath,
      );
      var uploadProfileModel = uploadProfileModelFromJson(response.data);
      if (uploadProfileModel.data != null) {
        return uploadProfileModel;
      } else {
        Utility.errorMessage(uploadProfileModel.message.toString());
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<RepairOrderUploadImageApi?> repairOrderImage({
    bool isLoading = false,
    required String filePath,
  }) async {
    try {
      var response = await _dataRepository.repairOrderImage(
        isLoading: isLoading,
        filePath: filePath,
      );
      var repairOrderUploadImageModel =
          repairOrderUploadImageApiFromJson(response.data);
      if (repairOrderUploadImageModel.status == 200) {
        return repairOrderUploadImageModel;
      } else {
        return repairOrderUploadImageModel;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<UploadImage?> uploadImage({
    bool isLoading = false,
    required String filePath,
  }) async {
    try {
      var response = await _dataRepository.uploadImage(
        isLoading: isLoading,
        filePath: filePath,
      );
      var uploadImageModel =
          uploadImageFromJson(response.data);
      if (uploadImageModel.status == 200) {
        return uploadImageModel;
      } else {
        return uploadImageModel;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<SampleOrderImage?> sampleOrderImage({
    bool isLoading = false,
    required String filePath,
  }) async {
    try {
      var response = await _dataRepository.sampleOrderImage(
        isLoading: isLoading,
        filePath: filePath,
      );
      var sampleOrderUploadImageModel = sampleOrderImageFromJson(response.data);
      if (sampleOrderUploadImageModel.status == 200) {
        return sampleOrderUploadImageModel;
      } else {
        Utility.showMessage(sampleOrderUploadImageModel.message.toString(),
            MessageType.error, () => null, '');
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ResponseModel?> postSampleOrder({
    bool isLoading = false,
    required List<SampleOrderImageDatum> images,
    required int totalQuantity,
    required String description,
    required String productName,
    required String priority,
    required String weight,
    required String size,
  }) async {
    try {
      var response = await _dataRepository.postSampleOrder(
        images: images,
        totalQuantity: totalQuantity,
        description: description,
        productName: productName,
        weight: weight,
        size: size,
        priority: priority,
        isLoading: isLoading,
      );
      return response;
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<SampleOrderHistoryModel?> postSampleOrderHistory({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async {
    try {
      var response = await _dataRepository.postSampleOrderHistory(
        page: page,
        limit: limit,
        isLoading: isLoading,
      );
      var sampleOrderHistoryModel =
          sampleOrderHistoryModelFromJson(response.data);
      if (sampleOrderHistoryModel.status == 200) {
        return sampleOrderHistoryModel;
      } else {
        Utility.showMessage(sampleOrderHistoryModel.message.toString(),
            MessageType.error, () => null, '');
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<GetOneSampleModel?> getOneSample({
    bool isLoading = false,
    required String sampleOrderId,
  }) async {
    try {
      var response = await _dataRepository.getOneSample(
        sampleOrderId: sampleOrderId,
        isLoading: isLoading,
      );
      var getOneSampleModel = getOneSampleModelFromJson(response.data);
      if (getOneSampleModel.status == 200) {
        return getOneSampleModel;
      } else {
        Utility.showMessage(getOneSampleModel.message.toString(),
            MessageType.error, () => null, '');
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<GetOneBagModel?> postGetOnebag({
    bool isLoading = false,
    required String orderId,
    required String bagId,
  }) async {
    try {
      var response = await _dataRepository.postGetOnebag(
        orderId: orderId,
        bagId: bagId,
        isLoading: isLoading,
      );
      var getOneBagModel = getOneBagModelFromJson(response.data);
      if (getOneBagModel.status == 200) {
        return getOneBagModel;
      } else {
        Utility.showMessage(getOneBagModel.message.toString(),
            MessageType.error, () => null, '');
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ResponseModel?> postOrderCreate({
    bool isLoading = false,
    required List<Product> products,
    required String main_description,
    required String cartId,
  }) async {
    try {
      var response = await _dataRepository.postOrderCreate(
        cartId: cartId,
        products: products,
        main_description: main_description,
        isLoading: isLoading,
      );
      return response;
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<GetOrderHistoryModel?> postOrderHistory({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async {
    try {
      var response = await _dataRepository.postOrderHistory(
        page: page,
        limit: limit,
        isLoading: isLoading,
      );
      var getOrderHistoryModel = getOrderHistoryModelFromJson(response.data);
      if (getOrderHistoryModel.status == 200) {
        return getOrderHistoryModel;
      } else {
        Utility.showMessage(getOrderHistoryModel.message.toString(),
            MessageType.error, () => null, '');
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<GetOneOrderModel?> postOrderGetOne({
    bool isLoading = false,
    required String orderId,
  }) async {
    try {
      var response = await _dataRepository.postOrderGetOne(
        orderId: orderId,
        isLoading: isLoading,
      );
      var getOneOrderModel = getOneOrderModelFromJson(response.data);
      if (getOneOrderModel.status == 200) {
        return getOneOrderModel;
      } else {
        Utility.showMessage(getOneOrderModel.message.toString(),
            MessageType.error, () => null, '');
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ResponseModel?> postRepairOrder({
    bool isLoading = false,
    required String file,
    required String description,
    required String productName,
    required String priority,
    required String weight,
    required String size,
  }) async {
    try {
      var response = await _dataRepository.postRepairOrder(
        file: file,
        description: description,
        isLoading: isLoading,productName: productName,
        weight: weight,
        size: size,
        priority: priority,
      );
      return response;
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<RepairOrderHistoryModel?> repairOrderList({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async {
    try {
      var response = await _dataRepository.repairOrderList(
        page: page,
        limit: limit,
        isLoading: isLoading,
      );
      var repairOrderModel = repairOrderHistoryModelFromJson(response.data);
      if (repairOrderModel.data != null) {
        return repairOrderModel;
      } else {
        Utility.errorMessage(repairOrderModel.message.toString());
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<GetOneRepairOrderModel?> getOneRepairOrder({
    bool isLoading = false,
    required String repairingOrderId,
  }) async {
    try {
      var response = await _dataRepository.getOneRepairOrder(
        repairingOrderId: repairingOrderId,
        isLoading: isLoading,
      );
      var getOneRepairOrderModel =
          getOneRepairOrderModelFromJson(response.data);
      if (getOneRepairOrderModel.data != null) {
        return getOneRepairOrderModel;
      } else {
        Utility.errorMessage(getOneRepairOrderModel.message.toString());
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<RegisterModel?> registerApi({
    bool isLoading = false,
    required String city,
    required String countryCode,
    required String mobile,
    required String password,
    required String name,
    required String email,
    required String companyname,
    required List<String> images
  }) async {
    try {
      var response = await _dataRepository.registerApi(
        city: city,
        countryCode: countryCode,
        mobile: mobile,
        password: password,
        name: name,
        email: email,
        companyname: companyname,
        images: images,
        isLoading: isLoading,
      );
      var registerModel = registerModelFromJson(response.data);
      if (registerModel.data != null) {
        return registerModel;
      } else {
        Utility.errorMessage(registerModel.message.toString());
        return null;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  // Future<void> getUserLocationDetails() async {
  //   try {
  //     await Utility.getCurrentLocation();

  //     var position = await Utility.getCurrentLatLng();

  //     if (position != null) {
  //       var lat = position.latitude.toString();
  //       var lng = position.longitude.toString();
  //       // saveSecureValue(LocalKeys.lat, lat);
  //       // saveSecureValue(LocalKeys.lng, lng);
  //     }
  //     var locationDetails = await Utility.getCurrentLocationDetails(
  //       isLoading: false,
  //     );

  //     if (locationDetails != null) {
  //       var city = locationDetails.area;
  //       var country = locationDetails.country;
  //       saveSecureValue(LocalKeys.city, city);
  //       saveSecureValue(LocalKeys.country, country);
  //     }
  //   } catch (e) {
  //     Utility.showDialog(e.toString());
  //   }
  // }

  /// API to get the IP of the user
  // Future<String?> getIp() async {
  //   try {
  //     var response = await _dataRepository.getIp();
  //     saveSecureValue(LocalKeys.userIP, response);

  //     return response;
  //   } catch (_) {
  //     var response = await _deviceRepository.getIp();

  //     return response;
  //   }
  // }
}
