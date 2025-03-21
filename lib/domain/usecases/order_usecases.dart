import 'package:Ga_Gold/domain/domain.dart';

class OrderUsecases {
  OrderUsecases(this.repository);

  final Repository repository;

  Future<GetOrderHistoryModel?> postOrderHistory({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async =>
      await repository.postOrderHistory(
        page: page,
        limit: limit,
        isLoading: isLoading,
      );

  Future<GetOneOrderModel?> postOrderGetOne({
    bool isLoading = false,
    required String orderId,
  }) async =>
      await repository.postOrderGetOne(
        orderId: orderId,
        isLoading: isLoading,
      );

  Future<GetOneBagModel?> postGetOnebag({
    bool isLoading = false,
    required String orderId,
    required String bagId,
  }) async =>
      await repository.postGetOnebag(
        orderId: orderId,
        bagId: bagId,
        isLoading: isLoading,
      );

  Future<ResponseModel?> postOrderCreate({
    bool isLoading = false,
    required List<Product> products,
    required String main_description,
    required String cartId,
  }) async =>
      await repository.postOrderCreate(
        cartId: cartId,
        products: products,
        main_description: main_description,
        isLoading: isLoading,
      );
}
