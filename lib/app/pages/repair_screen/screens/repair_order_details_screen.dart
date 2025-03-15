import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:ga_final/app/app.dart';
import 'package:ga_final/app/navigators/navigators.dart';
import 'package:ga_final/app/widgets/appbar_widgets.dart';
import 'package:ga_final/app/widgets/custom_stepper.dart';

class RepairOrderDetalisScreen extends StatelessWidget {
  const RepairOrderDetalisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RepairController>(
      initState: (state) {
        var controller = Get.find<RepairController>();
        controller.getOneRepairOrder(repairingOrderId: Get.arguments);
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          appBar: AppBarWidget(
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
                      height: Dimens.hundredFifty,
                      width: Dimens.hundredFifty,
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
                          height: Dimens.hundredFifty,
                          width: Dimens.hundredFifty,
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
                  // Text(
                  //   'description'.tr,
                  //   style: Styles.color21212170014,
                  // ),
                  // Dimens.boxHeight5,
                  // Text(
                  //   controller.getOneRepairOrderData?.description ?? " -ß ",
                  //   style: Styles.colorA7A7A750012,
                  // ),
                  // Dimens.boxHeight20,
                  // Text(
                  //   'date_order'.tr,
                  //   style: Styles.color21212170014,
                  // ),
                  // Dimens.boxHeight5,
                  // Text(
                  //   controller.getOneRepairOrderData?.createdAt?.dateFormate ??
                  //       '',
                  //   style: Styles.colorA7A7A750012,
                  // ),
                  // Dimens.boxHeight30,
                  // Text(
                  //   'order_status'.tr,
                  //   style: Styles.color212121W70024,
                  // ),
                  // CustomStepper(
                  //   customStepper: getStepperType(
                  //       (controller.getOneRepairOrderData?.orderTracking ?? ""),
                  //       controller),
                  // ),
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: ColorsValue.colorF8FAFC,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: Dimens.edgeInsets10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Product Name:",
                                  style: Styles.color47556960014),
                              Text(
                                  controller
                                          .getOneRepairOrderData?.productname ??
                                      '',
                                  style: Styles.color47556960012),
                            ],
                          ),
                          Dimens.boxHeight4,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Gold puirty:",
                                  style: Styles.color47556960014),
                              Text(
                                  controller.getOneRepairOrderData?.priority ??
                                      '',
                                  style: Styles.color47556960012),
                            ],
                          ),
                          Dimens.boxHeight4,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Size:", style: Styles.color47556960014),
                              Text(controller.getOneRepairOrderData?.size ?? '',
                                  style: Styles.color47556960012),
                            ],
                          ),
                          Dimens.boxHeight4,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Weight:", style: Styles.color47556960014),
                              Text(
                                  controller.getOneRepairOrderData?.weight ??
                                      '',
                                  style: Styles.color47556960012),
                            ],
                          ),
                          Dimens.boxHeight4,
                          Text(controller.getOneRepairOrderData?.description ??
                              '',
                              style: Styles.color47556960012)
                        ],
                      ),
                    ),
                  )
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
