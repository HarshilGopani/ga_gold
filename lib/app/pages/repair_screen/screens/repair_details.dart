import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:Ga_Gold/app/app.dart';
import 'package:Ga_Gold/app/widgets/appbar_widgets.dart';

class RepairDetailsScreen extends StatelessWidget {
  const RepairDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RepairController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorsValue.whiteColor,
        appBar: AppBarWidget(
          onTapBack: () {
            Get.back();
          },
          title: 'repair_order'.tr,
        ),
        bottomNavigationBar: Padding(
          padding: Dimens.edgeInsets15_20_15_30,
          child: Row(
            children: [
              Expanded(
                  child: InkWell(
                onTap: () {
                  controller.profileImage = "";
                  Utility.closeLoader();
                  Get.back();

                },
                child: Container(
                  height: Dimens.fourtyFive,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Dimens.twelve,
                    ),
                    color: Colors.white,
                    border: Border.all(
                      width: Dimens.one,
                      color: ColorsValue.colorA7A7A7,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'cancle'.tr,
                      style: Styles.colorA7A7A780014,
                    ),
                  ),
                ),
              )),
              Dimens.boxWidth10,
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.desKey.currentState!.validate()) {
                      Utility.showLoader();
                      controller.postRepairOrder();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      double.maxFinite,
                      Dimens.fourtyFive,
                    ),
                    backgroundColor: ColorsValue.lightYellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        Dimens.twelve,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'repair_order'.tr,
                      style: Styles.whiteW70016,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Form(
          key: controller.desKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Padding(
              padding: Dimens.edgeInsets20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: Dimens.hundred,
                        width: Dimens.hundred,
                        decoration: BoxDecoration(
                          color: ColorsValue.appColor,
                          borderRadius: BorderRadius.circular(
                            Dimens.five,
                          ),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                Dimens.five,
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                    controller.reapirUploadData?.path ?? '',
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
                            InkWell(
                              onTap: () {
                                controller.profileImage = "";
                                controller.update();
                                Get.back();
                              },
                              child: Padding(
                                padding: Dimens.edgeInsets5,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    padding: Dimens.edgeInsets3,
                                    height: Dimens.twentyFour,
                                    width: Dimens.twentyFour,
                                    decoration: BoxDecoration(
                                      color: ColorsValue.whiteColor,
                                      borderRadius: BorderRadius.circular(
                                        Dimens.five,
                                      ),
                                    ),
                                    child: SvgPicture.asset(
                                      AssetConstants.ic_delete,
                                      colorFilter: const ColorFilter.mode(
                                        ColorsValue.appColor,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Dimens.boxHeight30,
                  // Text(
                  //   'description_star'.tr,
                  //   style: Styles.color21212160012,
                  // ),
                  // Dimens.boxHeight5,
                  // Container(
                  //   child: TextFormField(
                  //     // style: Styles.whiteW60016,
                  //     controller: controller.descriptionController,
                  //     maxLines: 3,
                  //     autovalidateMode: AutovalidateMode.onUserInteraction,
                  //     validator: (value) {
                  //       if (value!.isEmpty) {
                  //         return 'enter_des'.tr;
                  //       }
                  //       return null;
                  //     },
                  //     decoration: InputDecoration(
                  //       counterText: '',
                  //       contentPadding: Dimens.edgeInsets10,
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(50),
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(
                  //             width: Dimens.zero, style: BorderStyle.none),
                  //         borderRadius: BorderRadius.circular(Dimens.five),
                  //       ),
                  //       disabledBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(
                  //             width: Dimens.zero, style: BorderStyle.none),
                  //         borderRadius: BorderRadius.circular(Dimens.five),
                  //       ),
                  //       enabledBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(
                  //             width: Dimens.zero, style: BorderStyle.none),
                  //         borderRadius: BorderRadius.circular(Dimens.five),
                  //       ),
                  //       focusedErrorBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(
                  //             width: Dimens.zero, style: BorderStyle.none),
                  //         borderRadius: BorderRadius.circular(Dimens.five),
                  //       ),
                  //       errorBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(
                  //             width: Dimens.zero, style: BorderStyle.none),
                  //         borderRadius: BorderRadius.circular(Dimens.five),
                  //       ),
                  //       filled: true,
                  //       fillColor: ColorsValue.colorEEEAEA,
                  //     ),
                  //   ),
                  // ),
                  Dimens.boxHeight10,
                  CustomTextFormField(
                    text: 'Product Name',
                    hintText: "Ring",
                    controller: controller.productNameController,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter product name';
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight10,
                  CustomTextFormField(
                    text: 'Gold Puirty',
                    hintText: "18kt Rose",
                    controller: controller.tc_goldPuirty,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter gold puirty';
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight10,
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          text: 'Size',
                          hintText: "02",
                          keyboardType: TextInputType.number,
                          controller: controller.tc_size,
                          validation: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter size';
                            }
                            return null;
                          },
                        ),
                      ),
                      Dimens.boxWidth10,
                      Expanded(
                        child: CustomTextFormField(
                          text: 'Weight',
                          hintText: "10gm",
                          controller: controller.tc_weight,
                          validation: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter weight';
                            }
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                  Dimens.boxHeight10,
                  CustomTextFormField(
                    text: 'Add Remark',
                    hintText: "Emilia Clarke",
                    controller: controller.descriptionController,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter add remark';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
