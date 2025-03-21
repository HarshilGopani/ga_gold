import 'package:Ga_Gold/domain/domain.dart';

class ShoppingCartUsecases {
  ShoppingCartUsecases(this.repository);

  final Repository repository;

  // Future<ResponseModel?> postCardRemove({
  //   bool isLoading = false,
  //   required String productId,
  // }) async =>
  //     await repository.postCardRemove(
  //       productId: productId,
  //       isLoading: isLoading,
  //     );

  Future<CartItemModel?> postGetAllCartProduct({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async =>
      await repository.postGetAllCartProduct(
        isLoading: isLoading,
        limit: limit,
        page: page,
      );

  Future<ResponseModel?> postCartProductRemove({
    bool isLoading = false,
    required String productId,
  }) async =>
      await repository.postCartProductRemove(
        isLoading: isLoading,
        productId: productId,
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

  Future<ResponseModel?> postWishlistAddRemove({
    bool isLoading = false,
    required String productId,
  }) async =>
      await repository.postWishlistAddRemove(
        productId: productId,
        isLoading: isLoading,
      );
}
