import 'dart:convert';

import 'package:Ga_Gold/app/app.dart';
import 'package:Ga_Gold/domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeController extends GetxController {
  HomeController(this.homePresenter);

  final HomePresenter homePresenter;

  GetProfileData? getProfileModel;

  @override
  void onInit() {
    super.onInit();
    if (Utility.isLoginOrNot()) {
      getAllCategories();
    }
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

  int pageArrivalProductCount = 1;
  bool isProductArrivalLastPage = false;
  bool isProductArrivalLoading = false;

  // PagingController<int, RepairOrderHistoryDoc> repairOrderPagingController =
  //     PagingController(firstPageKey: 1);
  //
  // Future<void> postAllProduct(String categoryId) async {
  //   var response = await client.post(
  //     Uri.parse("https://api.gagold.in/user/products"),
  //     headers: {
  //       "Content-Type": "application/json",
  //       'Authorization':
  //           'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
  //     },
  //     body: jsonEncode({
  //       "page": 1,
  //       "limit": 10,
  //       "search": "",
  //       "category": categoryId,
  //       "min": "",
  //       "max": "",
  //       "sortField": "_id",
  //       "sortOption": -1
  //     }),
  //   );
  //   var loginModel = productsModelFromJson(response.body);
  //   productArrivalDocList.clear();
  //   if (loginModel.data != null) {
  //     productArrivalDocList.addAll(loginModel.data?.docs ?? []);
  //   } else {
  //     Utility.errorMessage(loginModel.message.toString());
  //   }
  //   update();
  // }

  final ScrollController scrollTrendingController = ScrollController();
  List<ProductsDoc> productTrendingDocList = [];

  int pageTrendingProductCount = 1;
  bool isProductTrendingLastPage = false;
  bool isProductTrendingLoading = false;

  // Future<void> postAllTrendingProduct(int pageKey) async {
  //   var response = await client.post(
  //     Uri.parse("https://api.gagold.in/user/products"),
  //     headers: {
  //       "Content-Type": "application/json",
  //       'Authorization':
  //           'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
  //     },
  //     body: jsonEncode({
  //       "page": pageKey,
  //       "limit": 10,
  //       "search": "",
  //       "category": "",
  //       "min": "",
  //       "max": "",
  //       "productType": "trending",
  //       "sortField": "_id",
  //       "sortOption": -1
  //     }),
  //   );
  //   var loginModel = productsModelFromJson(response.body);
  //   productTrendingDocList.clear();
  //   if (loginModel.data != null) {
  //     productTrendingDocList.addAll(loginModel.data?.docs ?? []);
  //   } else {
  //     Utility.errorMessage(loginModel.message.toString());
  //   }
  //   // var response = await homePresenter.postAllProduct(
  //   //   page: pageKey,
  //   //   limit: 10,
  //   //   search: "",
  //   //   category: "",
  //   //   min: "",
  //   //   max: "",
  //   //   productType: "trending",
  //   //   sortField: 'weight',
  //   //   sortOption: 1,
  //   //   isLoading: true,
  //   // );
  //   // if (response?.data != null) {
  //   //   if (pageKey == 1) {
  //   //     isProductTrendingLastPage = false;
  //   //     productTrendingDocList.clear();
  //   //   }
  //   //   if ((response?.data?.docs?.length ?? 0) < 10) {
  //   //     isProductTrendingLastPage = true;
  //   //     productTrendingDocList.addAll(response?.data?.docs ?? []);
  //   //   } else {
  //   //     pageTrendingProductCount++;
  //   //     productTrendingDocList.addAll(response?.data?.docs ?? []);
  //   //   }
  //   //   if (pageKey == 1) {
  //   //     if (scrollTrendingController.positions.isNotEmpty) {
  //   //       scrollTrendingController.jumpTo(0);
  //   //     }
  //   //   }
  //   //   postWishlist(1);
  //   // } else {
  //   //   Utility.errorMessage(response?.message ?? "");
  //   // }
  //   update();
  // }

  List<ProductsDoc> getAllProductDocList = [];
  final ScrollController scrollViewAllController = ScrollController();
  PagingController<int, ProductsDoc> productDocPagingController =
      PagingController(firstPageKey: 1);
  int repairLimit = 10;

  bool isSearchLoading = false;

  // Future<void> postGetAllProduct({
  //   required int pageKey,
  //   String? search,
  //   String? categoryId,
  // }) async {
  //   try {
  //     print("Fetching page: $pageKey, Search: $search, Category: $categoryId");
  //
  //     if (pageKey == 1) {
  //       pageTrendingProductCount = 1;
  //       getAllProductDocList.clear();
  //       print("Cleared old data. Ready to fetch new data.");
  //     }
  //
  //     var response = await homePresenter.postAllProduct(
  //       page: pageKey,
  //       limit: repairLimit,
  //       search: search ?? '',
  //       category: categoryId ?? '',
  //       min: "",
  //       max: "",
  //       sortField: '_id',
  //       sortOption: 1,
  //       isLoading: false,
  //     );
  //
  //     if (response?.data?.docs != null) {
  //       final newItems = response!.data!.docs!;
  //       print("Received ${newItems.length} items from API");
  //
  //       // Append new data correctly
  //       if (pageKey == 1) {
  //         getAllProductDocList = newItems;
  //       } else {
  //         getAllProductDocList.addAll(newItems);
  //       }
  //
  //       // Check if this is the last page
  //       final isLastPage = newItems.length < repairLimit;
  //       if (isLastPage) {
  //         print("Last page reached.");
  //         productDocPagingController.appendLastPage(newItems);
  //       } else {
  //         final nextPageKey = pageKey + 1;
  //         print("Appending data. Next page key: $nextPageKey");
  //         productDocPagingController.appendPage(newItems, nextPageKey);
  //       }
  //     } else {
  //       print("API response is empty or invalid.");
  //       Utility.errorMessage(response?.message ?? "Unknown Error");
  //     }
  //   } catch (error) {
  //     print("Error occurred: $error");
  //     Utility.errorMessage(error.toString());
  //     productDocPagingController.error = error;
  //   } finally {
  //     isSearchLoading = false;
  //     update();
  //   }
  // }

  int currentPage = 1;
  bool hasMore = true;

  void onScroll() {
    if (scrollViewAllController.position.pixels ==
            scrollViewAllController.position.maxScrollExtent &&
        hasMore) {
      postGetAllProduct();
    }
  }

  List<NoTokenProduct> isNotLoginProduct = [
    NoTokenProduct(
      title: 'Ring 1',
      weight: 3.7,
      image: 'assets/images/Product.png',
    ),
    NoTokenProduct(
      title: 'Ring 2',
      weight: 3,
      image: 'assets/images/Product (1).png',
    ),
    NoTokenProduct(
      title: 'Ring 3',
      weight: 4.7,
      image: 'assets/images/Product (2).png',
    ),
    NoTokenProduct(
      title: 'Ring 4',
      weight: 7.5,
      image: 'assets/images/Product (3).png',
    )
  ];

  TextEditingController searchController = TextEditingController();
  Future<void> postGetAllProduct({
    String? search,
    String? categoryId,
  }) async {
    if (isLoading || !hasMore) return;
    isLoading = true;
    // Fetch data from the API
    var response = await homePresenter.postAllProduct(
      page: currentPage,
      limit: repairLimit,
      search: searchController.text ?? '',
      category: categoryId ?? '',
      min: "0",
      max: "1000",
      sortField: '_id',
      sortOption: 1,
      isLoading: false,
    );
    if (response?.data?.docs != null) {
      getAllProductDocList.addAll(response?.data?.docs ?? []);
      currentPage++;
      isLoading = false;
      // Check if there are more items to load
      if (response?.data?.docs?.isEmpty ?? false) {
        hasMore = false;
      }
      update();
    } else {
      isLoading = false;
      throw Exception('Failed to load data');
    }
    update();
  }

  // Future<void> postGetAllProduct(
  //     {required int pageKey, String? search, String? categoryId}) async {
  //   if (pageKey == 1) {
  //     pageTrendingProductCount = 1;
  //   }
  //   var response = await homePresenter.postAllProduct(
  //     page: pageKey ?? 1,
  //     limit: repairLimit,
  //     search: search ?? '',
  //     category: categoryId ?? '',
  //     min: "",
  //     max: "",
  //     sortField: '_id',
  //     sortOption: 1,
  //     isLoading: false,
  //   );
  //   if (response?.data != null) {
  //     if (pageKey == 1) {
  //       getAllProductDocList.clear();
  //     }
  //     getAllProductDocList = response?.data?.docs ?? [];
  //
  //     final isLastPage = getAllProductDocList.length < repairLimit;
  //     if (isLastPage) {
  //       productDocPagingController.appendLastPage(getAllProductDocList);
  //     } else {
  //       var nextPageKey = pageKey + 1;
  //       productDocPagingController.appendPage(
  //           getAllProductDocList, nextPageKey);
  //     }
  //     isSearchLoading = false;
  //   } else {
  //     isSearchLoading = false;
  //     Utility.errorMessage(response!.message.toString());
  //   }
  //   update();
  // }

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
    Utility.closeSnackbar();
    if (response.statusCode == 200) {
      if (productType.contains("arrival")) {
        getAllProductDocList[index].inCart = true;
      } else if (productType.contains('wishlist')) {
        wishlistList[index].inCart = true;
      } else {
        productTrendingDocList[index].inCart = true;
      }
      postWishlist(1);
      Utility.snacBar(
          "Product added in cart successfully...!", ColorsValue.buttomColor);
    } else {
      if (productType.contains("arrival")) {
        getAllProductDocList[index].cartquantity = 0;
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
    if (response.statusCode == 200) {
      if (isRemove) {
        wishlistList.removeAt(index);
        hasMore = true;
        currentPage = 1;
        getAllProductDocList.clear();
        postGetAllProduct();
      } else {
        if (getAllProductDocList[index].wishlistStatus ?? false) {
          getAllProductDocList[index].wishlistStatus = false;
        } else {
          getAllProductDocList[index].wishlistStatus = true;
        }
      }

      update();
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
      update();
    }
  }
}

class NoTokenProduct {
  final String title;

  final double weight;
  final String image;

  NoTokenProduct({
    required this.title,
    required this.weight,
    required this.image,
  });

  // Factory constructor for JSON deserialization
  factory NoTokenProduct.fromJson(Map<String, dynamic> json) {
    return NoTokenProduct(
      title: json['title'] ?? '',
      weight: (json['weight'] ?? 0.0).toDouble(),
      image: json['image'] ?? '',
    );
  }

  // Method for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'weight': weight,
      'image': image,
    };
  }
}
