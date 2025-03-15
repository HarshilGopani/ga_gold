import 'package:ga_final/domain/domain.dart';

class HomePresenter {
  HomePresenter(this.homeUseCases, this.commonUsecases);

  final HomeUseCases homeUseCases;
  final CommonUsecases commonUsecases;

  Future<GetCategoriesModel?> getAllCategories({
    bool isLoading = false,
  }) async =>
      await homeUseCases.getAllCategories(
        isLoading: isLoading,
      );

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
      await commonUsecases.postAllProduct(
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
      await commonUsecases.postAddToCart(
        productId: productId,
        quantity: quantity,
        description: description,
        isLoading: isLoading,
      );

  Future<ResponseModel?> postOrderCreate({
    bool isLoading = false,
    required List<Product> productId,
    required String main_description,
  }) async =>
      await homeUseCases.postOrderCreate(
        cartId: '',
        productId: productId,
        main_description: main_description,
        isLoading: isLoading,
      );

  Future<WishlistModel?> postWishlist({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async =>
      await homeUseCases.postWishlist(
        page: page,
        limit: limit,
        isLoading: isLoading,
      );

  Future<ResponseModel?> postWishlistAddRemove({
    bool isLoading = false,
    required String productId,
  }) async =>
      await homeUseCases.postWishlistAddRemove(
        productId: productId,
        isLoading: isLoading,
      );

  Future<GetProfileModel?> getProfile({
    bool isLoading = false,
  }) async =>
      await homeUseCases.getProfile(
        isLoading: isLoading,
      );
}
