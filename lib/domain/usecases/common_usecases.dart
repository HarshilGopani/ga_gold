import 'package:Ga_Gold/domain/domain.dart';

class CommonUsecases {
  CommonUsecases(this.repository);

  final Repository repository;

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
  }) async =>
      await repository.postAllProduct(
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

  Future<ResponseModel?> postAddToCart({
    bool isLoading = false,
    required String productId,
    required int quantity,
    required String description,
  }) async =>
      await repository.postAddToCart(
        productId: productId,
        quantity: quantity,
        description: description,
        isLoading: isLoading,
      );
}
