import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ga_gold/app/widgets/custom_product_dialog.dart';
import 'package:ga_gold/domain/domain.dart';
import 'package:get/get.dart';

import '../../../app.dart';

class OrderDetalisScreen extends StatelessWidget {
  const OrderDetalisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      initState: (state) {
        final controller = Get.find<OrderController>();
        controller.getOneOrderData?.products = [
          DataProduct(),
        ];
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          appBar: AppbarWidgets(
            onTapBack: () {
              Get.back();
            },
            title: 'order_details'.tr,
            isCenter: true,
          ),
          body: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: Dimens.edgeInsets20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "final_des".tr,
                    //   style: Styles.color21212170014,
                    // ),
                    // Dimens.boxHeight5,
                    // Text(
                    //   controller.getOneOrderData?.mainDescription ?? "",
                    //   maxLines: 3,
                    //   overflow: TextOverflow.ellipsis,
                    //   style: Styles.colorA7A7A750012,
                    // ),
                    // Dimens.boxHeight20,
                    Wrap(
                      children: controller.getOneOrderData?.products?.map((e) {
                            return Padding(
                              padding: Dimens.edgeInsetsBottom10,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorsValue.colorDFDFDF,
                                  borderRadius: BorderRadius.circular(
                                    Dimens.ten,
                                  ),
                                ),
                                child: Padding(
                                  padding: Dimens.edgeInsets10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              RouteManagement
                                                  .goToShowFullScareenImage(
                                                      e.productImage ?? '',
                                                      "Image");
                                            },
                                            child: Container(
                                              height: Dimens.eighty,
                                              width: Dimens.eighty,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  Dimens.five,
                                                ),
                                                color: ColorsValue.whiteColor,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  Dimens.five,
                                                ),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      e.productImage ?? '',
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
                                          ),
                                          Dimens.boxWidth10,
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Diamond Ring",
                                                  style:
                                                      Styles.color212121W90010,
                                                ),
                                                Dimens.boxHeight5,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("Actual Weight:"),
                                                        Text("10.89 gm"),
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                            "Total Quantity: 10"),
                                                        Text(
                                                            "Total Weight: 100gm"),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Dimens.boxHeight5,
                                                Text(
                                                  e.description ?? '',
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      Styles.colorA7A7A750010,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Dimens.boxHeight10,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            child: Text("data"),
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    CustomDialog(
                                                  imageUrl:
                                                      'https://example.com/image.png',
                                                  title: 'Diamond Ring',
                                                  actualWeight: '10.89',
                                                  goldPurity: '18kt Rose',
                                                  weight: '10gm',
                                                  size: '10.3',
                                                  quantity: 2,
                                                  totalWeight: 10.89,
                                                ),
                                              );
                                            },
                                          ),
                                          Text("data"),
                                          Text("data"),
                                        ],
                                      ),
                                      if (e.description?.isEmpty ?? false) ...[
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
                                        Container(
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
                                              e.description ??
                                                  "Description Text",
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: Styles.color6474860016,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList() ??
                          [],
                    ),
                    // Dimens.boxHeight20,
                    // if (controller.getOneOrderData?.bags?.isNotEmpty ??
                    //     false) ...[
                    //   Text(
                    //     "${"total_bag".tr} ${controller.getOneOrderData?.totalBags ?? ""}",
                    //     style: Styles.appColor70014,
                    //   ),
                    //   Dimens.boxHeight12,
                    //   Wrap(
                    //     children: controller.getOneOrderData?.bags
                    //             ?.asMap()
                    //             .entries
                    //             .map(
                    //           (e) {
                    //             return Container(
                    //               margin: Dimens.edgeInsetsBottom10,
                    //               padding: Dimens.edgeInsets20_00_20_00,
                    //               decoration: BoxDecoration(
                    //                 color: ColorsValue.colorEEEAEA,
                    //                 borderRadius: BorderRadius.circular(
                    //                   Dimens.six,
                    //                 ),
                    //               ),
                    //               child: ListTile(
                    //                 onTap: () {
                    //                   RouteManagement.goToBagDetailScreen(
                    //                       e.value.id ?? "");
                    //                 },
                    //                 contentPadding: Dimens.edgeInsets0,
                    //                 title: Text(
                    //                   "Bag ${e.value.bagNumber}",
                    //                   style: Styles.color21212160014,
                    //                 ),
                    //                 trailing: SvgPicture.asset(
                    //                   AssetConstants.ic_right_arrow,
                    //                   colorFilter: const ColorFilter.mode(
                    //                     ColorsValue.blackColor,
                    //                     BlendMode.srcIn,
                    //                   ),
                    //                 ),
                    //               ),
                    //             );
                    //           },
                    //         ).toList() ??
                    //         [],
                    //   )
                    // ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
