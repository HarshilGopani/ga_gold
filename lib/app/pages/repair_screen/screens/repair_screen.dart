import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../app.dart';

class RepairScreen extends StatelessWidget {
  const RepairScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RepairController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorsValue.whiteColor,
        appBar: AppbarWidgets(
          onTapBack: () {
            Get.back();
          },
          title: '',
          isVisible: false,
        ),
        body: Column(
          children: [
            Padding(
              padding: Dimens.edgeInsets30_00_30_00,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        controller.selectedValue = 0;
                        controller.update();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: Dimens.thirtyOne,
                        decoration: BoxDecoration(
                          color: controller.selectedValue == 0
                              ? ColorsValue.appColor
                              : ColorsValue.black343434.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(
                            Dimens.twentyFive,
                          ),
                        ),
                        child: Text(
                          'repair_order'.tr,
                          style: Styles.whiteW80014,
                        ),
                      ),
                    ),
                  ),
                  Dimens.boxWidth10,
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        controller.selectedValue = 1;
                        controller.update();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: Dimens.thirtyOne,
                        decoration: BoxDecoration(
                          color: controller.selectedValue == 1
                              ? ColorsValue.appColor
                              : ColorsValue.black343434.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(
                            Dimens.twentyFive,
                          ),
                        ),
                        child: Text(
                          'sample_order'.tr,
                          style: Styles.whiteW80014,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Dimens.boxHeight80,
            if (controller.selectedValue == 0) ...[
              InkWell(
                onTap: () {
                  controller.selectImage(context, false);
                },
                child: SizedBox(
                  height: 394,
                  width: 284,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(Dimens.twenty),
                    color: ColorsValue.appColor,
                    dashPattern: [8, 8],
                    strokeWidth: 2,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: SvgPicture.asset(
                              AssetConstants.ic_Profile,
                            ),
                          ),
                          Dimens.boxHeight20,
                          Text(
                            'add_photo'.tr,
                            style: Styles.color9C9C9C40016,
                          ),
                          Dimens.boxHeight5,
                          Text(
                            'max_10mb'.tr,
                            style: Styles.black626262W50012,
                          ),
                          Dimens.boxHeight20,
                          Text(
                            'image_extention'.tr,
                            style: Styles.color9C9C9C40010,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ] else ...[
              InkWell(
                onTap: () {
                  // controller.sampleOrderImage(context);
                },
                child: SizedBox(
                  height: 394,
                  width: 284,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(Dimens.twenty),
                    color: ColorsValue.appColor,
                    dashPattern: [8, 8],
                    strokeWidth: 2,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: SvgPicture.asset(
                              AssetConstants.ic_call,
                            ),
                          ),
                          Dimens.boxHeight20,
                          Text(
                            'add_photo'.tr,
                            style: Styles.color9C9C9C40016,
                          ),
                          Dimens.boxHeight5,
                          Text(
                            'max_10mb'.tr,
                            style: Styles.black626262W50012,
                          ),
                          Dimens.boxHeight20,
                          Text(
                            'image_extention'.tr,
                            style: Styles.color9C9C9C40010,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ]
          ],
        ),
      );
    });
  }
}
