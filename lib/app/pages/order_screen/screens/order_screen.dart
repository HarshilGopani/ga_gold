import 'package:flutter/material.dart';
import 'package:ga_gold/app/app.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      initState: (state) {},
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          appBar: AppbarWidgets(
            onTapBack: () {
              Get.back();
            },
            title: 'order_history'.tr,
            isCenter: true,
          ),
          body: !controller.isLoading
              ? controller.orderListModel.isNotEmpty
                  ? SingleChildScrollView(
                      physics: ClampingScrollPhysics(),
                      child: Wrap(
                        children: controller.orderListModel.map(
                          (e) {
                            return Padding(
                              padding: Dimens.edgeInsets20.copyWith(bottom: 10),
                              child: GestureDetector(
                                onTap: () {
                                  RouteManagement.goToOrderDetailScreen();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorsValue.colorDFDFDF,
                                    borderRadius: BorderRadius.circular(
                                      Dimens.ten,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: Dimens.edgeInsets10,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // InkWell(
                                        //   onTap: () {
                                        //     RouteManagement
                                        //         .goToShowFullScareenImage(
                                        //             e.productImage ?? '',
                                        //             "Image");
                                        //   },
                                        //   child: Container(
                                        //     height: Dimens.eighty,
                                        //     width: Dimens.eighty,
                                        //     decoration: BoxDecoration(
                                        //       borderRadius: BorderRadius.circular(
                                        //         Dimens.five,
                                        //       ),
                                        //       color: ColorsValue.whiteColor,
                                        //     ),
                                        //     child: ClipRRect(
                                        //       borderRadius: BorderRadius.circular(
                                        //         Dimens.five,
                                        //       ),
                                        //       child: CachedNetworkImage(
                                        //         imageUrl: e.productImage ?? "",
                                        //         fit: BoxFit.cover,
                                        //         height: Dimens.eighty,
                                        //         width: Dimens.eighty,
                                        //         placeholder: (context, url) {
                                        //           return Image.asset(
                                        //               AssetConstants.placeholder,
                                        //               fit: BoxFit.cover);
                                        //         },
                                        //         errorWidget:
                                        //             (context, url, error) {
                                        //           return Image.asset(
                                        //               AssetConstants.placeholder,
                                        //               fit: BoxFit.cover);
                                        //         },
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    "${"total_quentity".tr} ${e.quantity}",
                                                    style: Styles
                                                        .color212121W90012,
                                                  ),
                                                  Dimens.boxHeight5,
                                                  Text(
                                                    "total Weight: ${e.quantity}",
                                                    style: Styles
                                                        .color212121W90012,
                                                  ),
                                                  Dimens.boxHeight5,
                                                  Text(
                                                    "Order Date: ${e.quantity}",
                                                    style: Styles
                                                        .color212121W90012,
                                                  ),
                                                  Dimens.boxHeight5,
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text("Pending"),
                                                  Text("Order No:01"),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    )
                  : const Center(
                      child: Text("No Data Found"),
                    )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
