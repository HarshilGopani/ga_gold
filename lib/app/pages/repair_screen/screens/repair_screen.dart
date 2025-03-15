import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ga_final/app/app.dart';
import 'package:ga_final/app/widgets/appbar_widgets.dart';
import 'package:get/get.dart';

class RepairScreen extends StatelessWidget {
  const RepairScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RepairController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorsValue.whiteColor,
        appBar: AppBarWidget(
          onTapBack: () {
            Get.back();
          },
          isBottomVisible: false  ,
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
                    child: GestureDetector(
                      onTap: () {
                        controller.selectedValue = 0;
                        controller.update();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: Dimens.fourty,
                        decoration: BoxDecoration(
                          color: controller.selectedValue == 0
                              ? ColorsValue.lightYellow
                              : ColorsValue.lightE2E8F0,
                          borderRadius: BorderRadius.circular(
                            Dimens.twentyFive,
                          ),
                        ),
                        child: Text(
                          'repair_order'.tr,
                          style: controller.selectedValue == 0
                              ? Styles.whiteW80014
                              : Styles.color47556980014,
                        ),
                      ),
                    ),
                  ),
                  Dimens.boxWidth10,
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.selectedValue = 1;
                        controller.update();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: Dimens.fourty,
                        decoration: BoxDecoration(
                          color: controller.selectedValue == 1
                              ? ColorsValue.lightYellow
                              : ColorsValue.lightE2E8F0,
                          borderRadius: BorderRadius.circular(
                            Dimens.twentyFive,
                          ),
                        ),
                        child: Text(
                          'sample_order'.tr,
                          style: controller.selectedValue == 1
                              ? Styles.whiteW80014
                              : Styles.color47556980014,
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
                    color: ColorsValue.lightYellow,
                    dashPattern: [8, 8],
                    strokeWidth: 2,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: SvgPicture.asset(
                              AssetConstants.ic_upload_img,
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
                  controller.sampleOrderImage(context);
                },
                child: SizedBox(
                  height: 394,
                  width: 284,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(Dimens.twenty),
                    color: ColorsValue.lightYellow,
                    dashPattern: [8, 8],
                    strokeWidth: 2,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: SvgPicture.asset(
                              AssetConstants.ic_upload_img,
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
