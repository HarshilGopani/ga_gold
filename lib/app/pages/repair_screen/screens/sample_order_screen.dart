import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ga_final/app/app.dart';
import 'package:ga_final/app/widgets/appbar_widgets.dart';
import 'package:get/get.dart';

class SampleOrderScreen extends StatelessWidget {
  const SampleOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RepairController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorsValue.whiteColor,
        appBar: AppBarWidget(
          onTapBack: () {
            Get.back();
          },
          title: 'sample_order'.tr,
        ),
        bottomNavigationBar: Padding(
          padding: Dimens.edgeInsets15_20_15_30,
          child: Row(
            children: [
              Expanded(
                  child: InkWell(
                onTap: () {
                  controller.profileImage = "";
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
                    if (controller.sampleKey.currentState!.validate()) {
                      controller.postSampleOrder();
                      Utility.showLoader();
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
                      'sample_order'.tr,
                      style: Styles.whiteW70016,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: controller.sampleKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: Dimens.edgeInsets20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () async {
                          var data = await Utility.imagePermissionCheack(context);
                          if (data) {
                            controller.sampleOrderImage(context);
                          }
                        },
                        child: Container(
                          width: Dimens.eighty,
                          height: Dimens.eighty,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Dimens.six,
                            ),
                            color: ColorsValue.colorEEEAEA,
                          ),
                          alignment: Alignment.center,
                          child: DottedBorder(
                            color: ColorsValue.greyColor,
                            radius: Radius.circular(Dimens.five),
                            borderType: BorderType.RRect,
                            strokeWidth: Dimens.two,
                            dashPattern: [Dimens.two],
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image,
                                  color: ColorsValue.lightYellow,
                                ),
                                Dimens.boxHeight5,
                                Center(
                                  child: Text(
                                    "Upload\nImage",
                                    style: Styles.lightYello70012,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Dimens.boxWidth10,
                      if (controller.imageList.isNotEmpty) ...[
                        Expanded(
                          child: SizedBox(
                            width: Dimens.eighty,
                            height: Dimens.eighty,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.imageList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: Dimens.edgeInsetsRight10,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          Dimens.six,
                                        ),
                                        child: CachedNetworkImage(
                                          width: Dimens.eighty,
                                          height: Dimens.eighty,
                                          imageUrl:
                                              controller.imageList[index].path ??
                                                  "",
                                          fit: BoxFit.cover,
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
                                      Positioned(
                                        right: 0,
                                        child: Padding(
                                          padding: Dimens.edgeInsets8,
                                          child: InkWell(
                                            onTap: () {
                                              controller.imageList
                                                  .removeAt(index);
                                              controller.update();
                                            },
                                            child: Container(
                                              padding: Dimens.edgeInsets3,
                                              height: Dimens.twenty,
                                              width: Dimens.twenty,
                                              decoration: BoxDecoration(
                                                color: ColorsValue.whiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  Dimens.hundred,
                                                ),
                                              ),
                                              child: SvgPicture.asset(
                                                AssetConstants.ic_delete,
                                                colorFilter: ColorFilter.mode(
                                                  ColorsValue.redColor,
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  Dimens.boxHeight30,
                  Text(
                    'product_quantity'.tr,
                    style: Styles.color21212160012,
                  ),
                  Dimens.boxHeight10,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          if (controller.selectQuantity > 1) {
                            controller.selectQuantity--;
                            controller.update();
                          }
                        },
                        child: SvgPicture.asset(
                          AssetConstants.ic_minus_icon,
                          height: Dimens.twentyFour,
                          width: Dimens.twentyFour,
                        ),
                      ),
                      Dimens.boxWidth10,
                      Text(
                        controller.selectQuantity.toString(),
                        style: Styles.appColor70014,
                      ),
                      Dimens.boxWidth10,
                      InkWell(
                        onTap: () {
                          controller.selectQuantity++;
                          controller.update();
                        },
                        child: SvgPicture.asset(
                          AssetConstants.ic_plus_icon,
                          height: Dimens.twentyFour,
                          width: Dimens.twentyFour,
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
                  //     controller: controller.descriptionSampleController,
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
                    controller: controller.sampleproductNameController,
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
                    controller: controller.sampletc_goldPuirty,
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
                          controller: controller.sampletc_size,
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
                          controller: controller.sampletc_weight,
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
                    controller: controller.descriptionSampleController,
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
