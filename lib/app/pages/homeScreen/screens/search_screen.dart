import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ga_final/app/widgets/custom_order_dilog.dart';
import 'package:get/get.dart';
import 'package:ga_final/app/app.dart';
import 'package:ga_final/app/navigators/navigators.dart' show RouteManagement;
import 'package:ga_final/app/widgets/appbar_widgets.dart';
import 'package:ga_final/domain/domain.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final _debouncer = Debouncer(milliseconds: 500);
    return GetBuilder<HomeController>(
      initState: (state) async {
        var controller = Get.find<HomeController>();
        controller.isSearchLoading = true;
        controller.postGetAllProduct(1, '');
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: 'Search Screen',
            isVisible: true,
          ),
          body: Padding(
            padding: Dimens.edgeInsets20_0_20_20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Dimens.boxHeight10,
                TextField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: Dimens.fifteen),
                    filled: true,
                    fillColor: ColorsValue.lightGreyColor,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ColorsValue.transparent,
                      ),
                      borderRadius: BorderRadius.circular(
                        Dimens.ten,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ColorsValue.transparent,
                      ),
                      borderRadius: BorderRadius.circular(
                        Dimens.ten,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ColorsValue.transparent,
                      ),
                      borderRadius: BorderRadius.circular(
                        Dimens.ten,
                      ),
                    ),
                    hintText: 'Search...',
                    hintStyle: Styles.greyAAA40014,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(AssetConstants.searchView),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        AssetConstants.voiceView,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    _debouncer.run(() {
                      Future.sync(
                        () {
                          if (value.isNotEmpty) {
                            return controller.postGetAllProduct(
                                1, value.toString());
                          } else {
                            return controller.postGetAllProduct(1, '');
                          }
                        },
                      );
                    });
                  },
                ),
                Dimens.boxHeight20,
                Expanded(
                  child: !controller.isSearchLoading
                      ? controller.getAllProductDocList.isNotEmpty
                          ? RefreshIndicator(
                              onRefresh: () => Future.sync(
                                () async {
                                  controller.isSearchLoading = true;
                                  controller.update();
                                  controller.postGetAllProduct(1, '');
                                },
                              ),
                              child: GridView.builder(
                                controller: controller.scrollViewAllController,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: Dimens.fifteen,
                                  crossAxisSpacing: Dimens.ten,
                                        mainAxisExtent: Dimens.threeHundredThirty
                                ),
                                itemCount:
                                    controller.getAllProductDocList.length,
                                itemBuilder: (context, index) {
                                  var item =
                                      controller.getAllProductDocList[index];
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
                                                padding:
                                                    const EdgeInsets.all(10),
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
                                                      imageUrl:
                                                          item.image ?? "",
                                                      fit: BoxFit.cover,
                                                      height:
                                                          Dimens.hundredSixty,
                                                      width: double.maxFinite,
                                                      placeholder:
                                                          (context, url) =>
                                                              Image.asset(
                                                        AssetConstants
                                                            .placeholder,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
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
                                                      color: ColorsValue
                                                          .whiteColor,
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
                                            padding:
                                                Dimens.edgeInsets10_10_10_0,
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
                                                                          false
                                                                      ? null
                                                                      : () {
                                                                          if (controller.getAllProductDocList[index].cartquantity.toDouble() >
                                                                              0) {
                                                                            controller.getAllProductDocList[index].cartquantity--;
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
                                                                child:
                                                                    SvgPicture
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
                                                            Text(
                                                              item.cartquantity
                                                                  .toString(),
                                                            ),
                                                            Dimens.boxWidth10,
                                                            GestureDetector(
                                                              onTap:
                                                                  item.inCart ??
                                                                          false
                                                                      ? null
                                                                      : () {
                                                                          controller
                                                                              .getAllProductDocList[index]
                                                                              .cartquantity++;
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
                                                                child:
                                                                    SvgPicture
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
                                                                  ?.animateTo(
                                                                      1);
                                                            } else {
                                                              if (controller
                                                                      .productArrivalDocList[
                                                                          index]
                                                                      .cartquantity
                                                                      .toDouble() >
                                                                  0) {
                                                                controller.postAddToCart(
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
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/svg/ic_bank.svg',
                                                            // height: 25,
                                                          ),
                                                        ),
                                                        Dimens.boxWidth10,
                                                        Expanded(
                                                          child: InkWell(
                                                            onTap: () {
                                                              showCustomCartDialog(
                                                                context:
                                                                    context,
                                                                item: item,
                                                                onIncrease:
                                                                    () => print(
                                                                        "Increment Quantity"),
                                                                onDecrease:
                                                                    () => print(
                                                                        "Decrease Quantity"),
                                                                onCheckout:
                                                                    () => print(
                                                                        "Checkout"),
                                                                onRemove: () =>
                                                                    print(
                                                                        "Remove Item"),
                                                              );
                                                            },
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
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
                                  // return Container(
                                  //   decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(
                                  //       Dimens.ten,
                                  //     ),
                                  //     color: ColorsValue.appColorLight,
                                  //   ),
                                  //   child: ClipRRect(
                                  //     borderRadius: BorderRadius.circular(
                                  //       Dimens.ten,
                                  //     ),
                                  //     child: Column(
                                  //       crossAxisAlignment:
                                  //           CrossAxisAlignment.start,
                                  //       children: [
                                  //         GestureDetector(
                                  //           onTap: () {
                                  //             RouteManagement
                                  //                 .goToShowFullScareenImage(
                                  //                     item.image ?? "",
                                  //                     "image");
                                  //           },
                                  //           child: ClipRRect(
                                  //             borderRadius: BorderRadius.only(
                                  //               topLeft:
                                  //                   Radius.circular(Dimens.ten),
                                  //               topRight:
                                  //                   Radius.circular(Dimens.ten),
                                  //             ),
                                  //             child: CachedNetworkImage(
                                  //               imageUrl: item.image ?? "",
                                  //               fit: BoxFit.cover,
                                  //               height: Dimens.hundredSixty,
                                  //               width: double.maxFinite,
                                  //               placeholder: (context, url) =>
                                  //                   Image.asset(
                                  //                 AssetConstants.placeholder,
                                  //                 fit: BoxFit.cover,
                                  //               ),
                                  //               errorWidget:
                                  //                   (context, url, error) =>
                                  //                       Image.asset(
                                  //                 AssetConstants.placeholder,
                                  //                 fit: BoxFit.cover,
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         Dimens.boxHeight10,
                                  //         Padding(
                                  //           padding: Dimens.edgeInsets10_0_10_0,
                                  //           child: Text(
                                  //             item.name ?? "",
                                  //             maxLines: 2,
                                  //             overflow: TextOverflow.ellipsis,
                                  //             softWrap: true,
                                  //             style: Styles.blackW60014,
                                  //           ),
                                  //         ),
                                  //         Expanded(
                                  //           child: Align(
                                  //             alignment: Alignment.bottomCenter,
                                  //             child: Column(
                                  //               mainAxisSize: MainAxisSize.min,
                                  //               mainAxisAlignment:
                                  //                   MainAxisAlignment.end,
                                  //               crossAxisAlignment:
                                  //                   CrossAxisAlignment.end,
                                  //               children: [
                                  //                 Padding(
                                  //                   padding: Dimens
                                  //                       .edgeInsets10_0_10_0,
                                  //                   child: Row(
                                  //                     mainAxisAlignment:
                                  //                         MainAxisAlignment
                                  //                             .spaceBetween,
                                  //                     children: [
                                  //                       Column(
                                  //                         crossAxisAlignment:
                                  //                             CrossAxisAlignment
                                  //                                 .start,
                                  //                         children: [
                                  //                           Text(
                                  //                             "Weigth",
                                  //                             style: Styles
                                  //                                 .blackW60014,
                                  //                           ),
                                  //                           Text(
                                  //                             "${item.weight} gm",
                                  //                             style: Styles
                                  //                                 .black60012,
                                  //                           ),
                                  //                         ],
                                  //                       ),
                                  //                       Row(
                                  //                         children: [
                                  //                           GestureDetector(
                                  //                             onTap:
                                  //                                 item.inCart ??
                                  //                                         false
                                  //                                     ? null
                                  //                                     : () {
                                  //                                         if (controller.getAllProductDocList[index].cartquantity.toDouble() >
                                  //                                             0) {
                                  //                                           controller.getAllProductDocList[index].cartquantity--;
                                  //                                         }
                                  //                                         controller
                                  //                                             .update();
                                  //                                       },
                                  //                             child: Container(
                                  //                               decoration:
                                  //                                   BoxDecoration(
                                  //                                 borderRadius:
                                  //                                     BorderRadius
                                  //                                         .circular(
                                  //                                   Dimens.ten,
                                  //                                 ),
                                  //                                 color: ColorsValue
                                  //                                     .colorDFDFDF,
                                  //                               ),
                                  //                               child:
                                  //                                   SvgPicture
                                  //                                       .asset(
                                  //                                 AssetConstants
                                  //                                     .minus,
                                  //                                 height: Dimens
                                  //                                     .twentyFour,
                                  //                                 width: Dimens
                                  //                                     .twentyFour,
                                  //                               ),
                                  //                             ),
                                  //                           ),
                                  //                           Dimens.boxWidth10,
                                  //                           Text(
                                  //                             item.cartquantity
                                  //                                 .toString(),
                                  //                           ),
                                  //                           Dimens.boxWidth10,
                                  //                           GestureDetector(
                                  //                             onTap:
                                  //                                 item.inCart ??
                                  //                                         false
                                  //                                     ? null
                                  //                                     : () {
                                  //                                         controller
                                  //                                             .getAllProductDocList[index]
                                  //                                             .cartquantity++;
                                  //                                         controller
                                  //                                             .update();
                                  //                                       },
                                  //                             child: Container(
                                  //                               decoration:
                                  //                                   BoxDecoration(
                                  //                                 borderRadius:
                                  //                                     BorderRadius
                                  //                                         .circular(
                                  //                                             10),
                                  //                                 color: ColorsValue
                                  //                                     .colorDFDFDF,
                                  //                               ),
                                  //                               child:
                                  //                                   SvgPicture
                                  //                                       .asset(
                                  //                                 AssetConstants
                                  //                                     .plus,
                                  //                                 height: Dimens
                                  //                                     .twentyFour,
                                  //                                 width: Dimens
                                  //                                     .twentyFour,
                                  //                               ),
                                  //                             ),
                                  //                           ),
                                  //                         ],
                                  //                       ),
                                  //                     ],
                                  //                   ),
                                  //                 ),
                                  //                 Dimens.boxHeight5,
                                  //                 Padding(
                                  //                   padding: Dimens
                                  //                       .edgeInsets10_0_10_10,
                                  //                   child: InkWell(
                                  //                     onTap: () {
                                  //                       if (item.inCart ??
                                  //                           false) {
                                  //                       } else {
                                  //                         if (controller
                                  //                                 .getAllProductDocList[
                                  //                                     index]
                                  //                                 .cartquantity
                                  //                                 .toDouble() >
                                  //                             0) {
                                  //                           controller
                                  //                               .postAddToCart(
                                  //                             item.id ?? "",
                                  //                             item.cartquantity,
                                  //                             index,
                                  //                             "",
                                  //                           );
                                  //                         } else {
                                  //                           Utility.errorMessage(
                                  //                               "Please add one item.");
                                  //                         }
                                  //                       }
                                  //                     },
                                  //                     child: Container(
                                  //                       alignment:
                                  //                           Alignment.center,
                                  //                       padding: Dimens
                                  //                           .edgeInsets14_0_14_0,
                                  //                       height: Dimens.thirty,
                                  //                       decoration:
                                  //                           BoxDecoration(
                                  //                         color: ColorsValue
                                  //                             .colorEDC97D,
                                  //                         borderRadius:
                                  //                             BorderRadius
                                  //                                 .circular(
                                  //                           Dimens.four,
                                  //                         ),
                                  //                       ),
                                  //                       child: Text(
                                  //                         item.inCart ?? false
                                  //                             ? 'Item In Cart'
                                  //                             : 'Add To Cart',
                                  //                         style: Styles
                                  //                             .colorFBF7F350010,
                                  //                       ),
                                  //                     ),
                                  //                   ),
                                  //                 )
                                  //               ],
                                  //             ),
                                  //           ),
                                  //         )
                                  //       ],
                                  //     ),
                                  //   ),
                                  // );
                                },
                              ),
                            )
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AssetConstants.ic_filter_empty,
                                  ),
                                  Dimens.boxHeight10,
                                  Text(
                                    'search_empty_txt'.tr,
                                    style: Styles.black64748BW50016,
                                  )
                                ],
                              ),
                            )
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
