import 'package:Ga_Gold/app/app.dart';
import 'package:Ga_Gold/app/navigators/navigators.dart' show RouteManagement;
import 'package:Ga_Gold/app/widgets/appbar_widgets.dart';
import 'package:Ga_Gold/app/widgets/custom_order_dilog.dart';
import 'package:Ga_Gold/domain/domain.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _debouncer = Debouncer(milliseconds: 500);
    return GetBuilder<HomeController>(
      initState: (state) {
        var controller = Get.find<HomeController>();
        controller.isSearchLoading = true;
        controller.postGetAllProduct();
        controller.scrollViewAllController.addListener(controller.onScroll);
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
          body: Utility.isLoginOrNot()
              ? Padding(
                  padding: Dimens.edgeInsets20_0_20_20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Dimens.boxHeight10,
                      TextField(
                        controller: controller.searchController,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: Dimens.fifteen),
                          filled: true,
                          fillColor: ColorsValue.textfildBorder,
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
                        ),
                        onChanged: (value) {
                          _debouncer.run(() {
                            Future.delayed(Duration(microseconds: 500), () {
                              controller.currentPage = 1;
                              controller.getAllProductDocList.clear();
                              controller.hasMore = true;
                              controller.update();
                              controller.postGetAllProduct(
                                  search: value.toString());
                            });
                            // Future.sync(
                            //   () {
                            //     if (value.isNotEmpty) {
                            //       return controller.postGetAllProduct(
                            //           search: value.toString());
                            //     } else {
                            //       return controller.postGetAllProduct(search: '');
                            //     }
                            //
                            //   },
                            // );
                          });
                        },
                      ),
                      Dimens.boxHeight20,
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () => Future.sync(
                            () async {
                              controller.isSearchLoading = true;
                              controller.update();
                              controller.postGetAllProduct(search: '');
                            },
                          ),
                          child: GridView.builder(
                            controller: controller.scrollViewAllController,
                            itemCount: controller.getAllProductDocList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: Dimens.fifteen,
                              crossAxisSpacing: Dimens.ten,
                              mainAxisExtent: Dimens.threeHundredThirty,
                            ),
                            physics: AlwaysScrollableScrollPhysics(),
                            // itemCount: controller.getAllProductDocList.length +
                            //     (controller.isLoading ? 1 : 0),
                            itemBuilder: (context, index) {
                              if (index <
                                  controller.getAllProductDocList.length) {
                                final item =
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
                                                          .whiteColor,
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
                                                                            1) {
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
                                                                    .getAllProductDocList[
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
                                                          !(item.inCart ?? true)
                                                              ? AssetConstants
                                                                  .ic_cart
                                                              : AssetConstants
                                                                  .ic_fill_cart,
                                                        ),
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
                                                                    1) {
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
                                                              softWrap: true,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
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
                              } else {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Utility.LoginNotWidget("Search"),
        );
      },
    );
  }
}
