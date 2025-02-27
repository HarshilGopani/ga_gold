import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../app.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppingCartController>(
      // initState: (state) async {
      //   var controller = Get.find<ShoppingCartController>();
      //   controller.postCartList(1);
      //   controller.scrollCartController.addListener(() async {
      //     if (controller.scrollCartController.position.pixels ==
      //         controller.scrollCartController.position.maxScrollExtent) {
      //       if (controller.isCartLoading == false) {
      //         controller.isCartLoading = true;
      //         controller.update();
      //         if (controller.isCartLastPage == false) {
      //           await controller.postCartList(controller.pageCartCount);
      //         }
      //         controller.isCartLoading = false;
      //         controller.update();
      //       }
      // }
      // });
      // },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          appBar: AppbarWidgets(
            onTapBack: () {
              Get.back();
            },
            title: 'cart'.tr,
            isCenter: true,
            isVisible: Get.arguments ?? false ? true : false,
          ),
          bottomNavigationBar: controller.cartList.isNotEmpty
              ? Padding(
                  padding: Dimens.edgeInsets20,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomButton(
                        height: Dimens.fourtyFive,
                        text: 'Checkout',
                        style: Styles.whiteW80014,
                        onTap: () {
                          // controller.postOrderCreate();
                        },
                      ),
                      Dimens.boxHeight10,
                    ],
                  ),
                )
              : const SizedBox.shrink(),
          body: !controller.isLoader
              ? controller.cartList.isNotEmpty
                  ? SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListView.builder(
                            itemCount: controller.cartList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var item = controller.cartList[index];
                              return Padding(
                                padding: Dimens.edgeInsets20_10_20_10,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorsValue.colorDFDFDF,
                                    borderRadius: BorderRadius.circular(
                                      Dimens.five,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: Dimens.edgeInsets10
                                            .copyWith(bottom: 5),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: Dimens.eighty,
                                              width: Dimens.eighty,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  Dimens.five,
                                                ),
                                                color: Colors.white,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  Dimens.five,
                                                ),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      item.product?.image ?? "",
                                                  fit: BoxFit.cover,
                                                  placeholder: (context, url) {
                                                    return Image.asset(
                                                        AssetConstants
                                                            .placeholder,
                                                        fit: BoxFit.cover);
                                                  },
                                                  errorWidget:
                                                      (context, url, error) {
                                                    return Image.asset(
                                                        AssetConstants
                                                            .placeholder,
                                                        fit: BoxFit.cover);
                                                  },
                                                ),
                                              ),
                                            ),
                                            Dimens.boxWidth10,
                                            Flexible(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Diamond Ring',
                                                                style: Styles
                                                                    .color212121W70012,
                                                              ),
                                                            ],
                                                          ),
                                                          Dimens.boxHeight5,
                                                          Text(
                                                            "${'weight'.tr} : \n${item.product?.weight}",
                                                            style: Styles
                                                                .color9C9C9CW50010,
                                                          ),
                                                        ],
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          // controller
                                                          //     .postCartProductRemove(
                                                          //         item);
                                                        },
                                                        child: Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                              AssetConstants
                                                                  .ic_delete,
                                                            ),
                                                            Dimens.boxWidth10,
                                                            Text(
                                                              'remove'.tr,
                                                              style: Styles
                                                                  .color212121W70010,
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Dimens.boxHeight5,
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          if (controller
                                                                  .cartList[
                                                                      index]
                                                                  .quantity >
                                                              0) {
                                                            controller
                                                                .cartList[index]
                                                                .quantity--;
                                                          }
                                                          controller.update();
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              Dimens.ten,
                                                            ),
                                                          ),
                                                          child:
                                                              SvgPicture.asset(
                                                            AssetConstants
                                                                .ic_minus_cart,
                                                          ),
                                                        ),
                                                      ),
                                                      Dimens.boxWidth10,
                                                      Text(
                                                        controller
                                                            .cartList[index]
                                                            .quantity
                                                            .toString(),
                                                        style: Styles
                                                            .appColor70010,
                                                      ),
                                                      Dimens.boxWidth10,
                                                      GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .cartList[index]
                                                              .quantity++;
                                                          controller.update();
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        Dimens
                                                                            .ten),
                                                          ),
                                                          child:
                                                              SvgPicture.asset(
                                                            colorFilter:
                                                                ColorFilter
                                                                    .mode(
                                                              ColorsValue
                                                                  .redColor,
                                                              BlendMode.darken,
                                                            ),
                                                            AssetConstants
                                                                .ic_plus_cart,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Dimens.boxHeight5,
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (item.description?.isEmpty ??
                                          false) ...[
                                        Container(
                                          constraints:
                                              BoxConstraints(minWidth: 270),
                                          child: InkWell(
                                            onTap: () {},
                                            child: Container(
                                              width: double.maxFinite,
                                              padding: Dimens.edgeInsets6_4_6_4,
                                              decoration: BoxDecoration(
                                                color: ColorsValue.colorD9D9D9,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  Dimens.five,
                                                ),
                                              ),
                                              child: Text(
                                                'Add Remark',
                                                style: Styles.colorA7A7A750010,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ] else ...[
                                        Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Container(
                                            constraints:
                                                BoxConstraints(minWidth: 270),
                                            decoration: BoxDecoration(
                                              color: ColorsValue.textfildBorder,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Padding(
                                              padding: Dimens.edgeInsets6,
                                              child: Text(
                                                item.description ?? "",
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: Styles.color6474860016,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                      Dimens.boxHeight10,
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: Text(
                        "Cart list not found....!",
                        style: Styles.black60016,
                      ),
                    )
              : Center(
                  child: CircularProgressIndicator(
                    color: Color(ColorsValue.lightPrimary),
                  ),
                ),
        );
      },
    );
  }
}
