import 'package:Ga_Gold/data/data.dart';
import 'package:Ga_Gold/domain/models/models.dart';
import 'package:Ga_Gold/domain/repositories/repositories.dart';

/// Repositories (retrieve data, heavy processing etc..)
class DataRepository extends DomainRepository {
  /// [connectHelper] : A connection helper which will connect to the
  /// remote to get the data.
  DataRepository(this.connectHelper);

  final ConnectHelper connectHelper;

  @override
  void clearData(dynamic key) {
    throw UnimplementedError();
  }

  /// Delete the box
  @override
  void deleteBox() {
    throw UnimplementedError();
  }

  /// returns stored string value
  @override
  String getStringValue(String key) {
    throw UnimplementedError();
  }

  /// store the data
  @override
  void saveValue(dynamic key, dynamic value) {
    throw UnimplementedError();
  }

  /// return bool value
  @override
  bool getBoolValue(String key) => throw UnimplementedError();

  /// Get data from secure storage
  @override
  Future<String> getSecuredValue(String key) async {
    throw UnimplementedError();
  }

  /// Save data in secure storage
  @override
  void saveValueSecurely(String key, String value) {
    throw UnimplementedError();
  }

  /// Delete data from secure storage
  @override
  void deleteSecuredValue(String key) {
    throw UnimplementedError();
  }

  /// Delete all data from secure storage
  @override
  void deleteAllSecuredValues() {
    throw UnimplementedError();
  }

  /// API to get the IP of the user
  @override
  Future<String> getIp() async => await connectHelper.getIp();

  Future<ResponseModel> getAllCategories({
    bool isLoading = false,
  }) async =>
      await connectHelper.getAllCategories(
        isLoading: isLoading,
      );

  Future<ResponseModel> postAllProduct({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String category,
    required int min,
    required int max,

    required String sortField,
    required var sortOption,
  }) async =>
      await connectHelper.postAllProduct(
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

  Future<ResponseModel> postAddToCart({
    bool isLoading = false,
    required String productId,
    required int quantity,
    required String description,
  }) async =>
      await connectHelper.postAddToCart(
        productId: productId,
        quantity: quantity,
        description: description,
        isLoading: isLoading,
      );

  Future<ResponseModel> postGetAllCartProduct({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async =>
      await connectHelper.postGetAllCartProduct(
        isLoading: isLoading,
        limit: limit,
        page: page,
      );

  Future<ResponseModel> postCartProductRemove({
    bool isLoading = false,
    required String productId,
  }) async =>
      await connectHelper.postCartProductRemove(
        productId: productId,
        isLoading: isLoading,
      );

  Future<ResponseModel> postWishlist({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async =>
      await connectHelper.postWishlist(
        page: page,
        limit: limit,
        isLoading: isLoading,
      );

  Future<ResponseModel> postWishlistAddRemove({
    bool isLoading = false,
    required String productId,
  }) async =>
      await connectHelper.postWishlistAddRemove(
        productId: productId,
        isLoading: isLoading,
      );

  Future<ResponseModel> loginApi({
    bool isLoading = false,
    required String mobile,
    required String password,
    required String fcm,
  }) async =>
      await connectHelper.loginApi(
        mobile: mobile,
        password: password,
        fcm: fcm,
        isLoading: isLoading,
      );

  Future<ResponseModel> forgotPass({
    bool isLoading = false,
    required String email,
  }) async =>
      await connectHelper.forgotPass(
        email: email,
        isLoading: isLoading,
      );

  Future<ResponseModel> getProfile({
    bool isLoading = false,
  }) async =>
      await connectHelper.getProfile(
        isLoading: isLoading,
      );

  Future<ResponseModel> postUploadProfile({
    bool isLoading = false,
    required String filePath,
  }) async =>
      await connectHelper.postUploadProfile(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<ResponseModel> repairOrderList({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async =>
      await connectHelper.repairOrderList(
        page: page,
        limit: limit,
      );

  Future<ResponseModel> repairOrderImage({
    bool isLoading = false,
    required String filePath,
  }) async =>
      await connectHelper.repairOrderImage(
        filePath: filePath,
        isLoading: isLoading,
      );

      Future<ResponseModel> uploadImage({
    bool isLoading = false,
    required String filePath,
  }) async =>
      await connectHelper.uploadImage(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<ResponseModel> sampleOrderImage({
    bool isLoading = false,
    required String filePath,
  }) async =>
      await connectHelper.sampleOrderImage(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<ResponseModel> postSampleOrder({
    bool isLoading = false,
    required List<SampleOrderImageDatum> images,
    required int totalQuantity,
    required String description,
    required String productName,
    required String priority,
    required String weight,
    required String size,
  }) async =>
      connectHelper.postSampleOrder(
        images: images,
        totalQuantity: totalQuantity,
        description: description,
        isLoading: isLoading,
        productName: productName,
        weight: weight,
        size: size,
        priority: priority,
      );

  Future<ResponseModel> postSampleOrderHistory({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async =>
      connectHelper.postSampleOrderHistory(
        page: page,
        limit: limit,
        isLoading: isLoading,
      );

  Future<ResponseModel> getOneSample({
    bool isLoading = false,
    required String sampleOrderId,
  }) async =>
      connectHelper.getOneSample(
        sampleOrderId: sampleOrderId,
        isLoading: isLoading,
      );

  Future<ResponseModel> postGetOnebag({
    bool isLoading = false,
    required String orderId,
    required String bagId,
  }) async =>
      connectHelper.postGetOnebag(
        orderId: orderId,
        bagId: bagId,
        isLoading: isLoading,
      );

  Future<ResponseModel> postOrderCreate({
    bool isLoading = false,
    required List<Product> products,
    required String main_description,
    required String cartId,
  }) async =>
      connectHelper.postOrderCreate(
        cartId: cartId,
        products: products,
        main_description: main_description,
        isLoading: isLoading,
      );

  Future<ResponseModel> postOrderHistory({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async =>
      connectHelper.postOrderHistory(
        page: page,
        limit: limit,
        isLoading: isLoading,
      );

  Future<ResponseModel> postOrderGetOne({
    bool isLoading = false,
    required String orderId,
  }) async =>
      connectHelper.postOrderGetOne(
        orderId: orderId,
        isLoading: isLoading,
      );

  Future<ResponseModel> postRepairOrder({
    bool isLoading = false,
    required String file,
    required String description,
    required String productName,
    required String priority,
    required String weight,
    required String size,
  }) async =>
      connectHelper.postRepairOrder(
        file: file,
        description: description,
        isLoading: isLoading,
        productName: productName,
        weight: weight,
        size: size,
        priority: priority,
      );

  Future<ResponseModel> getOneRepairOrder({
    bool isLoading = false,
    required String repairingOrderId,
  }) async =>
      await connectHelper.getOneRepairOrder(
        repairingOrderId: repairingOrderId,
      );

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
  }) async =>
      await connectHelper.registerApi(
        name: name,
        email: email,
        city: city,
        companyname: companyname,
        countryCode: countryCode,
        mobile: mobile,
        password: password,
        images: images,
      );
}
