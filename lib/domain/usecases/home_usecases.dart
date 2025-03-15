import 'package:ga_final/domain/domain.dart';

class HomeUseCases {
  HomeUseCases(this.repository);

  final Repository repository;

  Future<GetCategoriesModel?> getAllCategories({
    bool isLoading = false,
  }) async =>
      await repository.getAllCategories(
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

  Future<ResponseModel?> postOrderCreate({
    bool isLoading = false,
    required List<Product> productId,
    required String main_description,
    required String cartId,
  }) async =>
      await repository.postOrderCreate(
        cartId: cartId,
        products: productId,
        main_description: main_description,
        isLoading: isLoading,
      );

  Future<WishlistModel?> postWishlist({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async =>
      await repository.postWishlist(
        page: page,
        limit: limit,
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

  Future<GetProfileModel?> getProfile({
    bool isLoading = false,
  }) async =>
      await repository.getProfile(
        isLoading: isLoading,
      );
}
