import 'package:Ga_Gold/app/app.dart';
import 'package:Ga_Gold/app/navigators/navigators.dart';
import 'package:Ga_Gold/app/widgets/appbar_widgets.dart';
import 'package:Ga_Gold/app/widgets/custom_order_dilog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (state) async {
        var controller = Get.find<HomeController>();
        controller.postWishlist(1);
        controller.scrollWishListController.addListener(() async {
          if (controller.scrollWishListController.position.pixels ==
              controller.scrollWishListController.position.maxScrollExtent) {
            if (controller.isWishListLoading == false) {
              controller.isWishListLoading = true;
              controller.update();
              if (controller.isWishListLastPage == false) {
                await controller.postWishlist(controller.pageWishCount);
              }
              controller.isWishListLoading = false;
              controller.update();
            }
          }
        });
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: "wishlist".tr,
          ),
          body: RefreshIndicator(
            onRefresh: () => Future.sync(
              () async {
                await controller.postWishlist(1);
              },
            ),
            child: Utility.isLoginOrNot()
                ? controller.wishlistList.isNotEmpty
                    ? GridView.builder(
                        controller: controller.scrollWishListController,
                        padding: Dimens.edgeInsets20,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: Dimens.fifteen,
                            crossAxisSpacing: Dimens.ten,
                            mainAxisExtent: Dimens.threeHundredThirty),
                        itemCount: controller.wishlistList.length,
                        itemBuilder: (context, index) {
                          final item = controller.wishlistList[index].productid;
                          final product = controller.wishlistList[index];
                          if (item != null) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Dimens.ten,
                                ),
                                color: ColorsValue.textfildBorder,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  Dimens.ten,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: GestureDetector(
                                            onTap: () {
                                              RouteManagement
                                                  .goToShowFullScareenImage(
                                                      item.image ?? "",
                                                      "image");
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topLeft:
                                                    Radius.circular(Dimens.ten),
                                                topRight:
                                                    Radius.circular(Dimens.ten),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl: item.image ?? "",
                                                fit: BoxFit.cover,
                                                height: Dimens.hundredSixty,
                                                width: double.maxFinite,
                                                placeholder: (context, url) =>
                                                    Image.asset(
                                                  AssetConstants.placeholder,
                                                  fit: BoxFit.cover,
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Image.asset(
                                                  AssetConstants.placeholder,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: Dimens.edgeInsets14,
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              height: Dimens.thirty,
                                              width: Dimens.thirty,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  Dimens.fifty,
                                                ),
                                                color: ColorsValue.whiteColor,
                                                border: Border.all(
                                                  width: Dimens.one,
                                                  color: ColorsValue
                                                      .lightPrimaryColor,
                                                ),
                                              ),
                                              child: Center(
                                                child: InkWell(
                                                  onTap: () {
                                                    controller
                                                        .postWishlistAddRemove(
                                                            item.id ?? "",
                                                            index,
                                                            true);
                                                  },
                                                  child: SvgPicture.asset(
                                                    product.status ?? false
                                                        ? AssetConstants
                                                            .ic_fill_like
                                                        : AssetConstants
                                                            .ic_like,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Dimens.boxHeight10,
                                    Padding(
                                      padding: Dimens.edgeInsets10_10_10_0,
                                      child: Text(
                                        item.name ?? "Ring 01",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        style: Styles.blackW60014,
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding:
                                                  Dimens.edgeInsets10_0_10_0,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Weigth",
                                                        style:
                                                            Styles.blackW60014,
                                                      ),
                                                      Text(
                                                        "${item.weight} gm",
                                                        style:
                                                            Styles.black60012,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: product.inCart ??
                                                                false
                                                            ? null
                                                            : () {
                                                                if (item.quantity
                                                                        .toDouble() >
                                                                    1) {
                                                                  print(
                                                                      'object miunse');
                                                                  item.quantity--;
                                                                  controller
                                                                      .update();
                                                                  // controller
                                                                  //     .getAllProductDocList[
                                                                  //         index]
                                                                  //     .cartquantity--;
                                                                }
                                                              },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              Dimens.ten,
                                                            ),
                                                            color: ColorsValue
                                                                .colorDFDFDF,
                                                          ),
                                                          child:
                                                              SvgPicture.asset(
                                                            AssetConstants
                                                                .ic_minus_icon,
                                                            height: Dimens
                                                                .twentyFour,
                                                            width: Dimens
                                                                .twentyFour,
                                                          ),
                                                        ),
                                                      ),
                                                      Dimens.boxWidth10,
                                                      Text(item.quantity
                                                              .toString()
                                                          // product.quantity.toString(),
                                                          ),
                                                      Dimens.boxWidth10,
                                                      GestureDetector(
                                                        onTap: product.inCart ??
                                                                false
                                                            ? null
                                                            : () {
                                                                item.quantity++;
                                                                controller
                                                                    .update();
                                                                // controller
                                                                //     .getAllProductDocList[
                                                                //         index]
                                                                //     .cartquantity++;
                                                              },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: ColorsValue
                                                                .colorDFDFDF,
                                                          ),
                                                          child:
                                                              SvgPicture.asset(
                                                            AssetConstants
                                                                .ic_plus_icon,
                                                            height: Dimens
                                                                .twentyFour,
                                                            width: Dimens
                                                                .twentyFour,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Dimens.boxHeight10,
                                            Padding(
                                              padding:
                                                  Dimens.edgeInsets10_0_10_10,
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.closeCurrentSnackbar();
                                                      if (product.inCart ??
                                                          false) {
                                                        RouteManagement
                                                            .goToShoppingCartScreen(
                                                                true);
                                                        // Get.back();
                                                        // Get.find<
                                                        //         BottomBarController>()
                                                        //     .tabController
                                                        //     ?.animateTo(1);
                                                      } else {
                                                        if (controller
                                                                .getAllProductDocList[
                                                                    index]
                                                                .cartquantity
                                                                .toDouble() >
                                                            0) {
                                                          controller
                                                              .postAddToCart(
                                                                  item.id ?? "",
                                                                  item.quantity,
                                                                  index,
                                                                  "arrival");
                                                        } else {
                                                          Utility.errorMessage(
                                                              "Please add one item.");
                                                        }
                                                      }
                                                    },
                                                    child: SvgPicture.asset(
                                                      !(product.inCart ?? true)
                                                          ? AssetConstants
                                                              .ic_cart
                                                          : AssetConstants
                                                              .ic_fill_cart,
                                                    ),
                                                    // SvgPicture.asset(
                                                    //     AssetConstants.ic_cart
                                                    //     // height: 25,
                                                    //     ),
                                                  ),
                                                  Dimens.boxWidth10,
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () {
                                                        showCustomCartDialog(
                                                          context: context,
                                                          item: item,
                                                          onIncrease: () {
                                                            item.quantity++;
                                                            controller.update();
                                                          },
                                                          onDecrease: () {
                                                            if (item.quantity
                                                                    .toDouble() >
                                                                1) {
                                                              item.quantity--;
                                                            }
                                                            controller.update();
                                                          },
                                                          onCheckout: () =>
                                                              print("Checkout"),
                                                          onRemove: () {
                                                            Get.back();
                                                          },
                                                        );
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        padding: Dimens
                                                            .edgeInsets14_0_14_0,
                                                        height: Dimens.fourty,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: ColorsValue
                                                              .buttomColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            Dimens.ten,
                                                          ),
                                                        ),
                                                        child: Text(
                                                          'Order Now',
                                                          style: Styles
                                                              .whiteColorW60012,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      )
                    : Center(
                        child: Text(
                          "Wishlist data not found...!",
                          style: Styles.black60016,
                        ),
                      )
                : Utility.LoginNotWidget("Wishlist"),
          ),
        );
      },
    );
  }
}
