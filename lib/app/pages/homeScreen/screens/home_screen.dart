import 'package:another_stepper/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ga_final/app/app.dart';
import 'package:ga_final/app/navigators/routes_management.dart';
import 'package:ga_final/app/widgets/custom_order_dilog.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (state) async {
        var controller = Get.find<HomeController>();
        controller.postAllProduct('');
        controller.postWishlistCount();
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.primaryColor,
          appBar: AppBar(
            backgroundColor: ColorsValue.primaryColor,
            title: Padding(
              padding: EdgeInsets.all(Dimens.five),
              child: Text(
                "Hi, ${controller.getProfileModel?.name ?? 'User'}",
                style: Styles.color01010160018,
              ),
            ),
            automaticallyImplyLeading: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: InkWell(
                  onTap: () {
                    RouteManagement.goToSearchScreen();
                  },
                  child: SvgPicture.asset(
                    AssetConstants.searchView,
                    height: Dimens.twentySix,
                    width: Dimens.twentySix,
                    colorFilter: ColorFilter.mode(
                      ColorsValue.color334155,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: Dimens.ten,
                ),
                child: InkWell(
                  onTap: () {
                    RouteManagement.goToWishlistScreen();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: Dimens.ten),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(
                          AssetConstants.ic_wishlist,
                          height: Dimens.twentyFour,
                          width: Dimens.twentyFour,
                          colorFilter: ColorFilter.mode(
                            ColorsValue.color334155,
                            BlendMode.srcIn,
                          ),
                        ),
                        if (controller.wishListCount != null &&
                            controller.wishListCount != 0) ...[
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              alignment: Alignment.center,
                              height: Dimens.fifteen,
                              width: Dimens.fifteen,
                              decoration: BoxDecoration(
                                color: ColorsValue.lightYellow,
                                borderRadius: BorderRadius.circular(
                                  Dimens.hundred,
                                ),
                              ),
                              child: Text(
                                controller.wishListCount.toString(),
                                style: GoogleFonts.montserrat(
                                  fontSize: Dimens.eight,
                                  color: ColorsValue.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ]
                        // if (controller.wishListCount != null &&
                        //     controller.wishListCount != 0) ...[
                        //   Positioned(
                        //     right: 0,
                        //     top: 0,
                        //     child: Container(
                        //       alignment: Alignment.center,
                        //       height: Dimens.fifteen,
                        //       width: Dimens.fifteen,
                        //       decoration: BoxDecoration(
                        //         color: ColorsValue.colorEBF1F8,
                        //         borderRadius: BorderRadius.circular(
                        //           Dimens.hundred,
                        //         ),
                        //       ),
                        //       child: Text(
                        //         controller.wishListCount.toString(),
                        //         style: GoogleFonts.montserrat(
                        //           fontSize: Dimens.eight,
                        //           color: ColorsValue.whiteColor,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ]
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: Dimens.edgeInsets20_20.copyWith(bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.bnnerList.isEmpty
                          ? SizedBox(
                              width: double.maxFinite,
                              height: Dimens.twoHundred,
                              child: Center(
                                child: Text('No Dat Found'),
                              ),
                            )
                          : SizedBox(
                              width: double.maxFinite,
                              height: Dimens.twoHundred,
                              child: PageView.builder(
                                itemCount: controller.bnnerList.length,
                                onPageChanged: (value) {
                                  controller.selectPage = value;
                                  controller.update();
                                },
                                itemBuilder: (context, index) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      Dimens.ten,
                                    ),
                                    child: Image.asset(
                                      controller.bnnerList[index],
                                      fit: BoxFit.fill,
                                      // AssetConstants.app_logo,
                                    ),
                                  );
                                },
                              ),
                            ),
                      Dimens.boxHeight10,
                      if (controller.getCategoriesList.isNotEmpty) ...[
                        Text(
                          'Categories',
                          style: Styles.color01010170020,
                        ),
                        Dimens.boxHeight10,
                        SizedBox(
                          height: Dimens.hundredThirty,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.getCategoriesList.length,
                            itemBuilder: (context, index) {
                              var item = controller.getCategoriesList[index];
                              var type = controller
                                  .getCategoriesList[index].image
                                  ?.split(".")
                                  .last;
                              return GestureDetector(
                                onTap: () {
                                  controller.isSelcted != index
                                      ? item.id ==
                                              controller
                                                  .getCategoriesList[index].id
                                          ? controller.isSelcted = index
                                          : null
                                      : controller.isSelcted = -1;
                                  controller.postAllProduct(
                                      controller.isSelcted == -1
                                          ? ''
                                          : item.id ?? '');
                                  // RouteManagement.goToViewAllProductScreen(
                                  //     "", item.id ?? "", item.name ?? "");
                                },
                                child: Padding(
                                  padding: Dimens.edgeInsetsRight20,
                                  child: SizedBox(
                                    width: Dimens.hundredTen,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          width: Dimens.seventyFive,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: controller.isSelcted == index
                                                ? ColorsValue.colorC7D1DD
                                                : ColorsValue.whiteColor,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: ColorsValue.blackColor
                                                      .withOpacity(0.1),
                                                  blurRadius: 3,
                                                  spreadRadius: 2,
                                                  blurStyle: BlurStyle.normal,
                                                  offset: Offset(1, 4))
                                            ],
                                          ),
                                          child: ClipOval(
                                            child: type != "svg"
                                                ? CachedNetworkImage(
                                                    imageUrl: (item.icon ?? ""),
                                                    height: Dimens.seventyFive,
                                                    width: Dimens.seventyFive,
                                                    placeholder:
                                                        (context, url) {
                                                      return Image.asset(
                                                        AssetConstants.ring,
                                                      );
                                                    },
                                                    errorWidget:
                                                        (context, url, error) {
                                                      return Image.asset(
                                                        AssetConstants.ring,
                                                      );
                                                    },
                                                  )
                                                : SvgPicture.network(
                                                    item.image ?? "",
                                                    height: Dimens.seventyFive,
                                                    width: Dimens.seventyFive,
                                                  ),
                                          ),
                                        ),

                                        Dimens.boxHeight10,
                                        Text(
                                          item.name ?? '',
                                          style: Styles.blackw60012,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        // Container(
                                        //   alignment: Alignment.center,
                                        //   width: Dimens.seventyFive,
                                        //   decoration: BoxDecoration(
                                        //     borderRadius: BorderRadius.circular(
                                        //       Dimens.fiveHundred,
                                        //     ),
                                        //     color: controller.isSelcted == index
                                        //         ? ColorsValue.redColor
                                        //         : ColorsValue.whiteColor,
                                        //   ),
                                        //   child: ClipRRect(
                                        //     borderRadius: BorderRadius.circular(
                                        //       Dimens.fiveHundred,
                                        //     ),
                                        //     child: type != "svg"
                                        //         ? CachedNetworkImage(
                                        //             imageUrl: (item.icon ?? ""),
                                        //             height: Dimens.seventyFive,
                                        //             width: Dimens.seventyFive,
                                        //             placeholder:
                                        //                 (context, url) {
                                        //               return Image.asset(
                                        //                 AssetConstants.ring,
                                        //               );
                                        //             },
                                        //             errorWidget:
                                        //                 (context, url, error) {
                                        //               return Image.asset(
                                        //                 AssetConstants.ring,
                                        //               );
                                        //             },
                                        //           )
                                        //         : SvgPicture.network(
                                        //             item.image ?? "",
                                        //             height: Dimens.seventyFive,
                                        //             width: Dimens.seventyFive,
                                        //           ),
                                        //   ),
                                        // ),
                                        // Dimens.boxHeight10,
                                        // Text(
                                        //   item.name ?? "",
                                        //   style: Styles.blackw60012,
                                        //   maxLines: 2,
                                        //   textAlign: TextAlign.center,
                                        //   overflow: TextOverflow.ellipsis,
                                        // )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                      Dimens.boxHeight10,
                      controller.productArrivalDocList.isEmpty
                          ? SizedBox(
                              width: double.maxFinite,
                              height: Get.height * .37,
                              child: Center(
                                  child: SvgPicture.asset(
                                'assets/svg/empty_fiels.svg',
                                height: Get.height * .4,
                              )),
                            )
                          : GridView.builder(
                              shrinkWrap: true,
                              controller: controller.scrollViewAllController,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: Dimens.fifteen,
                                crossAxisSpacing: Dimens.ten,
                                mainAxisExtent: Dimens.threeHundredThirty,
                              ),
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  controller.productArrivalDocList.length,
                              itemBuilder: (context, index) {
                                var item =
                                    controller.productArrivalDocList[index];
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(
                                                        Dimens.ten),
                                                    topRight: Radius.circular(
                                                        Dimens.ten),
                                                  ),
                                                  child: CachedNetworkImage(
                                                    imageUrl: item.image ?? "",
                                                    fit: BoxFit.cover,
                                                    height: Dimens.hundredSixty,
                                                    width: double.maxFinite,
                                                    placeholder:
                                                        (context, url) =>
                                                            Image.asset(
                                                      AssetConstants
                                                          .placeholder,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Image.asset(
                                                      AssetConstants
                                                          .placeholder,
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
                                                    color:
                                                        ColorsValue.whiteColor,
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
                                                                false);
                                                      },
                                                      child: SvgPicture.asset(
                                                        item.wishlistStatus ??
                                                                false
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
                                          padding: Dimens.edgeInsets10_0_10_0,
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
                                                  padding: Dimens
                                                      .edgeInsets10_0_10_0,
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
                                                            style: Styles
                                                                .blackW60014,
                                                          ),
                                                          Text(
                                                            "${item.weight} gm",
                                                            style: Styles
                                                                .black60012,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          GestureDetector(
                                                            onTap:
                                                                item.inCart ??
                                                                        true
                                                                    ? null
                                                                    : () {
                                                                        if (item.cartquantity.toDouble() >
                                                                            0) {
                                                                          item.cartquantity--;
                                                                        }

                                                                        // if (controller
                                                                        //         .getAllProductDocList[
                                                                        //             index]
                                                                        //         .cartquantity
                                                                        //         .toDouble() >
                                                                        //     0) {
                                                                        //   controller
                                                                        //       .getAllProductDocList[
                                                                        //           index]
                                                                        //       .cartquantity--;
                                                                        // }
                                                                        controller
                                                                            .update();
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
                                                              child: SvgPicture
                                                                  .asset(
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
                                                          Text(item.cartquantity
                                                              .toString()),
                                                          Dimens.boxWidth10,
                                                          GestureDetector(
                                                            onTap:
                                                                item.inCart ??
                                                                        true
                                                                    ? null
                                                                    : () {
                                                                        item.cartquantity++;
                                                                        controller
                                                                            .update();
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
                                                              child: SvgPicture
                                                                  .asset(
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
                                                  padding: Dimens
                                                      .edgeInsets10_0_10_10,
                                                  child: Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          Get.closeCurrentSnackbar();
                                                          if (item.inCart ??
                                                              false) {
                                                            Get.find<
                                                                    BottomBarController>()
                                                                .tabController
                                                                ?.animateTo(1);
                                                          } else {
                                                            if (controller
                                                                    .productArrivalDocList[
                                                                        index]
                                                                    .cartquantity
                                                                    .toDouble() >
                                                                0) {
                                                              controller
                                                                  .postAddToCart(
                                                                      item.id ??
                                                                          "",
                                                                      item.cartquantity,
                                                                      index,
                                                                      "arrival");
                                                            } else {
                                                              Utility.errorMessage(
                                                                  "Please add one item.");
                                                            }
                                                          }
                                                        },
                                                        child: SvgPicture.asset(
                                                            AssetConstants
                                                                .ic_cart),
                                                      ),
                                                      Dimens.boxWidth10,
                                                      Expanded(
                                                        child: InkWell(
                                                          onTap: () {
                                                            showCustomCartDialog(
                                                              context: context,
                                                              item: item,
                                                              onIncrease: () {
                                                                item.cartquantity++;
                                                                controller
                                                                    .update();
                                                              },
                                                              onDecrease: () {
                                                                if (item.cartquantity
                                                                        .toDouble() >
                                                                    0) {
                                                                  item.cartquantity--;
                                                                }
                                                                controller
                                                                    .update();
                                                              },
                                                              onCheckout: () =>
                                                                  print(
                                                                      "Checkout"),
                                                              onRemove: () {
                                                                Get.back();
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            padding: Dimens
                                                                .edgeInsets14_0_14_0,
                                                            height:
                                                                Dimens.fourty,
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
                              },
                            ),
                      Dimens.boxHeight20,
                    ],
                  ),
                ),
              ),
              if (controller.isLoading) ...[
                Container(
                  height: Get.height,
                  width: Get.width,
                  color: Colors.black.withValues(alpha: 0.5),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              ]
            ],
          ),
        );
      },
    );
  }
}
