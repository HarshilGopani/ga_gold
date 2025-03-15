import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ga_final/app/app.dart';
import 'package:ga_final/app/navigators/navigators.dart';
import 'package:ga_final/app/widgets/appbar_widgets.dart';

class BagDetailScreen extends StatelessWidget {
  const BagDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      initState: (state) {
        var controller = Get.find<OrderController>();
        controller.getOneBagData = null;
        controller.bugId = Get.arguments ?? "";
        controller.getOneBagData = null;
        controller.postGetOnebag();
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: 'Bag ${controller.getOneBagData?.bagNumber}'.tr,
          ),
          body: controller.getOneBagData != null
              ? Wrap(
                  children: controller.getOneBagData?.products?.map(
                        (e) {
                          return Padding(
                            padding: Dimens.edgeInsets20_10_20_10,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Dimens.five,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          RouteManagement
                                              .goToShowFullScareenImage(
                                                  e.image ?? '', "Image");
                                        },
                                        child: Container(
                                          height: Dimens.eighty,
                                          width: Dimens.eighty,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              Dimens.five,
                                            ),
                                            color: ColorsValue.whiteColor,
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              Dimens.five,
                                            ),
                                            child: CachedNetworkImage(
                                              imageUrl: e.image ?? '',
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) {
                                                return Image.asset(
                                                    AssetConstants.placeholder,
                                                    fit: BoxFit.cover);
                                              },
                                              errorWidget:
                                                  (context, url, error) {
                                                return Image.asset(
                                                    AssetConstants.placeholder,
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
                                              e.name ?? '',
                                              style: Styles.color21212170014,
                                            ),
                                            Dimens.boxHeight5,
                                            Text(
                                              controller.getOneBagData
                                                      ?.bagDescription ??
                                                  ' - ',
                                              style: Styles.colorA7A7A750012,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Dimens.boxHeight10,
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'ring_total_quantity'.tr,
                                              style: Styles.colorA7A7A770012,
                                            ),
                                            Dimens.boxHeight10,
                                            Container(
                                              width: double.infinity,
                                              padding: Dimens.edgeInsets12,
                                              decoration: BoxDecoration(
                                                color: ColorsValue.black333,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  Dimens.six,
                                                ),
                                              ),
                                              child: Text(
                                                controller.getOneBagData
                                                        ?.totalQuantityInBag
                                                        .toString() ??
                                                    ' - ',
                                                style: Styles.whiteW60012,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Dimens.boxWidth10,
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'ring_total_quantity'.tr,
                                              style: Styles.colorA7A7A770012,
                                            ),
                                            Dimens.boxHeight10,
                                            Container(
                                              width: double.infinity,
                                              padding: Dimens.edgeInsets12,
                                              decoration: BoxDecoration(
                                                color: ColorsValue.black333,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  Dimens.six,
                                                ),
                                              ),
                                              child: Text(
                                                e.bagQuantity.toString(),
                                                style: Styles.whiteW60012,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Dimens.boxHeight20,
                                  Divider(
                                    height: Dimens.one,
                                    color: ColorsValue.colorD9D9D9,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ).toList() ??
                      [],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
