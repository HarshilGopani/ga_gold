

import '../../../domain/domain.dart';

class ShoppingCartPresenter {
  ShoppingCartPresenter(this.shoppingCartUsecases, this.commonUsecases);

  final ShoppingCartUsecases shoppingCartUsecases;
  final CommonUsecases commonUsecases;

  // Future<CartItemModel?> postGetAllCartProduct({
  //   bool isLoading = false,
  //   required int page,
  //   required int limit,
  // }) async =>
  //     await shoppingCartUsecases.postGetAllCartProduct(
  //       isLoading: isLoading,
  //       limit: limit,
  //       page: page,
  //     );

  // Future<ResponseModel?> postCartProductRemove({
  //   bool isLoading = false,
  //   required String productId,
  // }) async =>
  //     await shoppingCartUsecases.postCartProductRemove(
  //       isLoading: isLoading,
  //       productId: productId,
  //     );

  // Future<ProductsModel?> postAllProduct({
  //   bool isLoading = false,
  //   required int page,
  //   required int limit,
  //   required String search,
  //   required String category,
  //   required String min,
  //   required String max,
  //   required String productType,
  //   required String sortField,
  //   required var sortOption,
  // }) async =>
  //     await commonUsecases.postAllProduct(
  //       page: page,
  //       limit: limit,
  //       search: search,
  //       category: category,
  //       min: min,
  //       max: max,
  //       productType: productType,
  //       sortField: sortField,
  //       sortOption: sortOption,
  //       isLoading: isLoading,
  //     );

  // Future<ResponseModel?> postAddToCart({
  //   bool isLoading = false,
  //   required String productId,
  //   required int quantity,
  //   required String description,
  // }) async =>
  //     await commonUsecases.postAddToCart(
  //       productId: productId,
  //       quantity: quantity,
  //       description: description,
  //       isLoading: isLoading,
  //     );

  // Future<ResponseModel?> postOrderCreate({
  //   bool isLoading = false,
  //   required List<Product> products,
  //   required String main_description,
  //   required String cartId,
  // }) async =>
  //     await shoppingCartUsecases.postOrderCreate(
  //       cartId: cartId,
  //       products: products,
  //       main_description: main_description,
  //       isLoading: isLoading,
  //     );

  // Future<ResponseModel?> postWishlistAddRemove({
  //   bool isLoading = false,
  //   required String productId,
  // }) async =>
  //     await shoppingCartUsecases.postWishlistAddRemove(
  //       productId: productId,
  //       isLoading: isLoading,
  //     );
}
