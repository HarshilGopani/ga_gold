import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:Ga_Gold/app/app.dart';
import 'package:Ga_Gold/app/navigators/routes_management.dart';
import 'package:Ga_Gold/app/widgets/appbar_widgets.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      initState: (state) {
        var controller = Get.find<OrderController>();
        controller.postOrderHistory();
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: 'order_history'.tr,
          ),
          body: !controller.isLoading
              ? controller.allOrderListModel.isNotEmpty
                  ? SingleChildScrollView(
                      // physics: AlwaysScrollableScrollPhysics(),
                      child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: Dimens.edgeInsetsTop10,
                      shrinkWrap: true,
                      itemCount: controller.allOrderListModel.length,
                      itemBuilder: (context, index) {
                        final e = controller.allOrderListModel[index];
                        if (controller.allOrderListModel.isEmpty) {
                          return Center(
                            child: Text("No Data Found"),
                          );
                        }
                        return Padding(
                          padding:
                              Dimens.edgeInsets20_0_20_20.copyWith(bottom: 10),
                          child: GestureDetector(
                            onTap: () {
                              RouteManagement.goToOrderDetalisScreen(
                                  e.id ?? '');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorsValue.colorF8FAFC,
                                borderRadius: BorderRadius.circular(
                                  Dimens.five,
                                ),
                              ),
                              child: Padding(
                                padding: Dimens.edgeInsets10,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Total Quantity: ${e.totalQuantity}",
                                          style: Styles.color212121W90012,
                                        ),
                                        Dimens.boxHeight2,
                                        Text(
                                          "Total Weight: ${e.totalBags}gm",
                                          style: Styles.color212121W90012,
                                        ),
                                        Dimens.boxHeight2,
                                        Text(
                                          "Order Date: 25/04/2024",
                                          style: Styles.color64748W60012,
                                        ),
                                        Dimens.boxHeight5,
                                        // if (e.orderTracking == "processing" ||
                                        //     (e.invoiceUrl != null &&
                                        //         e.invoiceUrl!.isNotEmpty))
                                        //   InkWell(
                                        //       onTap: () {
                                        //         Utility.downloadPdf(
                                        //             context: context,
                                        //             url: e.invoiceUrl ?? '',
                                        //             fileName: e.products?[0]
                                        //                     .productName ??
                                        //                 'Ga Product');
                                        //       },
                                        //       child: Icon(Icons.download))
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          e.orderTracking?.toCapitalized ?? '',
                                          style: e.orderTracking == "pending"
                                              ? Styles.colorFFA50070012
                                              : e.orderTracking == "completed"
                                                  ? Styles.greenW70012
                                                  : e.orderTracking ==
                                                          "processing"
                                                      ? Styles.colorFFA500W70012
                                                      : Styles.redColorGuj70010,
                                        ),
                                        Text(
                                          "Order No: ${e.orderNo}",
                                          style: Styles.color64748W60012,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )

                      // Wrap(
                      //   children: controller.orderListModel.map(
                      //     (e) {
                      //       return Padding(
                      //         padding: Dimens.edgeInsets20_0_20_20
                      //             .copyWith(bottom: 10),
                      //         child: Container(
                      //           decoration: BoxDecoration(
                      //             color: ColorsValue.colorEEEAEA,
                      //             borderRadius: BorderRadius.circular(
                      //               Dimens.five,
                      //             ),
                      //           ),
                      //           child: Padding(
                      //             padding: Dimens.edgeInsets10,
                      //             child: Row(
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: [
                      //                 InkWell(
                      //                   onTap: () {
                      //                     RouteManagement
                      //                         .goToShowFullScareenImage(
                      //                             e.productImage ?? '',
                      //                             "Image");
                      //                   },
                      //                   child: Container(
                      //                     height: Dimens.eighty,
                      //                     width: Dimens.eighty,
                      //                     decoration: BoxDecoration(
                      //                       borderRadius: BorderRadius.circular(
                      //                         Dimens.five,
                      //                       ),
                      //                       color: ColorsValue.whiteColor,
                      //                     ),
                      //                     child: ClipRRect(
                      //                       borderRadius: BorderRadius.circular(
                      //                         Dimens.five,
                      //                       ),
                      //                       child: CachedNetworkImage(
                      //                         imageUrl: e.productImage ?? "",
                      //                         fit: BoxFit.cover,
                      //                         height: Dimens.eighty,
                      //                         width: Dimens.eighty,
                      //                         placeholder: (context, url) {
                      //                           return Image.asset(
                      //                               AssetConstants.placeholder,
                      //                               fit: BoxFit.cover);
                      //                         },
                      //                         errorWidget:
                      //                             (context, url, error) {
                      //                           return Image.asset(
                      //                               AssetConstants.placeholder,
                      //                               fit: BoxFit.cover);
                      //                         },
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 Dimens.boxWidth10,
                      //                 Expanded(
                      //                   child: Column(
                      //                     crossAxisAlignment:
                      //                         CrossAxisAlignment.start,
                      //                     mainAxisSize: MainAxisSize.min,
                      //                     children: [
                      //                       Row(
                      //                         mainAxisAlignment:
                      //                             MainAxisAlignment
                      //                                 .spaceBetween,
                      //                         children: [
                      //                           Text(
                      //                             "${"total_quentity".tr} ${e.quantity}",
                      //                             style:
                      //                                 Styles.color212121W90012,
                      //                           ),
                      //                           Text(
                      //                             Utility.capitalize(
                      //                                 e.productOrderTracking ??
                      //                                     ""),
                      //                             style: e.productOrderTracking ==
                      //                                         "processing" ||
                      //                                     e.productOrderTracking ==
                      //                                         "pending"
                      //                                 ? Styles.appColor70010
                      //                                 : e.productOrderTracking ==
                      //                                         "Cancel"
                      //                                     ? Styles
                      //                                         .redColorW70010
                      //                                     : Styles.greenW70010,
                      //                           ),
                      //                         ],
                      //                       ),
                      //                       Dimens.boxHeight5,
                      //                       Text(
                      //                         "${"order_date".tr} ${Utility.getFormatedDateTime(e.orderCreated ?? 0)}",
                      //                         style: Styles.appColor70012,
                      //                       ),
                      //                       Dimens.boxHeight5,
                      //                       Flexible(
                      //                         child: Text(
                      //                           e.description ?? '',
                      //                           maxLines: 3,
                      //                           overflow: TextOverflow.ellipsis,
                      //                           style: Styles.colorA7A7A750012,
                      //                         ),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       );
                      //     },
                      //   ).toList(),
                      // ),
                      )
                  : const Center(
                      child: Text("No Data Found"),
                    )
              : const Center(
                  child: Text("No Data Found"),
                ),
        );
      },
    );
  }
}
