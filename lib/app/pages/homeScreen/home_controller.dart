import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:ga_final/app/app.dart';
import 'package:ga_final/domain/domain.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  HomeController(this.homePresenter);

  final HomePresenter homePresenter;

  GetProfileData? getProfileModel;

  @override
  void onInit() {
    super.onInit();
    getAllCategories();
  }

  Future<void> getProfile() async {
    var response = await homePresenter.getProfile(
      isLoading: true,
    );
    getProfileModel = null;
    if (response != null) {
      getProfileModel = response.data;
      Get.find<Repository>()
          .saveValue(LocalKeys.chanelId, getProfileModel?.channelid ?? "");
      update();
    } else {
      Utility.errorMessage(response?.message ?? "");
    }
  }

  late PageController controller;

  int itemCounter = 0;

  List<String> bnnerList = [
    AssetConstants.banner1,
    AssetConstants.banner2,
    AssetConstants.banner3,
  ];

  List<String> bannerHomeList = [
    AssetConstants.home_banner1,
    AssetConstants.home_banner2,
    AssetConstants.home_banner3,
  ];

  /// >>>>>>>>>>>>>> For view all Screen <<<<<<<<<<<<<<<<<<<< ///

  int selectPage = 0;

  List<GetCategoriesData> getCategoriesList = [];

  int isSelcted = -1;

  var client = http.Client();

  bool isLoading = false;

  Future<void> getAllCategories() async {
    var response = await client.get(
      Uri.parse("https://api.gagold.in/user/categories"),
      headers: {
        'Authorization':
            'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
      },
    );

    var loginModel = getCategoriesModelFromJson(response.body);
    if (loginModel.data != null) {
      isLoading = false;
      getCategoriesList = loginModel.data ?? [];
    } else {
      isLoading = false;
      Utility.errorMessage(loginModel.message.toString());
    }
    update();

    // var response = await homePresenter.getAllCategories(
    //   isLoading: true,
    // );
    // getCategoriesList.clear();
    // if (response?.data != null) {
    //   getCategoriesList.addAll(response?.data ?? []);
    // }
  }

  final ScrollController scrollArrivalProductController = ScrollController();
  List<ProductsDoc> productArrivalDocList = [];

  int pageArrivalProductCount = 1;
  bool isProductArrivalLastPage = false;
  bool isProductArrivalLoading = false;

  Future<void> postAllProduct(String categoryId) async {
    var response = await client.post(
      Uri.parse("https://api.gagold.in/user/products"),
      headers: {
        "Content-Type": "application/json",
        'Authorization':
            'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
      },
      body: jsonEncode({
        "page": 1,
        "limit": 10,
        "search": "",
        "category": categoryId,
        "min": "",
        "max": "",
        "sortField": "_id",
        "sortOption": -1
      }),
    );
    var loginModel = productsModelFromJson(response.body);
    productArrivalDocList.clear();
    if (loginModel.data != null) {
      productArrivalDocList.addAll(loginModel.data?.docs ?? []);
    } else {
      Utility.errorMessage(loginModel.message.toString());
    }
    update();
  }

  final ScrollController scrollTrendingController = ScrollController();
  List<ProductsDoc> productTrendingDocList = [];

  int pageTrendingProductCount = 1;
  bool isProductTrendingLastPage = false;
  bool isProductTrendingLoading = false;

  Future<void> postAllTrendingProduct(int pageKey) async {
    var response = await client.post(
      Uri.parse("https://api.gagold.in/user/products"),
      headers: {
        "Content-Type": "application/json",
        'Authorization':
            'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
      },
      body: jsonEncode({
        "page": 1,
        "limit": 10,
        "search": "",
        "category": "",
        "min": "",
        "max": "",
        "productType": "trending",
        "sortField": "_id",
        "sortOption": -1
      }),
    );
    var loginModel = productsModelFromJson(response.body);
    productTrendingDocList.clear();
    if (loginModel.data != null) {
      productTrendingDocList.addAll(loginModel.data?.docs ?? []);
    } else {
      Utility.errorMessage(loginModel.message.toString());
    }
    // var response = await homePresenter.postAllProduct(
    //   page: pageKey,
    //   limit: 10,
    //   search: "",
    //   category: "",
    //   min: "",
    //   max: "",
    //   productType: "trending",
    //   sortField: 'weight',
    //   sortOption: 1,
    //   isLoading: true,
    // );
    // if (response?.data != null) {
    //   if (pageKey == 1) {
    //     isProductTrendingLastPage = false;
    //     productTrendingDocList.clear();
    //   }
    //   if ((response?.data?.docs?.length ?? 0) < 10) {
    //     isProductTrendingLastPage = true;
    //     productTrendingDocList.addAll(response?.data?.docs ?? []);
    //   } else {
    //     pageTrendingProductCount++;
    //     productTrendingDocList.addAll(response?.data?.docs ?? []);
    //   }
    //   if (pageKey == 1) {
    //     if (scrollTrendingController.positions.isNotEmpty) {
    //       scrollTrendingController.jumpTo(0);
    //     }
    //   }
    //   postWishlist(1);
    // } else {
    //   Utility.errorMessage(response?.message ?? "");
    // }
    update();
  }

  List<ProductsDoc> getAllProductDocList = [];
  final ScrollController scrollViewAllController = ScrollController();

  bool isSearchLoading = false;

  Future<void> postGetAllProduct(int pageKey, String search) async {
    if (pageKey == 1) {
      pageTrendingProductCount = 1;
    }
    var response = await homePresenter.postAllProduct(
      page: pageKey,
      limit: 10,
      search: search,
      category: "",
      min: "",
      max: "",
      sortField: '_id',
      sortOption: 1,
      isLoading: false,
    );
    if (response?.data != null) {
      if (pageKey == 1) {
        isProductTrendingLastPage = false;
        getAllProductDocList.clear();
      }
      if ((response?.data?.docs?.length ?? 0) < 10) {
        isProductTrendingLastPage = true;
        getAllProductDocList.addAll(response?.data?.docs ?? []);
      } else {
        pageTrendingProductCount++;
        getAllProductDocList.addAll(response?.data?.docs ?? []);
      }
      if (pageKey == 1) {
        if (scrollTrendingController.positions.isNotEmpty) {
          scrollTrendingController.jumpTo(0);
        }
      }
      isSearchLoading = false;
    } else {
      isSearchLoading = false;
      Utility.errorMessage(response?.message ?? "");
    }
    update();
  }

  // Future<void> postAddToCart(
  //     String productId, int quantity, int index, String productType) async {
  //   var response = await homePresenter.postAddToCart(
  //     productId: productId,
  //     quantity: quantity,
  //     description: "",
  //     isLoading: false,
  //   );
  //   if (response?.statusCode == 200) {
  //     if (productType.contains("arrival")) {
  //       productArrivalDocList[index].inCart = true;
  //     } else if (productType.contains('wishlist')) {
  //       wishlistList[index].inCart = true;
  //     } else {
  //       productTrendingDocList[index].inCart = true;
  //     }
  //     Utility.snacBar(
  //         "Product added in cart successfully...!", ColorsValue.appColor);
  //   } else {
  //     if (productType.contains("arrival")) {
  //       productArrivalDocList[index].cartQuantity = 0;
  //     } else {
  //       productTrendingDocList[index].cartQuantity = 0;
  //     }
  //     Utility.errorMessage(jsonDecode(response?.data ?? "")["Message"]);
  //   }
  //   update();
  // }

  Future<void> postAddToCart(
      String productId, int quantity, int index, String productType) async {
    var response = await client.post(
      Uri.parse("https://api.gagold.in/user/cart/save"),
      headers: {
        "Content-Type": "application/json",
        'Authorization':
            'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
      },
      body: jsonEncode({
        "productId": productId,
        "quantity": quantity,
        "description": "",
      }),
    );
    // var loginModel = productsModelFromJson(response.body);
    // productArrivalDocList.clear();
    // if (loginModel.data != null) {
    //   productArrivalDocList.addAll(loginModel.data?.docs ?? []);
    // } else {
    //   Utility.errorMessage(loginModel.message.toString());
    // }
    if (response.statusCode == 200) {
      if (productType.contains("arrival")) {
        productArrivalDocList[index].inCart = true;
      } else if (productType.contains('wishlist')) {
        wishlistList[index].inCart = true;
      } else {
        productTrendingDocList[index].inCart = true;
      }
      Utility.snacBar(
          "Product added in cart successfully...!", ColorsValue.buttomColor);
    } else {
      if (productType.contains("arrival")) {
        productArrivalDocList[index].cartquantity = 0;
      } else {
        productTrendingDocList[index].cartquantity = 0;
      }
      Utility.errorMessage(jsonDecode(response.body)["Message"]);
    }
    update();
  }

  final ScrollController scrollWishListController = ScrollController();

  List<WishlistDoc> wishlistList = [];
  List<WishlistDoc> wishlistCount = [];
  bool isWishListLastPage = false;
  bool isWishListLoading = false;
  int pageWishCount = 1;
  bool isWishLoading = true;

  Future<void> postWishlist(int pageKey) async {
    if (pageKey == 1) {
      pageWishCount = 1;
    }

    var response = await client.post(
      Uri.parse("https://api.gagold.in/user/wishlist"),
      headers: {
        "Content-Type": "application/json",
        'Authorization':
            'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
      },
      body: jsonEncode({
        "page": pageKey,
        "limit": 10,
      }),
    );
    var loginModel = wishlistModelFromJson(response.body);
    wishlistList.clear();
    if (loginModel.data != null) {
      if (pageKey == 1) {
        isWishListLastPage = false;
        wishlistList.clear();
      }

      wishlistCount.addAll(loginModel.data?.docs ?? []);
      if ((loginModel.data?.docs?.length ?? 0) < 10) {
        isWishListLastPage = true;
        wishlistList.addAll(loginModel.data?.docs ?? []);
      } else {
        pageWishCount++;
        wishlistList.addAll(loginModel.data?.docs ?? []);
      }
      if (pageKey == 1) {
        if (scrollWishListController.positions.isNotEmpty) {
          scrollWishListController.jumpTo(0);
        }
      }
      isWishLoading = false;
    }
    update();
  }

  TextEditingController buyNowDesController = TextEditingController();

  // Future<void> postWishlistAddRemove(
  //     String productsDoc, int index, bool isRemove) async {
  //   var response = await homePresenter.postWishlistAddRemove(
  //     productId: productsDoc,
  //     isLoading: false,
  //   );
  //   if (response?.data != null) {
  //     if (isRemove) wishlistList.removeAt(index);
  //     postAllProduct();
  //     postWishlist(1);
  //     postAllTrendingProduct(1);
  //   }
  //   update();
  // }

  Future<void> postWishlistAddRemove(
      String productsDoc, int index, bool isRemove) async {
    var response = await client.post(
      Uri.parse("https://api.gagold.in/user/wishlist/add"),
      headers: {
        "Content-Type": "application/json",
        'Authorization':
            'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
      },
      body: jsonEncode({
        "productid": productsDoc,
      }),
    );
    if (response.body.isNotEmpty) {
      if (isRemove) {
        wishlistList.removeAt(index);
      }
      postAllProduct(
        isSelcted == -1 ? '' : (getCategoriesList[isSelcted].id ?? ''),
      );
      postWishlist(1);
      postWishlistCount();
    }
    update();
  }

  int? wishListCount;

  Future<void> postWishlistCount() async {
    var response = await client.get(
      Uri.parse("https://api.gagold.in/user/wishlist/count"),
      headers: {
        "Content-Type": "application/json",
        'Authorization':
            'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
      },
    );
    wishListCount = null;
    if (response.body.isNotEmpty) {
      wishListCount = jsonDecode(response.body)['Data'];
    }
    update();
  }
}
