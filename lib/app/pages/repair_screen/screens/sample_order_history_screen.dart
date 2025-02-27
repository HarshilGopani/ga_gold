import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../app.dart';

class SampleOrderHistoryScreen extends StatelessWidget {
  const SampleOrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RepairController>(
        initState: (state) {},
        builder: (controller) {
          return Scaffold(
            backgroundColor: ColorsValue.whiteColor,
            appBar: AppbarWidgets(
              onTapBack: () {
                Get.back();
              },
              title: 'sample_order_history'.tr,
              isCenter: true,
            ),
            body: ListView.builder(
              itemCount: controller.smapleListModel.length,
              itemBuilder: (context, index) {
                final item = controller.smapleListModel[index];
                return Padding(
                  padding: Dimens.edgeInsets20.copyWith(bottom: 0),
                  child: InkWell(
                    onTap: () {
                      // RouteManagement.goToSampleOrderDetailsScreen(
                      //     item.id ?? '');
                    },
                    child: Container(
                      // margin: Dimens.edgeInsetsBottom10,
                      padding: Dimens.edgeInsets10,
                      decoration: BoxDecoration(
                        color: ColorsValue.colorEEEAEA,
                        borderRadius: BorderRadius.circular(
                          Dimens.five,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  RouteManagement.goToShowFullScareenImage(
                                      item.images?.first.path ?? '', "Image");
                                },
                                child: Container(
                                  height: Dimens.fifty,
                                  width: Dimens.fifty,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      Dimens.five,
                                    ),
                                    border: Border.all(
                                      width: Dimens.one,
                                      color: ColorsValue.black343434,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      Dimens.five,
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: item.images?.first.path ?? '',
                                      fit: BoxFit.cover,
                                      height: Dimens.hundredTen,
                                      width: Dimens.hundredTen,
                                      placeholder: (context, url) {
                                        return SvgPicture.asset(
                                          AssetConstants.ic_Profile,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                      errorWidget: (context, url, error) {
                                        return SvgPicture.asset(
                                          AssetConstants.placeholder,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Dimens.boxWidth10,
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'order_date'.tr,
                                          style: Styles.grey94A3B850014,
                                        ),
                                        Text(
                                          "03, August, 2023",
                                          style: Styles.color212121W50014,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Dimens.boxHeight10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'order_id'.tr,
                                style: Styles.grey94A3B850014,
                              ),
                              Text(
                                item.orderNumber ?? '',
                                style: Styles.color212121W50014,
                              )
                            ],
                          ),
                          Dimens.boxHeight5,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'status'.tr,
                                style: Styles.grey94A3B850014,
                              ),
                              Text(
                                "Hello",
                                // item.orderTracking?.toCapitalized ?? '',
                                // style: item.orderTracking == "pending"
                                //     ? Styles.colorFFA50070012
                                //     : item.orderTracking == "completed"
                                //         ? Styles.greenW70012
                                //         : Styles.redColorGuj70010,
                                // style: Styles.appColor70014,
                              )
                            ],
                          ),
                          Dimens.boxHeight5,
                          Text(
                            item.description ?? '',
                            style: Styles.colorA7A7A750010,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            // PagedListView<int, SampleOrderHistoryDoc>(
            //   pagingController: controller.smaplePagingController,
            //   builderDelegate: PagedChildBuilderDelegate<SampleOrderHistoryDoc>(
            //     noItemsFoundIndicatorBuilder: (context) {
            //       return Center(
            //         child: Text(
            //           "Sample Order history data empty.",
            //           style: Styles.black50014,
            //         ),
            //       );
            //     },
            //     itemBuilder: (context, item, index) {
            //       return Padding(
            //         padding: Dimens.edgeInsets20_00_20_00,
            //         child: InkWell(
            //           onTap: () {
            //             // RouteManagement.goToSampleOrderDetailsScreen(
            //             //     item.id ?? '');
            //           },
            //           child: Container(
            //             margin: Dimens.edgeInsetsBottom10,
            //             padding: Dimens.edgeInsets10,
            //             decoration: BoxDecoration(
            //               color: ColorsValue.colorEEEAEA,
            //               borderRadius: BorderRadius.circular(
            //                 Dimens.five,
            //               ),
            //             ),
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Row(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     InkWell(
            //                       onTap: () {
            //                         // RouteManagement.goToShowFullScareenImage(
            //                         //     item.images?.first.path ?? '', "Image");
            //                       },
            //                       child: Container(
            //                         height: Dimens.fifty,
            //                         width: Dimens.fifty,
            //                         decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(
            //                             Dimens.five,
            //                           ),
            //                           border: Border.all(
            //                             width: Dimens.one,
            //                             color: ColorsValue.black343434,
            //                           ),
            //                         ),
            //                         child: ClipRRect(
            //                           borderRadius: BorderRadius.circular(
            //                             Dimens.five,
            //                           ),
            //                           child: CachedNetworkImage(
            //                             imageUrl: item.images?.first.path ?? '',
            //                             fit: BoxFit.cover,
            //                             height: Dimens.hundredTen,
            //                             width: Dimens.hundredTen,
            //                             placeholder: (context, url) {
            //                               return SvgPicture.asset(
            //                                 AssetConstants.ic_Profile,
            //                                 fit: BoxFit.cover,
            //                               );
            //                             },
            //                             errorWidget: (context, url, error) {
            //                               return SvgPicture.asset(
            //                                 AssetConstants.placeholder,
            //                                 fit: BoxFit.cover,
            //                               );
            //                             },
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                     Dimens.boxWidth10,
            //                     Flexible(
            //                       child: Column(
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.center,
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         children: [
            //                           Row(
            //                             mainAxisAlignment:
            //                                 MainAxisAlignment.spaceBetween,
            //                             children: [
            //                               Text(
            //                                 'order_date'.tr,
            //                                 style: Styles.grey94A3B850014,
            //                               ),
            //                               Text(
            //                                 "03, August, 2023",
            //                                 style: Styles.color212121W50014,
            //                               )
            //                             ],
            //                           ),
            //                         ],
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //                 Dimens.boxHeight10,
            //                 Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Text(
            //                       'order_id'.tr,
            //                       style: Styles.grey94A3B850014,
            //                     ),
            //                     Text(
            //                       item.orderNumber ?? '',
            //                       style: Styles.color212121W50014,
            //                     )
            //                   ],
            //                 ),
            //                 Dimens.boxHeight5,
            //                 Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Text(
            //                       'status'.tr,
            //                       style: Styles.grey94A3B850014,
            //                     ),
            //                     Text(
            //                       "Hello",
            //                       // item.orderTracking?.toCapitalized ?? '',
            //                       // style: item.orderTracking == "pending"
            //                       //     ? Styles.colorFFA50070012
            //                       //     : item.orderTracking == "completed"
            //                       //         ? Styles.greenW70012
            //                       //         : Styles.redColorGuj70010,
            //                       // style: Styles.appColor70014,
            //                     )
            //                   ],
            //                 ),
            //                 Dimens.boxHeight5,
            //                 Text(
            //                   item.description ?? '',
            //                   style: Styles.colorA7A7A750010,
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
          );
        });
  }
}
