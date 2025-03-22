import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:Ga_Gold/app/app.dart';
import 'package:Ga_Gold/app/navigators/navigators.dart';
import 'package:Ga_Gold/app/widgets/appbar_widgets.dart';
import 'package:Ga_Gold/domain/models/models.dart';

class RepairOrderHistoryScreen extends StatelessWidget {
  const RepairOrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RepairController>(initState: (state) {
      var controller = Get.find<RepairController>();
      controller.repairOrderPagingController.addPageRequestListener(
        (pageKey) async {
          await controller.repairOrderListData(pageKey);
        },
      );
    }, builder: (controller) {
      return Scaffold(
        backgroundColor: ColorsValue.whiteColor,
        appBar: AppBarWidget(
          onTapBack: () {
            Get.back();
          },
          title: 'repair_order_history'.tr,
        ),
        body: PagedListView<int, RepairOrderHistoryDoc>(
          pagingController: controller.repairOrderPagingController,
          padding: Dimens.edgeInsetsTop10,
          builderDelegate: PagedChildBuilderDelegate<RepairOrderHistoryDoc>(
            noItemsFoundIndicatorBuilder: (context) {
              return const Center(
                child: Text('No Data Found'),
              );
            },
            itemBuilder: (context, item, index) {
              return Padding(
                padding: Dimens.edgeInsets20_0_20_20.copyWith(bottom: 10),
                child: InkWell(
                  onTap: () {
                    RouteManagement.goToRepairOrderDetalisScreen(item.id ?? '');
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total Weight: ${item.weight}gm",
                                  style: Styles.color212121W90012,
                                ),
                                Dimens.boxHeight2,
                                Text(
                                  "Order Date: 25/04/2024",
                                  style: Styles.color64748W60012,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  item.orderTracking?.toCapitalized ?? '',
                                  style: item.orderTracking == "pending"
                                      ? Styles.colorFFA50070012
                                      : item.orderTracking == "completed"
                                          ? Styles.greenW70012
                                          : Styles.redColorGuj70010,
                                ),
                                Text(
                                  "Order No: ${item.orderNumber}",
                                  style: Styles.color64748W60012,
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                ),
              );
              // return Padding(
              //   padding: Dimens.edgeInsets20_00_20_00,
              //   child: InkWell(
              //     onTap: () {
              //       RouteManagement.goToRepairOrderDetalisScreen(item.id ?? '');
              //     },
              //     child: Container(
              //       margin: Dimens.edgeInsetsBottom10,
              //       padding: Dimens.edgeInsets10,
              //       decoration: BoxDecoration(
              //         color: ColorsValue.colorEEEAEA,
              //         borderRadius: BorderRadius.circular(
              //           Dimens.five,
              //         ),
              //       ),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Row(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               InkWell(
              //                 onTap: () {
              //                   RouteManagement.goToShowFullScareenImage(
              //                       item.file ?? '', "Image");
              //                 },
              //                 child: Container(
              //                   height: Dimens.fifty,
              //                   width: Dimens.fifty,
              //                   decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(
              //                       Dimens.five,
              //                     ),
              //                     border: Border.all(
              //                       width: Dimens.one,
              //                       color: ColorsValue.black343434,
              //                     ),
              //                   ),
              //                   child: ClipRRect(
              //                     borderRadius: BorderRadius.circular(
              //                       Dimens.five,
              //                     ),
              //                     child: CachedNetworkImage(
              //                       imageUrl: item.file ?? '',
              //                       fit: BoxFit.cover,
              //                       height: Dimens.hundredTen,
              //                       width: Dimens.hundredTen,
              //                       placeholder: (context, url) {
              //                         return SvgPicture.asset(
              //                           AssetConstants.usera,
              //                           fit: BoxFit.cover,
              //                         );
              //                       },
              //                       errorWidget: (context, url, error) {
              //                         return SvgPicture.asset(
              //                           AssetConstants.usera,
              //                           fit: BoxFit.cover,
              //                         );
              //                       },
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               Dimens.boxWidth10,
              //               Flexible(
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   children: [
              //                     Row(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.spaceBetween,
              //                       children: [
              //                         Text(
              //                           'order_date'.tr,
              //                           style: Styles.grey94A3B850014,
              //                         ),
              //                         Text(
              //                           item.createdAt?.dateFormate ?? '',
              //                           style: Styles.color212121W50014,
              //                         )
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               )
              //             ],
              //           ),
              //           Dimens.boxHeight10,
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 'order_id'.tr,
              //                 style: Styles.grey94A3B850014,
              //               ),
              //               Text(
              //                 item.orderNumber ?? '',
              //                 style: Styles.color212121W50014,
              //               )
              //             ],
              //           ),
              //           Dimens.boxHeight5,
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 'status'.tr,
              //                 style: Styles.grey94A3B850014,
              //               ),
              //               Text(
              //                 item.orderTracking?.toCapitalized ?? '',
              //                 style: item.orderTracking == "pending"
              //                     ? Styles.colorFFA50070012
              //                     : item.orderTracking == "completed"
              //                         ? Styles.greenW70012
              //                         : Styles.redColorGuj70010,
              //               )
              //             ],
              //           ),
              //           Dimens.boxHeight5,
              //           Text(
              //             item.description ?? '',
              //             style: Styles.colorA7A7A750010,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // );
            },
          ),
        ),
      );
    });
  }
}
