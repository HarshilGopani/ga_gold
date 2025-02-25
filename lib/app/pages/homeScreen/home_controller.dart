import 'package:flutter/material.dart';
import 'package:ga_gold/app/app.dart';
import 'package:get/get.dart';

import '../../../domain/domain.dart';

class HomeController extends GetxController {
  HomeController(this.homePresenter);

  final HomePresenter homePresenter;

  // @override
  // onInit() {
  //   super.onInit();
  //   getProfile();
  //   isLoading = true;
  //   getAllCategories();
  // }

  // GetProfileData? getProfileModel;

  // Future<void> getProfile() async {
  //   var response = await homePresenter.getProfile(
  //     isLoading: true,
  //   );
  //   getProfileModel = null;
  //   if (response != null) {
  //     getProfileModel = response.data;
  //     Get.find<Repository>()
  //         .saveValue(LocalKeys.chanelId, getProfileModel?.channelid ?? "");
  //     update();
  //   } else {
  //     Utility.errorMessage(response?.message ?? "");
  //   }
  // }

  late PageController controller;

  int itemCounter = 0;

  List<String> testList = ["fds", "Fsdf", "bcsdbc"];

  // /// >>>>>>>>>>>>>> For view all Screen <<<<<<<<<<<<<<<<<<<< ///

  int selectPage = 0;

  List<GetCategoriesData> getCategoriesList = [
    GetCategoriesData(
      id: '',
      image: 'assets/images/ring.png',
      name: "ring",
    ),
    GetCategoriesData(
      id: '',
      image: 'assets/images/ring.png',
      name: "ring",
    ),
    GetCategoriesData(
      id: '',
      image: 'assets/images/ring.png',
      name: "ring",
    ),
    GetCategoriesData(
      id: '',
      image: 'assets/images/ring.png',
      name: "ring",
    ),
  ];

  // var client = http.Client();

  bool isLoading = false;

  // Future<void> getAllCategories() async {
  //   var response = await client.get(
  //     Uri.parse("https://api.krishnaornaments.com/user/categories"),
  //     headers: {
  //       'Authorization':
  //           'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
  //     },
  //   );

  // var loginModel = getCategoriesModelFromJson(response.body);
  //   if (loginModel.data != null) {
  //     isLoading = false;
  //     getCategoriesList = loginModel.data ?? [];
  //   } else {
  //     isLoading = false;
  //     Utility.errorMessage(loginModel.message.toString());
  //   }
  //   update();

  //   // var response = await homePresenter.getAllCategories(
  //   //   isLoading: true,
  //   // );
  //   // getCategoriesList.clear();
  //   // if (response?.data != null) {
  //   //   getCategoriesList.addAll(response?.data ?? []);
  //   // }
  // }

  final ScrollController scrollArrivalProductController = ScrollController();
  List<ProductsDoc> productArrivalDocList = [
    ProductsDoc(
        cartQuantity: 1,
        weight: 200,
        status: true,
        inCart: false,
        quantity: 2,
        wishlistStatus: false,
        name: 'Ring',
        image: AssetConstants.ring),
    ProductsDoc(
        cartQuantity: 1,
        inCart: false,
        quantity: 2,
        wishlistStatus: false,
        name: 'Ring',
        image: AssetConstants.ring),
    ProductsDoc(
        cartQuantity: 1,
        inCart: false,
        quantity: 2,
        wishlistStatus: false,
        name: 'Ring',
        image: AssetConstants.ring),
  ];

  int pageArrivalProductCount = 1;
  bool isProductArrivalLastPage = false;
  bool isProductArrivalLoading = false;

  // Future<void> postAllProduct() async {
  //   var response = await client.post(
  //     Uri.parse("https://api.krishnaornaments.com/user/products"),
  //     headers: {
  //       "Content-Type": "application/json",
  //       'Authorization':
  //           'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
  //     },
  //     body: jsonEncode({
  //       "page": 1,
  //       "limit": 10,
  //       "search": "",
  //       "category": "",
  //       "min": "",
  //       "max": "",
  //       "productType": "arrival",
  //       "sortField": "_id",
  //       "sortOption": -1
  //     }),
  //   );
  //   var loginModel = productsModelFromJson(response.body);
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
  //     Uri.parse("https://api.krishnaornaments.com/user/products"),
  //     headers: {
  //       "Content-Type": "application/json",
  //       'Authorization':
  //           'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
  //     },
  //     body: jsonEncode({
  //       "page": 1,
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
  //   isLoading: true,
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

  List<ProductsDoc> getAllProductDocList = [ProductsDoc(),ProductsDoc(),ProductsDoc(),ProductsDoc(),ProductsDoc(),ProductsDoc(),ProductsDoc()];
  final ScrollController scrollViewAllController = ScrollController();

  bool isSearchLoading = false;

  // Future<void> postGetAllProduct(int pageKey, String search) async {
  //   if (pageKey == 1) {
  //     pageTrendingProductCount = 1;
  //   }
  //   var response = await homePresenter.postAllProduct(
  //     page: pageKey,
  //     limit: 10,
  //     search: search,
  //     category: "",
  //     min: "",
  //     max: "",
  //     productType: "",
  //     sortField: '_id',
  //     sortOption: 1,
  //     isLoading: false,
  //   );
  //   if (response?.data != null) {
  //     if (pageKey == 1) {
  //       isProductTrendingLastPage = false;
  //       getAllProductDocList.clear();
  //     }
  //     if ((response?.data?.docs?.length ?? 0) < 10) {
  //       isProductTrendingLastPage = true;
  //       getAllProductDocList.addAll(response?.data?.docs ?? []);
  //     } else {
  //       pageTrendingProductCount++;
  //       getAllProductDocList.addAll(response?.data?.docs ?? []);
  //     }
  //     if (pageKey == 1) {
  //       if (scrollTrendingController.positions.isNotEmpty) {
  //         scrollTrendingController.jumpTo(0);
  //       }
  //     }
  //     isSearchLoading = false;
  //   } else {
  //     isSearchLoading = false;
  //     Utility.errorMessage(response?.message ?? "");
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

  final ScrollController scrollWishListController = ScrollController();

  List<WishlistDoc> wishlistList = [];
  List<WishlistDoc> wishlistCount = [];
  bool isWishListLastPage = false;
  bool isWishListLoading = false;
  int pageWishCount = 1;
  bool isWishLoading = true;

  // Future<void> postWishlist(int pageKey) async {
  //   if (pageKey == 1) {
  //     pageWishCount = 1;
  //   }
  //   var response = await homePresenter.postWishlist(
  //     page: pageKey,
  //     limit: 10,
  //     isLoading: true,
  //   );
  //   wishlistCount.clear();
  //   if (response?.data != null) {
  //     if (pageKey == 1) {
  //       isWishListLastPage = false;
  //       wishlistList.clear();
  //     }

  //     wishlistCount.addAll(response?.data?.docs ?? []);
  //     if ((response?.data?.docs?.length ?? 0) < 10) {
  //       isWishListLastPage = true;
  //       wishlistList.addAll(response?.data?.docs ?? []);
  //     } else {
  //       pageWishCount++;
  //       wishlistList.addAll(response?.data?.docs ?? []);
  //     }
  //     if (pageKey == 1) {
  //       if (scrollWishListController.positions.isNotEmpty) {
  //         scrollWishListController.jumpTo(0);
  //       }
  //     }
  //     isWishLoading = false;
  //   }
  //   update();
  // }

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
}
