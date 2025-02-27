import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app.dart';

class RepairOrderDetalisScreen extends StatelessWidget {
  const RepairOrderDetalisScreen({super.key});

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
            title: controller.getOneRepairOrderData?.orderNumber ?? "A1",
          ),
          body: Padding(
            padding: Dimens.edgeInsets20,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'uploaded_photo'.tr,
                    style: Styles.color21212170014,
                  ),
                  Dimens.boxHeight5,
                  InkWell(
                    onTap: () {
                      RouteManagement.goToShowFullScareenImage(
                          controller.getOneRepairOrderData?.file ?? '',
                          "Image");
                    },
                    child: Container(
                      height: Dimens.hundred,
                      width: Dimens.hundred,
                      decoration: BoxDecoration(
                        color: ColorsValue.appColor,
                        borderRadius: BorderRadius.circular(
                          Dimens.five,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          Dimens.five,
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              controller.getOneRepairOrderData?.file ?? '',
                          fit: BoxFit.cover,
                          maxWidthDiskCache: 300,
                          maxHeightDiskCache: 300,
                          height: Dimens.hundred,
                          width: Dimens.hundred,
                          placeholder: (context, url) {
                            return Image.asset(
                              AssetConstants.placeholder,
                              fit: BoxFit.cover,
                            );
                          },
                          errorWidget: (context, url, error) {
                            return Image.asset(
                              AssetConstants.placeholder,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Dimens.boxHeight20,
                  Text(
                    'description'.tr,
                    style: Styles.color21212170014,
                  ),
                  Dimens.boxHeight5,
                  Text(
                    controller.getOneRepairOrderData?.description ?? " -ß ",
                    style: Styles.colorA7A7A750012,
                  ),
                  Dimens.boxHeight20,
                  Text(
                    'date_order'.tr,
                    style: Styles.color21212170014,
                  ),
                  Dimens.boxHeight5,
                  Text(
                    "2/02/25",
                    // controller.getOneRepairOrderData?.createdAt?.dateFormate ??
                    //     '',
                    style: Styles.colorA7A7A750012,
                  ),
                  Dimens.boxHeight30,
                  Text(
                    'order_status'.tr,
                    style: Styles.color212121W70024,
                  ),
                  CustomStepper(
                    customStepper: getStepperType(
                        (controller.getOneRepairOrderData?.orderTracking ?? ""),
                        controller),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<CustomStepperView> getStepperType(
      String element, RepairController controller) {
    return element == 'pending'
        ? controller.pendingStepper
        : element == 'processing'
            ? controller.pendingStepper
            : element == "completed"
                ? controller.completStepper
                : element == "cancelled"
                    ? controller.cancelledStepper
                    : [];
  }
}
