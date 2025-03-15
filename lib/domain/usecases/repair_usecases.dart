import 'package:ga_final/domain/domain.dart';

class RepairUsecases {
  RepairUsecases(this.repository);

  final Repository repository;

  Future<RepairOrderHistoryModel?> repairOrderList({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async =>
      await repository.repairOrderList(
        page: page,
        limit: limit,
        isLoading: isLoading,
      );

  Future<GetOneRepairOrderModel?> getOneRepairOrder({
    bool isLoading = false,
    required String repairingOrderId,
  }) async =>
      await repository.getOneRepairOrder(
        repairingOrderId: repairingOrderId,
        isLoading: isLoading,
      );

  Future<RepairOrderUploadImageApi?> repairOrderImage({
    bool isLoading = false,
    required String filePath,
  }) async =>
      await repository.repairOrderImage(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<SampleOrderImage?> sampleOrderImage({
    bool isLoading = false,
    required String filePath,
  }) async =>
      await repository.sampleOrderImage(
        filePath: filePath,
        isLoading: isLoading,
      );

  Future<ResponseModel?> postSampleOrder({
    bool isLoading = false,
    required List<SampleOrderImageDatum> images,
    required int totalQuantity,
    required String description,
    required String productName,
    required String priority,
    required String weight,
    required String size,
  }) async =>
      await repository.postSampleOrder(
        images: images,
        totalQuantity: totalQuantity,
        description: description,
        productName: productName,
        weight: weight,
        size: size,
        priority: priority,
        isLoading: isLoading,
      );

  Future<SampleOrderHistoryModel?> postSampleOrderHistory({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async =>
      await repository.postSampleOrderHistory(
        page: page,
        limit: limit,
        isLoading: isLoading,
      );

  Future<GetOneSampleModel?> getOneSample({
    bool isLoading = false,
    required String sampleOrderId,
  }) async =>
      await repository.getOneSample(
        sampleOrderId: sampleOrderId,
        isLoading: isLoading,
      );

  Future<ResponseModel?> postRepairOrder({
    bool isLoading = false,
    required String file,
    required String description,required String productName,
    required String priority,
    required String weight,
    required String size,

  }) async =>
      await repository.postRepairOrder(
        file: file,
        description: description,
        isLoading: isLoading,
        productName: productName,
        weight: weight,
        size: size,
        priority: priority,
      );
}
