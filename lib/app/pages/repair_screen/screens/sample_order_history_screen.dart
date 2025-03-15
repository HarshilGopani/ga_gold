import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ga_final/app/app.dart';
import 'package:ga_final/app/navigators/navigators.dart';
import 'package:ga_final/app/widgets/appbar_widgets.dart';
import 'package:ga_final/domain/models/models.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';

class SampleOrderHistoryScreen extends StatelessWidget {
  const SampleOrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RepairController>(initState: (state) {
      var controller = Get.find<RepairController>();
      controller.smaplePagingController.addPageRequestListener((pageKey) async {
        await controller.postSampleOrderHistory(pageKey);
      });
    }, builder: (controller) {
      return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: 'customize_order_history'.tr,
          ),
          body: PagedListView<int, SampleOrderHistoryDoc>(
            pagingController: controller.smaplePagingController,
            padding: Dimens.edgeInsetsTop10,
            builderDelegate: PagedChildBuilderDelegate<SampleOrderHistoryDoc>(
              noItemsFoundIndicatorBuilder: (context) {
                return Center(
                  child: Text(
                    "Customize Order history data empty.",
                    style: Styles.black50014,
                  ),
                );
              },
              itemBuilder: (context, item, index) {
                return Padding(
                  padding: Dimens.edgeInsets20_0_20_20.copyWith(bottom: 10),
                  child: InkWell(
                    onTap: () {
                      RouteManagement.goToSampleOrderDetailsScreen(
                          item.id ?? '');
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
                                    "Order Date: ${DateFormat('dd/MM/yyyy').format(item.createdAt ?? DateTime.now())}",
                                    //25/04/2024
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
                                    "Order No: ${item.orderTracking}",
                                    style: Styles.color64748W60012,
                                  ),
                                ],
                              )
                            ],
                          )),
                    ),
                  ),
                );
                return Padding(
                  padding: Dimens.edgeInsets20_00_20_00,
                  child: InkWell(
                    onTap: () {
                      RouteManagement.goToSampleOrderDetailsScreen(
                          item.id ?? '');
                    },
                    child: Container(
                      margin: Dimens.edgeInsetsBottom10,
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
                                          AssetConstants.usera,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                      errorWidget: (context, url, error) {
                                        return SvgPicture.asset(
                                          AssetConstants.usera,
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
                                item.orderTracking?.toCapitalized ?? '',
                                style: item.orderTracking == "pending"
                                    ? Styles.colorFFA50070012
                                    : item.orderTracking == "completed"
                                        ? Styles.greenW70012
                                        : Styles.redColorGuj70010,
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
          ));
    });
  }
}
