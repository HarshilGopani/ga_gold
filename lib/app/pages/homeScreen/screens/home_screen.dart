import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../app.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (state) async {},
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.primaryColor,
          appBar: AppBar(
            backgroundColor: ColorsValue.primaryColor,
            title: Padding(
              padding: EdgeInsets.all(Dimens.five),
              child: Text(
                "Parthiv",
                // "Hi, ${controller.getProfileModel?.name ?? 'User'}",
                style: Styles.blackColorW50018,
              ),
            ),
            automaticallyImplyLeading: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: InkWell(
                  onTap: () {
                    // RouteManagement.goToSearchScreen();
                  },
                  child: SvgPicture.asset(
                    AssetConstants.ic_notification,
                    height: Dimens.twentySix,
                    width: Dimens.twentySix,
                    colorFilter: ColorFilter.mode(
                      ColorsValue.appColor,
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
                            ColorsValue.appColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        // if (controller.wishlistCount.isNotEmpty) ...[
                        //   Positioned(
                        //     right: 0,
                        //     top: 0,
                        //     child: Container(
                        //       alignment: Alignment.center,
                        //       height: Dimens.fifteen,
                        //       width: Dimens.fifteen,
                        //       decoration: BoxDecoration(
                        //         color: ColorsValue.appColor,
                        //         borderRadius: BorderRadius.circular(
                        //           Dimens.hundred,
                        //         ),
                        //       ),
                        //       child: Text(
                        //         controller.wishlistCount.length.toString(),
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
                      SizedBox(
                        width: double.maxFinite,
                        height: Dimens.twoHundred,
                        child: PageView.builder(
                          itemCount: controller.testList.length,
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
                                AssetConstants.Benner,
                              ),
                            );
                          },
                        ),
                      ),
                      Dimens.boxHeight8,
                      Center(
                        child: Wrap(
                          children:
                              controller.testList.asMap().entries.map((e) {
                            return Padding(
                              padding: Dimens.edgeInsetsLeft4,
                              child: Container(
                                width: controller.selectPage == e.key
                                    ? Dimens.ten
                                    : Dimens.six,
                                height: Dimens.six,
                                decoration: BoxDecoration(
                                  color: controller.selectPage == e.key
                                      ? ColorsValue.appColor
                                      : ColorsValue.lightAppColor,
                                  borderRadius: BorderRadius.circular(
                                    Dimens.twenty,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Dimens.boxHeight20,
                      if (controller.getCategoriesList.isNotEmpty) ...[
                        Text(
                          'Categories',
                          style: Styles.color212121W70024,
                        ),
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
                                  // RouteManagement.goToViewAllProductScreen(
                                  //     "", item.id ?? "", item.name ?? "");
                                },
                                child: Padding(
                                  padding: Dimens.edgeInsetsRight20,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: Dimens.seventyFive,
                                        width: Dimens.seventyFive,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            Dimens.fiveHundred,
                                          ),
                                          color: ColorsValue.greyAAAAAA,
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            Dimens.fiveHundred,
                                          ),
                                          child: type != "svg"
                                              ? Image.asset(
                                                  AssetConstants.ring,
                                                )
                                              // CachedNetworkImage(
                                              //     imageUrl: (item.image ?? ""),
                                              //     fit: BoxFit.cover,
                                              //     placeholder: (context, url) {
                                              //       return Image.asset(
                                              //         AssetConstants.ring,
                                              //         fit: BoxFit.cover,
                                              //       );
                                              //     },
                                              //     errorWidget:
                                              //         (context, url, error) {
                                              //       return Image.asset(
                                              //         AssetConstants.ring,
                                              //         fit: BoxFit.cover,
                                              //       );
                                              //     },
                                              //   )
                                              : SvgPicture.network(
                                                  item.image ?? "",
                                                ),
                                        ),
                                      ),
                                      Dimens.boxHeight10,
                                      Text(
                                        item.name ?? "",
                                        style: Styles.blackw60012,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                      Dimens.boxHeight10,
                      GridView.builder(
                        shrinkWrap: true,
                        controller: controller.scrollViewAllController,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: Dimens.fifteen,
                          crossAxisSpacing: Dimens.ten,
                          mainAxisExtent: Dimens.threeHundred,
                        ),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          var item = controller.getAllProductDocList[index];
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Dimens.ten,
                              ),
                              color: ColorsValue.appColorLight,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                Dimens.ten,
                              ),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      RouteManagement
                                          .goToShowFullScareenImage(
                                              item.image ?? "", "image");
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
                                  Dimens.boxHeight10,
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
                                                      style: Styles
                                                          .blackW60014,
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
                                                      onTap:
                                                          item.inCart ??
                                                                  false
                                                              ? null
                                                              : () {
                                                                  if (controller
                                                                          .getAllProductDocList[index]
                                                                          .cartQuantity
                                                                          .toDouble() >
                                                                      0) {
                                                                    controller
                                                                        .getAllProductDocList[index]
                                                                        .cartQuantity--;
                                                                  }
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
                                                              .ic_minus,
                                                          height: Dimens
                                                              .twentyFour,
                                                          width: Dimens
                                                              .twentyFour,
                                                        ),
                                                      ),
                                                    ),
                                                    Dimens.boxWidth10,
                                                    Text(
                                                      item.cartQuantity
                                                          .toString(),
                                                    ),
                                                    Dimens.boxWidth10,
                                                    GestureDetector(
                                                      onTap: item.inCart ??
                                                              false
                                                          ? null
                                                          : () {
                                                              controller
                                                                  .getAllProductDocList[
                                                                      index]
                                                                  .cartQuantity++;
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
                                                              .ic_plus,
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
                                          Dimens.boxHeight5,
                                          Padding(
                                            padding:
                                                Dimens.edgeInsets10_0_10_10,
                                            child: InkWell(
                                              onTap: () {
                                                if (item.inCart ?? false) {
                                                } else {
                                                  if (controller
                                                          .getAllProductDocList[
                                                              index]
                                                          .cartQuantity
                                                          .toDouble() >
                                                      0) {
                                                  } else {
                                                    Utility.errorMessage(
                                                        "Please add one item.");
                                                  }
                                                }
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                padding: Dimens
                                                    .edgeInsets14_0_14_0,
                                                height: Dimens.thirty,
                                                decoration: BoxDecoration(
                                                  color: ColorsValue
                                                      .colorEDC97D,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    Dimens.four,
                                                  ),
                                                ),
                                                child: Text(
                                                  item.inCart ?? false
                                                      ? 'Item In Cart'
                                                      : 'Order Now',
                                                  style: Styles
                                                      .colorFBF7F350010,
                                                ),
                                              ),
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
              // if (controller.isLoading) ...[
              //   Container(
              //     height: Get.height,
              //     width: Get.width,
              //     color: Colors.black.withValues(alpha: 0.5),
              //     child: Center(
              //       child: CircularProgressIndicator(),
              //     ),
              //   )
              // ]
            ],
          ),
        );
      },
    );
  }
}
