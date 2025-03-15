// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ga_final/app/app.dart';
import 'package:ga_final/app/navigators/navigators.dart';
import 'package:ga_final/domain/domain.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ShoppingCartController extends GetxController {
  ShoppingCartController(this.shoppingCartPresenter);

  final ShoppingCartPresenter shoppingCartPresenter;

  GlobalKey<FormState> productKey = GlobalKey<FormState>();
  GlobalKey<FormState> finalKey = GlobalKey<FormState>();
  TextEditingController productDesController = TextEditingController();
  List<TextEditingController>? goldPurityController;
  List<TextEditingController>? weightController ;
  List<TextEditingController>? sizeController ;
  TextEditingController finalDesController = TextEditingController();

  List<CartItemProductElement> list = [];

  List<String> filterType = [
    'Weight'.tr,
    'Stock'.tr,
  ];

  int filterStock = 0;

  showFinalDescription(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      barrierColor: Colors.grey.withOpacity(0.5),
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Form(
                key: finalKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Container(
                  padding: Dimens.edgeInsets20_30_20_30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimens.twelve),
                      topRight: Radius.circular(Dimens.twelve),
                    ),
                    color: ColorsValue.color9C9C9C,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'final_des'.tr,
                        style: Styles.whiteW80024,
                      ),
                      Dimens.boxHeight20,
                      Row(
                        children: [
                          Text(
                            'description'.tr,
                            style: Styles.whiteW60012,
                          ),
                          Dimens.boxWidth3,
                          Text(
                            "*",
                            textAlign: TextAlign.start,
                            style: Styles.whiteW60012,
                          )
                        ],
                      ),
                      Dimens.boxHeight5,
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 40,
                              color: Colors.black12,
                            ),
                          ],
                        ),
                        child: TextFormField(
                          style: Styles.txtBlackColorW50014,
                          controller: finalDesController,
                          maxLines: 3,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'enter_final_product_des'.tr;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            counterText: '',
                            contentPadding: Dimens.edgeInsets10,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimens.zero, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(Dimens.five),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimens.zero, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(Dimens.five),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimens.zero, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(Dimens.five),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimens.zero, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(Dimens.five),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimens.zero, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(Dimens.five),
                            ),
                            filled: true,
                            fillColor: ColorsValue.colorDFDFDF,
                          ),
                        ),
                      ),
                      Dimens.boxHeight30,
                      ElevatedButton(
                        onPressed: () {
                          if (finalKey.currentState!.validate()) {
                            Get.back();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            double.maxFinite,
                            Dimens.fourtyFive,
                          ),
                          backgroundColor: ColorsValue.appColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              Dimens.twelve,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'place_order'.tr,
                            style: Styles.whiteW80014,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  showProductDescription(
      BuildContext context, CartItemProductElement item, int index) {
    productDesController.clear();
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      barrierColor: Colors.grey.withOpacity(0.5),
      backgroundColor: ColorsValue.color9C9C9C,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Form(
                key: productKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Container(
                  padding: Dimens.edgeInsets20_30_20_30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimens.twelve),
                      topRight: Radius.circular(Dimens.twelve),
                    ),
                    color: ColorsValue.color9C9C9C,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'product_des'.tr,
                        style: Styles.whiteW80024,
                      ),
                      Dimens.boxHeight20,
                      Text(
                        'description'.tr,
                        style: Styles.whiteW60012,
                      ),
                      Dimens.boxHeight5,
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 40,
                              color: Colors.black12,
                            ),
                          ],
                        ),
                        child: TextFormField(
                          style: Styles.txtBlackColorW50014,
                          controller: productDesController,
                          maxLines: 3,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'enter_product_des'.tr;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            counterText: '',
                            contentPadding: Dimens.edgeInsets10,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimens.zero, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(Dimens.five),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimens.zero, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(Dimens.five),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimens.zero, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(Dimens.five),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimens.zero, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(Dimens.five),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: Dimens.zero, style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(Dimens.five),
                            ),
                            filled: true,
                            fillColor: ColorsValue.colorDFDFDF,
                          ),
                        ),
                      ),
                      Dimens.boxHeight30,
                      ElevatedButton(
                        onPressed: () {
                          if (productKey.currentState!.validate()) {
                            Get.back();
                            postAddToCart(item.product?.id ?? "", item.quantity,
                                index, "inCart");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            double.maxFinite,
                            Dimens.fourtyFive,
                          ),
                          backgroundColor: ColorsValue.lightYellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              Dimens.twelve,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'save'.tr,
                            style: Styles.whiteColorW80016,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  final ScrollController scrollCartController = ScrollController();
  List<CartItemProductElement> cartList = [];
  CartItemData? cartsItemModel = CartItemData();

  int pageCartCount = 1;
  bool isCartLastPage = false;
  bool isCartLoading = false;

  bool isLoader = true;

  double cartTotal = 0;
  var client = http.Client();

  Future<void> postCartList(int pageKey) async {
    if (pageKey == 1) {
      pageCartCount = 1;
    }
    var response = await client.post(
      Uri.parse("https://api.gagold.in/user/cart"),
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
    var cartItemModel = cartItemModelFromJson(response.body);
    cartsItemModel = null;
    if (cartItemModel.data != null) {
      cartsItemModel = cartItemModel.data;
      if (pageKey == 1) {
        isCartLastPage = false;
        cartList.clear();
      }
      if ((cartItemModel.data?.products?.length ?? 0) < 10) {
        isCartLastPage = true;
        cartList.addAll(cartItemModel.data?.products ?? []);
      } else {
        pageCartCount++;
        cartList.addAll(cartItemModel.data?.products ?? []);
      }
      if (pageKey == 1) {
        if (scrollCartController.positions.isNotEmpty) {
          scrollCartController.jumpTo(0);
        }
      }
      isLoader = false;
    } else {
      isLoader = false;
      Utility.errorMessage(cartItemModel.message.toString());
    }

    // var response = await shoppingCartPresenter.postGetAllCartProduct(
    //   page: pageKey,
    //   limit: 10,
    //   isLoading: true,
    // );
    // cartItemModel = null;
    // if (response?.data != null) {
    //   cartItemModel = response?.data;
    //   if (pageKey == 1) {
    //     isCartLastPage = false;
    //     cartList.clear();
    //   }
    //   if ((response?.data?.products?.length ?? 0) < 10) {
    //     isCartLastPage = true;
    //     cartList.addAll(response?.data?.products ?? []);
    //   } else {
    //     pageCartCount++;
    //     cartList.addAll(response?.data?.products ?? []);
    //   }
    //   if (pageKey == 1) {
    //     if (scrollCartController.positions.isNotEmpty) {
    //       scrollCartController.jumpTo(0);
    //     }
    //   }
    // } else {
    //   Utility.errorMessage(response?.message ?? "");
    // }
    update();
  }

  Future<void> postCartProductRemove(CartItemProductElement item) async {
    var response = await client.post(
      Uri.parse("https://api.gagold.in/user/cart/remove"),
      headers: {
        "Content-Type": "application/json",
        'Authorization':
            'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
      },
      body: jsonEncode({
        "productId": item.product?.id ?? "",
      }),
    );
    if (response.body.isNotEmpty) {
      Utility.closeDialog();
      cartList.remove(item);
    } else {
      Utility.closeDialog();
      Utility.errorMessage(jsonDecode(response.body ?? "")['Message']);
    }
    update();
  }

  TextEditingController minWeightController = TextEditingController();
  TextEditingController maxWeightController = TextEditingController();

  int radioValue = 0;
  int radioSortValue = -1;
  bool isFilter = false;

  int filterValue = 0;
  double minValue = 0;
  double maxValue = 1000;
  double startValue = 0;
  double endValue = 1000;

  final ScrollController scrollViewAllController = ScrollController();
  List<ProductsDoc> viewAllDocList = [];

  int pageViewAllCount = 1;
  bool isViewAllLastPage = false;
  bool isViewAllLoading = false;

  String productTypeViewAll = "";
  String category = "";
  String categoryName = "";

  // user/products

  Future<void> postArrivalViewAll(int pageKey, String type) async {
    if (pageKey == 1) {
      pageViewAllCount = 1;
    }
    var response = await client.post(
      Uri.parse("https://api.gagold.in/user/products"),
      headers: {
        "Content-Type": "application/json",
        'Authorization':
            'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
      },
      body: jsonEncode({
        "page": pageKey,
        "limit": 10,
        "search": "",
        "category": category,
        "min": minWeightController.text.isNotEmpty &&
                minWeightController.text.isNotEmpty
            ? minWeightController.text
            : startValue.toString(),
        "max": minWeightController.text.isNotEmpty &&
                minWeightController.text.isNotEmpty
            ? maxWeightController.text
            : endValue.toString(),
        "productType": type.toLowerCase(),
        "sortField": "weight",
        "sortOption": radioSortValue,
      }),
    );
    var loginModel = productsModelFromJson(response.body);
    if (loginModel.data != null) {
      if (pageKey == 1) {
        isViewAllLastPage = false;
        viewAllDocList.clear();
      }
      if ((loginModel.data?.docs?.length ?? 0) < 10) {
        isViewAllLastPage = true;
        viewAllDocList.addAll(loginModel.data?.docs ?? []);
      } else {
        pageViewAllCount++;
        viewAllDocList.addAll(loginModel.data?.docs ?? []);
      }
      if (pageKey == 1) {
        if (scrollViewAllController.positions.isNotEmpty) {
          scrollViewAllController.jumpTo(0);
        }
      }

      isViewAllLoading = false;
    } else {
      isViewAllLoading = false;
    }
    update();
  }

  // Future<void> postArrivalViewAll(int pageKey, String type) async {
  //   if (pageKey == 1) {
  //     pageViewAllCount = 1;
  //   }
  //   var response = await shoppingCartPresenter.postAllProduct(
  //     page: pageKey,
  //     limit: 10,
  //     search: "",
  //     category: category,
  //     min: minWeightController.text.isNotEmpty &&
  //             minWeightController.text.isNotEmpty
  //         ? minWeightController.text
  //         : startValue.toString(),
  //     max: minWeightController.text.isNotEmpty &&
  //             minWeightController.text.isNotEmpty
  //         ? maxWeightController.text
  //         : endValue.toString(),
  //     productType: type.toLowerCase(),
  //     sortField: "weight",
  //     sortOption: radioSortValue,
  //     isLoading: false,
  //   );
  //   if (response?.data != null) {
  //     if (pageKey == 1) {
  //       isViewAllLastPage = false;
  //       viewAllDocList.clear();
  //     }
  //     if ((response?.data?.docs?.length ?? 0) < 10) {
  //       isViewAllLastPage = true;
  //       viewAllDocList.addAll(response?.data?.docs ?? []);
  //     } else {
  //       pageViewAllCount++;
  //       viewAllDocList.addAll(response?.data?.docs ?? []);
  //     }
  //     if (pageKey == 1) {
  //       if (scrollViewAllController.positions.isNotEmpty) {
  //         scrollViewAllController.jumpTo(0);
  //       }
  //     }

  //     isViewAllLoading = false;
  //   } else {
  //     isViewAllLoading = false;
  //   }
  //   update();
  // }

  Future<void> postAddToCart(
      String productId, int quantity, int index, String productType) async {
    // var response = await shoppingCartPresenter.postAddToCart(
    //   productId: productId,
    //   quantity: quantity,
    //   description: productDesController.text,
    //   isLoading: false,
    // );
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
    if (response?.statusCode == 200) {
      if (productType.contains("inCart")) {
        cartList[index].description = productDesController.text;
      } else {
        viewAllDocList[index].inCart = true;
        Utility.snacBar(
            "Product added in cart successfully...!", ColorsValue.appColor);
      }
    } else {
      Utility.errorMessage(
          jsonDecode(response?.body.toString() ?? "")['Message']);
    }
    update();
  }

  // Future<void> postOrderCreate() async {
  //   var response = await shoppingCartPresenter.postOrderCreate(
  //     cartId: cartsItemModel?.id ?? '',
  //     products: cartList.map(
  //       (e) {
  //         return Product(
  //           productId: e.product?.id ?? "",
  //           quantity: e.quantity,
  //           description: e.description,
  //         );
  //       },
  //     ).toList(),
  //     main_description: finalDesController.text,
  //     isLoading: false,
  //   );
  //   if (response?.statusCode == 200) {
  //     RouteManagement.goToBottomBarView();
  //     postCartList(1);
  //   } else {
  //     Utility.errorMessage(jsonDecode(response.toString())['Data']['Message']);
  //   }
  //   update();
  // }

  Future<void> postOrderCreate() async {
    var response = await client.post(
      Uri.parse("https://api.gagold.in/user/orders/create"),
      headers: {
        "Content-Type": "application/json",
        'Authorization':
            'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
      },
      body: jsonEncode({
        "cartid": cartsItemModel?.id ?? '',
        "products": cartList.map(
          (e) {
            return Product(
              productId: e.product?.id ?? '',
              quantity: e.quantity,
              priority: e.priority ?? '',
              weight: e.weight ?? '',
              size: e.size ?? '',
              description: e.description,
            );
          },
        ).toList(),
      }),
    );
    if (response.statusCode == 200) {
      Utility.closeLoader();
      RouteManagement.goToBottomBarView();
      postCartList(1);
    } else {
      Utility.closeLoader();
      Utility.errorMessage(jsonDecode(response.toString())['Message']);
    }
    update();
  }

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
      Utility.closeLoader();
      postArrivalViewAll(1, productTypeViewAll);
    } else {
      Utility.closeLoader();
    }
    update();
  }

  void decreaseQuantity(int index) {
    if (cartList[index].quantity > 1) {
      cartList[index].quantity--;
      update(); // Notify UI about the change
    }
  }

  void increaseQuantity(int index) {
    cartList[index].quantity++;
    update(); // Notify UI about the change
  }
}
