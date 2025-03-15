// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:ga_final/app/app.dart';
// import 'package:ga_final/app/widgets/appbar_widgets.dart';
// import 'package:ga_final/app/widgets/custom_button.dart';
//
// class ShoppingCartScreen extends StatelessWidget {
//   const ShoppingCartScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ShoppingCartController>(
//       initState: (state) async {
//         var controller = Get.find<ShoppingCartController>();
//         controller.postCartList(1);
//         controller.scrollCartController.addListener(() async {
//           if (controller.scrollCartController.position.pixels ==
//               controller.scrollCartController.position.maxScrollExtent) {
//             if (controller.isCartLoading == false) {
//               controller.isCartLoading = true;
//               controller.update();
//               if (controller.isCartLastPage == false) {
//                 await controller.postCartList(controller.pageCartCount);
//               }
//               controller.isCartLoading = false;
//               controller.update();
//             }
//           }
//         });
//       },
//       builder: (controller) {
//         return Scaffold(
//           backgroundColor: ColorsValue.whiteColor,
//           appBar: AppBarWidget(
//             onTapBack: () {
//               Get.back();
//             },
//             title: 'cart'.tr,
//             isBottomVisible: false,
//             isVisible: Get.arguments ?? false ? true : false,
//           ),
//           bottomNavigationBar: controller.cartList.isNotEmpty
//               ? Padding(
//                   padding: Dimens.edgeInsets20,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       CustomButton(
//                         height: Dimens.fourtyFive,
//                         text: 'Checkout',
//                         style: Styles.whiteW80014,
//                         onTap: () {
//                           Utility.showLoader();
//                           controller.postOrderCreate();
//                         },
//                       ),
//                       Dimens.boxHeight10,
//                     ],
//                   ),
//                 )
//               : const SizedBox.shrink(),
//           body: !controller.isLoader
//               ? controller.cartList.isNotEmpty
//                   ? SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           ListView.builder(
//                             itemCount: controller.cartList.length,
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             itemBuilder: (context, index) {
//                               var item = controller.cartList[index];
//                               return Padding(
//                                 padding: Dimens.edgeInsets20_10_20_10,
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     color: ColorsValue.colorEEEAEA,
//                                     borderRadius: BorderRadius.circular(
//                                       Dimens.five,
//                                     ),
//                                   ),
//                                   child: Padding(
//                                     padding: Dimens.edgeInsets10,
//                                     child: Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           height: Dimens.eighty,
//                                           width: Dimens.eighty,
//                                           decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(
//                                               Dimens.five,
//                                             ),
//                                             color: Colors.white,
//                                           ),
//                                           child: ClipRRect(
//                                             borderRadius: BorderRadius.circular(
//                                               Dimens.five,
//                                             ),
//                                             child: CachedNetworkImage(
//                                               imageUrl:
//                                                   item.product?.image ?? "",
//                                               fit: BoxFit.cover,
//                                               placeholder: (context, url) {
//                                                 return Image.asset(
//                                                     AssetConstants.placeholder,
//                                                     fit: BoxFit.cover);
//                                               },
//                                               errorWidget:
//                                                   (context, url, error) {
//                                                 return Image.asset(
//                                                     AssetConstants.placeholder,
//                                                     fit: BoxFit.cover);
//                                               },
//                                             ),
//                                           ),
//                                         ),
//                                         Dimens.boxWidth10,
//                                         Flexible(
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Row(
//                                                 spacing: Dimens.twenty,
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Flexible(
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .start,
//                                                       children: [
//                                                         Text(
//                                                           item.product?.name ??
//                                                               "",
//                                                           style: Styles
//                                                               .color212121W70014,
//                                                           maxLines: 1,
//                                                           overflow: TextOverflow
//                                                               .ellipsis,
//                                                         ),
//                                                         Dimens.boxHeight5,
//                                                         Text(
//                                                           "${'actual_weight'.tr}\n${item.product?.weight} gm",
//                                                           style: Styles
//                                                               .color9C9C9CW50012,
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   InkWell(
//                                                     onTap: () {
//                                                       Utility.showLoader();
//                                                       controller
//                                                           .postCartProductRemove(
//                                                               item);
//                                                     },
//                                                     child: Row(
//                                                       children: [
//                                                         SvgPicture.asset(
//                                                           AssetConstants
//                                                               .ic_delete,
//                                                           colorFilter:
//                                                               ColorFilter.mode(
//                                                             ColorsValue
//                                                                 .redColor,
//                                                             BlendMode.srcIn,
//                                                           ),
//                                                         ),
//                                                         Dimens.boxWidth10,
//                                                         Text(
//                                                           'remove'.tr,
//                                                           style:
//                                                               Styles.redW70014,
//                                                         )
//                                                       ],
//                                                     ),
//                                                   )
//                                                 ],
//                                               ),
//                                               Dimens.boxHeight5,
//                                               Row(
//                                                 children: [
//                                                   InkWell(
//                                                     onTap: () {
//                                                       if (controller
//                                                               .cartList[index]
//                                                               .quantity >
//                                                           0) {
//                                                         controller
//                                                             .cartList[index]
//                                                             .quantity--;
//                                                       }
//                                                       controller.update();
//                                                     },
//                                                     child: SvgPicture.asset(
//                                                       AssetConstants
//                                                           .ic_minus_icon,
//                                                       height: Dimens.twentyFour,
//                                                       width: Dimens.twentyFour,
//                                                     ),
//                                                   ),
//                                                   Dimens.boxWidth10,
//                                                   Text(
//                                                     controller.cartList[index]
//                                                         .quantity
//                                                         .toString(),
//                                                     style:
//                                                         Styles.color47556970014,
//                                                   ),
//                                                   Dimens.boxWidth10,
//                                                   InkWell(
//                                                     onTap: () {
//                                                       controller.cartList[index]
//                                                           .quantity++;
//                                                       controller.update();
//                                                     },
//                                                     child: SvgPicture.asset(
//                                                       AssetConstants
//                                                           .ic_plus_icon,
//                                                       height: Dimens.twentyFour,
//                                                       width: Dimens.twentyFour,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               Dimens.boxHeight5,
//                                               if (item.description?.isEmpty ??
//                                                   false) ...[
//                                                 InkWell(
//                                                   onTap: () {
//                                                     controller
//                                                         .showProductDescription(
//                                                             context,
//                                                             item,
//                                                             index);
//                                                   },
//                                                   child: Container(
//                                                     width: double.maxFinite,
//                                                     padding: Dimens
//                                                         .edgeInsets6_4_6_4,
//                                                     decoration: BoxDecoration(
//                                                       color: ColorsValue
//                                                           .colorD9D9D9,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                         Dimens.five,
//                                                       ),
//                                                     ),
//                                                     child: Text(
//                                                       'Add Remark',
//                                                       style: Styles
//                                                           .colorA7A7A750010,
//                                                     ),
//                                                   ),
//                                                 )
//                                               ] else ...[
//                                                 Text(
//                                                   item.description ?? "",
//                                                   maxLines: 3,
//                                                   overflow:
//                                                       TextOverflow.ellipsis,
//                                                   style:
//                                                       Styles.colorA7A7A750010,
//                                                 ),
//                                               ]
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           )
//                         ],
//                       ),
//                     )
//                   : Center(
//                       child: Text(
//                         "Cart list not found....!",
//                         style: Styles.black60016,
//                       ),
//                     )
//               : Center(
//                   child: CircularProgressIndicator(),
//                 ),
//         );
//       },
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ga_final/app/app.dart';
import 'package:ga_final/app/widgets/appbar_widgets.dart';
import 'package:ga_final/app/widgets/custom_button.dart';
import 'package:ga_final/domain/models/cart_list_model.dart';
import 'package:get/get.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppingCartController>(
      initState: (state) async {
        var controller = Get.find<ShoppingCartController>();
        controller.postCartList(1);
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          appBar: AppBarWidget(
            onTapBack: () {},
            title: 'cart'.tr,
            isVisible: false,
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
                        onTap: controller.postOrderCreate,
                      ),
                      Dimens.boxHeight10,
                    ],
                  ),
                )
              : const SizedBox.shrink(),
          body: controller.isLoader
              ? Center(child: CircularProgressIndicator())
              : controller.cartList.isNotEmpty
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                            itemCount: controller.cartList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var item = controller.cartList[index];
                              return Padding(
                                padding: Dimens.edgeInsets20_10_20_10,
                                child: Container(
                                  padding: Dimens.edgeInsets10,
                                  decoration: BoxDecoration(
                                    color: ColorsValue.whiteColor,
                                    borderRadius:
                                        BorderRadius.circular(Dimens.five),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                Dimens.five),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  item.product?.image ?? "",
                                              height: Dimens.hundred,
                                              width: Dimens.hundred,
                                              fit: BoxFit.cover,
                                              placeholder: (_, __) =>
                                                  Image.asset(AssetConstants
                                                      .placeholder),
                                              errorWidget: (_, __, ___) =>
                                                  Image.asset(AssetConstants
                                                      .placeholder),
                                            ),
                                          ),
                                          Dimens.boxWidth10,
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        item.product?.name ??
                                                            "",
                                                        style: Styles
                                                            .color212121W70014,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () => controller
                                                          .postCartProductRemove(
                                                              item),
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                            AssetConstants
                                                                .ic_delete,
                                                            color: ColorsValue
                                                                .redColor,
                                                          ),
                                                          Dimens.boxWidth5,
                                                          Text(
                                                            'Remove',
                                                            style: Styles
                                                                .redW70014,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Dimens.boxHeight5,
                                                Text(
                                                    "Actual Weight: \n${item.product?.weight} gm",
                                                    style: Styles
                                                        .color9C9C9CW50012),
                                                Dimens.boxHeight10,
                                                Row(
                                                  children: [
                                                    _quantityButton(
                                                        () => controller
                                                            .decreaseQuantity(
                                                                index),
                                                        'assets/svg/cart_minuse.svg'),
                                                    Dimens.boxWidth10,
                                                    Text(
                                                        controller
                                                            .cartList[index]
                                                            .quantity
                                                            .toString(),
                                                        style: Styles
                                                            .color47556970014),
                                                    Dimens.boxWidth10,
                                                    _quantityButton(
                                                        () => controller
                                                            .increaseQuantity(
                                                                index),
                                                        'assets/svg/cart_plus.svg'),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Dimens.boxHeight5,
                                      _infoTag(
                                        title: "Gold purity",
                                        controller: controller
                                            .cartList[index]
                                            .tcGoldPurity ??
                                            TextEditingController(),
                                        item: item,
                                        index: index,
                                        getController: controller,
                                      ),
                                      Dimens.boxHeight8,
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: _infoTag(
                                              title: "Weight",
                                              controller: controller
                                                      .cartList[index].tcWeight ??
                                                  TextEditingController(),
                                              item: item,
                                              index: index,
                                              isWeigth: true,
                                              getController: controller,
                                            ),
                                          ),
                                          Dimens.boxWidth10,
                                          Expanded(
                                            child: _infoTag(
                                              title: "Size",
                                              controller: controller
                                                      .cartList[index].tcSize ??
                                                  TextEditingController(),
                                              item: item,
                                              index: index,
                                              isSize: true,
                                              getController: controller,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Dimens.boxHeight8,
                                      if (item.description?.isEmpty ??
                                          false) ...[
                                        InkWell(
                                          onTap: () {
                                            controller.showProductDescription(
                                                context, item, index);
                                          },
                                          child: Container(
                                            constraints:
                                                BoxConstraints(maxWidth: 250),
                                            width: double.maxFinite,
                                            padding: Dimens.edgeInsets8,
                                            decoration: BoxDecoration(
                                              color: ColorsValue.textfildBorder,
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
                                      ] else ...[
                                        Text(
                                          item.description ?? "",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: Styles.colorA7A7A750010,
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              );
                            },
                          )

                          //     List.generate(controller.cartList.length, (index) {
                          //   var item = controller.cartList[index];
                          //   return Padding(
                          //     padding: Dimens.edgeInsets20_10_20_10,
                          //     child: Container(
                          //       padding: Dimens.edgeInsets10,
                          //       decoration: BoxDecoration(
                          //         color: ColorsValue.whiteColor,
                          //         borderRadius:
                          //             BorderRadius.circular(Dimens.five),
                          //         boxShadow: [
                          //           BoxShadow(
                          //             color: Colors.black12,
                          //             blurRadius: 5,
                          //           ),
                          //         ],
                          //       ),
                          //       child: Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           Row(
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //             children: [
                          //               ClipRRect(
                          //                 borderRadius:
                          //                     BorderRadius.circular(Dimens.five),
                          //                 child: CachedNetworkImage(
                          //                   imageUrl: item.product?.image ?? "",
                          //                   height: Dimens.hundred,
                          //                   width: Dimens.hundred,
                          //                   fit: BoxFit.cover,
                          //                   placeholder: (_, __) => Image.asset(
                          //                       AssetConstants.placeholder),
                          //                   errorWidget: (_, __, ___) =>
                          //                       Image.asset(
                          //                           AssetConstants.placeholder),
                          //                 ),
                          //               ),
                          //               Dimens.boxWidth10,
                          //               Expanded(
                          //                 child: Column(
                          //                   crossAxisAlignment:
                          //                       CrossAxisAlignment.start,
                          //                   children: [
                          //                     Row(
                          //                       mainAxisAlignment:
                          //                           MainAxisAlignment
                          //                               .spaceBetween,
                          //                       children: [
                          //                         Expanded(
                          //                           child: Text(
                          //                             item.product?.name ?? "",
                          //                             style: Styles
                          //                                 .color212121W70014,
                          //                             maxLines: 1,
                          //                             overflow:
                          //                                 TextOverflow.ellipsis,
                          //                           ),
                          //                         ),
                          //                         InkWell(
                          //                           onTap: () => controller
                          //                               .postCartProductRemove(
                          //                                   item),
                          //                           child: Row(
                          //                             children: [
                          //                               SvgPicture.asset(
                          //                                   AssetConstants
                          //                                       .ic_delete,
                          //                                   color: ColorsValue
                          //                                       .redColor),
                          //                               Dimens.boxWidth5,
                          //                               Text('Remove',
                          //                                   style:
                          //                                       Styles.redW70014),
                          //                             ],
                          //                           ),
                          //                         ),
                          //                       ],
                          //                     ),
                          //                     Dimens.boxHeight5,
                          //                     Text(
                          //                         "Actual Weight: \n${item.product?.weight} gm",
                          //                         style:
                          //                             Styles.color9C9C9CW50012),
                          //                     Dimens.boxHeight10,
                          //                     Row(
                          //                       children: [
                          //                         _quantityButton(
                          //                             () => controller
                          //                                 .decreaseQuantity(
                          //                                     index),
                          //                             'assets/svg/cart_minuse.svg'),
                          //                         Dimens.boxWidth10,
                          //                         Text(
                          //                             controller.cartList[index]
                          //                                 .quantity
                          //                                 .toString(),
                          //                             style: Styles
                          //                                 .color47556970014),
                          //                         Dimens.boxWidth10,
                          //                         _quantityButton(
                          //                             () => controller
                          //                                 .increaseQuantity(
                          //                                     index),
                          //                             'assets/svg/cart_plus.svg'),
                          //                       ],
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //           Dimens.boxHeight5,
                          //           Row(
                          //             children: [
                          //               _infoTag(
                          //                 title: "Gold purity",
                          //                 controller:
                          //                     controller.goldPurityController,
                          //                 item: item,
                          //                 index: index,
                          //                 getController: controller,
                          //               ),
                          //               Dimens.boxWidth10,
                          //               _infoTag(
                          //                 title: "Weight",
                          //                 controller: controller.weightController,
                          //                 item: item,
                          //                 index: index,
                          //                 isWeigth: true,
                          //                 getController: controller,
                          //               ),
                          //               Dimens.boxWidth10,
                          //               _infoTag(
                          //                 title: "Size",
                          //                 controller: controller.sizeController,
                          //                 item: item,
                          //                 index: index,
                          //                 isSize: true,
                          //                 getController: controller,
                          //               ),
                          //             ],
                          //           ),
                          //           Dimens.boxHeight5,
                          //           if (item.description?.isEmpty ?? false) ...[
                          //             InkWell(
                          //               onTap: () {
                          //                 controller.showProductDescription(
                          //                     context, item, index);
                          //               },
                          //               child: Container(
                          //                 constraints:
                          //                     BoxConstraints(maxWidth: 250),
                          //                 width: double.maxFinite,
                          //                 padding: Dimens.edgeInsets8,
                          //                 decoration: BoxDecoration(
                          //                   color: ColorsValue.textfildBorder,
                          //                   borderRadius: BorderRadius.circular(
                          //                     Dimens.five,
                          //                   ),
                          //                 ),
                          //                 child: Text(
                          //                   'Add Remark',
                          //                   style: Styles.colorA7A7A750010,
                          //                 ),
                          //               ),
                          //             ),
                          //           ] else ...[
                          //             Text(
                          //               item.description ?? "",
                          //               maxLines: 3,
                          //               overflow: TextOverflow.ellipsis,
                          //               style: Styles.colorA7A7A750010,
                          //             ),
                          //           ],
                          //         ],
                          //       ),
                          //     ),
                          //   );
                          // }),
                        ],
                      ),
                    )
                  : Center(
                      child: Text("Cart list not found....!",
                          style: Styles.black60016)),
        );
      },
    );
  }

  Widget _infoTag({
    bool isWeigth = false,
    bool isSize = false,
    required int index,
    required String title,
    required TextEditingController controller,
    required CartItemProductElement item,
    required ShoppingCartController getController,
  }) {
    // controller = List.generate(
    //     getController.cartList.length, (index) => TextEditingController());

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: ColorsValue.textfildBorder,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Text("$title : ", style: Styles.color475569W70012),
            Dimens.boxWidth4,
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  isDense: true, // Reduces extra spacing
                ),
                style: Styles.color64748B50012,
                onChanged: (value) {
                  if (isWeigth == true) {
                    getController.cartList[index].weight = value;
                    getController.cartList[index].tcGoldPurity?.text = value;
                  } else if (isSize == true) {
                    getController.cartList[index].size = value;
                    getController.cartList[index].tcSize?.text = value;
                  } else {
                    getController.cartList[index].priority = value;
                    getController.cartList[index].tcGoldPurity?.text = value;
                  }
                },
              ),
            )
          ],
        )
        // child: Text("$title: $value", style: Styles.color212121W70012),
        );
  }

  Widget _quantityButton(VoidCallback onTap, String asset) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(asset, height: 24, width: 24),
    );
  }
}
