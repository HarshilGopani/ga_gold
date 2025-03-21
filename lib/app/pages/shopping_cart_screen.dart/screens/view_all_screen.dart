import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Ga_Gold/app/app.dart';
import 'package:Ga_Gold/app/navigators/navigators.dart';
import 'package:Ga_Gold/app/widgets/appbar_widgets.dart';
import 'package:Ga_Gold/app/widgets/custom_button.dart';
import 'package:Ga_Gold/app/widgets/custom_order_dilog.dart';
import 'package:get/get.dart';

class ViewAllProductScreen extends StatelessWidget {
  const ViewAllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppingCartController>(
      initState: (state) async {
        var controller = Get.find<ShoppingCartController>();
        controller.productTypeViewAll = Get.arguments[0];
        controller.category = Get.arguments[1];
        controller.categoryName = Get.arguments[2];
        controller.isViewAllLoading = true;
        controller.postArrivalViewAll(1, controller.productTypeViewAll);
        controller.scrollViewAllController.addListener(() async {
          if (controller.scrollViewAllController.position.pixels ==
              controller.scrollViewAllController.position.maxScrollExtent) {
            if (controller.isViewAllLoading == false) {
              controller.isViewAllLoading = true;
              controller.update();
              if (controller.isViewAllLastPage == false) {
                await controller.postArrivalViewAll(
                    controller.pageViewAllCount, controller.productTypeViewAll);
              }
              controller.isViewAllLoading = false;
              controller.update();
            }
          }
        });
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: controller.category.isNotEmpty
                ? controller.categoryName
                : controller.productTypeViewAll,
            isVisible: true,
          ),
          body: Padding(
            padding: Dimens.edgeInsets20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(Dimens.twenty),
                                      topLeft: Radius.circular(Dimens.twenty),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: Dimens.edgeInsets20_20_20_0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'sort_by'.tr,
                                              style: Styles.txtBlackColorW70018,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Get.back();
                                              },
                                              child: SvgPicture.asset(
                                                AssetConstants.ic_close,
                                                height: Dimens.twentyFour,
                                                width: Dimens.twentyFour,
                                                colorFilter:
                                                    const ColorFilter.mode(
                                                  ColorsValue.blackColor,
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Dimens.boxHeight12,
                                      Divider(
                                        height: Dimens.one,
                                        color: ColorsValue.lightCBD5E1,
                                      ),
                                      Dimens.boxHeight12,
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: Dimens.twenty,
                                          right: Dimens.twenty,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RadioListTile<int>(
                                              dense: false,
                                              visualDensity:
                                                  const VisualDensity(
                                                      horizontal: VisualDensity
                                                          .minimumDensity,
                                                      vertical: VisualDensity
                                                          .minimumDensity),
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                              contentPadding: EdgeInsets.zero,
                                              activeColor:
                                                  ColorsValue.txtBlackColor,
                                              title: Text(
                                                "Weight High to Low",
                                                style:
                                                    Styles.txtBlackColorW60014,
                                              ),
                                              value: 0,
                                              groupValue: controller.radioValue,
                                              onChanged: (value) {
                                                setState(
                                                  () {
                                                    controller.radioValue =
                                                        value!;
                                                    controller.radioSortValue =
                                                        -1;
                                                  },
                                                );
                                              },
                                            ),
                                            RadioListTile<int>(
                                              visualDensity:
                                                  const VisualDensity(
                                                      horizontal: VisualDensity
                                                          .minimumDensity,
                                                      vertical: VisualDensity
                                                          .minimumDensity),
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                              contentPadding: EdgeInsets.zero,
                                              activeColor:
                                                  ColorsValue.txtBlackColor,
                                              title: Text(
                                                'Weight Low to High'.tr,
                                                style:
                                                    Styles.txtBlackColorW60014,
                                              ),
                                              value: 1,
                                              groupValue: controller.radioValue,
                                              onChanged: (int? value) {
                                                setState(
                                                  () {
                                                    controller.radioValue =
                                                        value!;
                                                    controller.radioSortValue =
                                                        1;
                                                  },
                                                );
                                              },
                                            ),
                                            Dimens.boxHeight20,
                                            CustomButton(
                                              height: Dimens.fourtyFive,
                                              onTap: () async {
                                                Get.back();
                                                controller.postArrivalViewAll(
                                                    1,
                                                    controller
                                                        .productTypeViewAll);
                                                controller.update();
                                              },
                                              text: 'Apply'.tr,
                                              style: Styles.whiteColorW80016,
                                              backgroundColor:
                                                  ColorsValue.appColor,
                                            ),
                                            Dimens.boxHeight20,
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: Dimens.edgeInsets14_0_14_0,
                        height: Dimens.thirty,
                        alignment: AlignmentDirectional.centerStart,
                        decoration: BoxDecoration(
                          color: ColorsValue.lightE2E8F0,
                          borderRadius: BorderRadius.circular(
                            Dimens.ten,
                          ),
                          border: Border.all(
                            width: Dimens.one,
                            color: ColorsValue.black64748B,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'sort_by'.tr,
                              style: Styles.txtBlackColorW60014,
                            ),
                            Dimens.boxWidth10,
                            SvgPicture.asset(
                              AssetConstants.ic_down_arrow,
                            )
                          ],
                        ),
                      ),
                    ),
                    Dimens.boxWidth12,
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => StatefulBuilder(
                            builder: (context, setState) => Container(
                              height: Get.height * 0.78,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(Dimens.twenty),
                                  topRight: Radius.circular(Dimens.twenty),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: Dimens.edgeInsets20_20_20_0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Filter'.tr,
                                          style: Styles.txtBlackColorW70018,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: SvgPicture.asset(
                                            AssetConstants.ic_close,
                                            height: Dimens.twentyFour,
                                            width: Dimens.twentyFour,
                                            colorFilter: const ColorFilter.mode(
                                              ColorsValue.txtBlackColor,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Dimens.boxHeight12,
                                  Divider(
                                    height: Dimens.one,
                                    color: ColorsValue.lightCBD5E1,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 6,
                                            child: Container(
                                              padding: Dimens.edgeInsetsTop10,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.60,
                                              decoration: BoxDecoration(
                                                color: ColorsValue.lightF3F4F6,
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(
                                                      Dimens.six),
                                                  bottomRight: Radius.circular(
                                                      Dimens.six),
                                                ),
                                              ),
                                              child: Wrap(
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                children: controller.filterType
                                                    .asMap()
                                                    .entries
                                                    .map((e) {
                                                  var index = e.key;
                                                  return InkWell(
                                                    onTap: () {
                                                      controller.filterStock =
                                                          index;
                                                      setState(() {});
                                                    },
                                                    child: Padding(
                                                      padding: Dimens
                                                          .edgeInsetsBottom10,
                                                      child: Container(
                                                        padding: Dimens
                                                            .edgeInsetsLeft20,
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        height:
                                                            Dimens.thirtySix,
                                                        width: double.maxFinite,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: controller
                                                                      .filterStock ==
                                                                  index
                                                              ? ColorsValue
                                                                  .whiteColor
                                                              : Colors
                                                                  .transparent,
                                                        ),
                                                        child: Text(
                                                          controller.filterType[
                                                              index],
                                                          style: Styles
                                                              .txtBlackColorW60016,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 8,
                                            child: ListView.builder(
                                              itemCount: 1,
                                              shrinkWrap: true,
                                              padding: Dimens.edgeInsets0,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                switch (
                                                    controller.filterStock) {
                                                  case 0:
                                                    return Padding(
                                                      padding:
                                                          Dimens.edgeInsets16,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Weight Range',
                                                            style: Styles
                                                                .txtBlackColorW60014,
                                                          ),
                                                          Dimens.boxHeight10,
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    CustomTextFormField(
                                                                  controller:
                                                                      controller
                                                                          .minWeightController,
                                                                  isShowText:
                                                                      false,
                                                                  hintText:
                                                                      'Min Weight',
                                                                  hintTextStyle:
                                                                      Styles
                                                                          .color94A3B8W40010,
                                                                  text: '',
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                              Dimens.boxWidth10,
                                                              Expanded(
                                                                child:
                                                                    CustomTextFormField(
                                                                  controller:
                                                                      controller
                                                                          .maxWeightController,
                                                                  isShowText:
                                                                      false,
                                                                  hintText:
                                                                      'Max Weight',
                                                                  hintTextStyle:
                                                                      Styles
                                                                          .color94A3B8W40010,
                                                                  text: '',
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          Dimens.boxHeight12,
                                                          Text(
                                                            "${controller.startValue.toStringAsFixed(0)}gm   -   ${controller.endValue.toStringAsFixed(0)}gm",
                                                            style: Styles
                                                                .txtBlackColorW50014,
                                                          ),
                                                          Dimens.boxHeight10,
                                                          RangeSlider(
                                                            min: controller
                                                                .minValue,
                                                            max: controller
                                                                .maxValue,
                                                            activeColor:
                                                                ColorsValue
                                                                    .appColor,
                                                            inactiveColor:
                                                                ColorsValue
                                                                    .lightE2E8F0,
                                                            values: RangeValues(
                                                              controller
                                                                  .startValue,
                                                              controller
                                                                  .endValue,
                                                            ),
                                                            onChanged:
                                                                (newValues) {
                                                              controller
                                                                      .startValue =
                                                                  newValues
                                                                      .start;
                                                              controller
                                                                      .endValue =
                                                                  newValues.end;
                                                              controller
                                                                  .update();
                                                              setState(() {});
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  case 1:
                                                    return Padding(
                                                      padding:
                                                          Dimens.edgeInsets16,
                                                      child: Column(
                                                        children: [
                                                          RadioListTile<int>(
                                                            dense: false,
                                                            visualDensity: const VisualDensity(
                                                                horizontal:
                                                                    VisualDensity
                                                                        .minimumDensity,
                                                                vertical:
                                                                    VisualDensity
                                                                        .minimumDensity),
                                                            controlAffinity:
                                                                ListTileControlAffinity
                                                                    .trailing,
                                                            contentPadding:
                                                                EdgeInsets.zero,
                                                            activeColor:
                                                                ColorsValue
                                                                    .txtBlackColor,
                                                            title: Text(
                                                              "In Stock",
                                                              style: Styles
                                                                  .txtBlackColorW60014,
                                                            ),
                                                            value: 0,
                                                            groupValue:
                                                                controller
                                                                    .radioValue,
                                                            onChanged: (value) {
                                                              setState(
                                                                () {
                                                                  controller
                                                                          .radioValue =
                                                                      value!;
                                                                  controller
                                                                      .radioSortValue = -1;
                                                                },
                                                              );
                                                            },
                                                          ),
                                                          RadioListTile<int>(
                                                            visualDensity: const VisualDensity(
                                                                horizontal:
                                                                    VisualDensity
                                                                        .minimumDensity,
                                                                vertical:
                                                                    VisualDensity
                                                                        .minimumDensity),
                                                            controlAffinity:
                                                                ListTileControlAffinity
                                                                    .trailing,
                                                            contentPadding:
                                                                EdgeInsets.zero,
                                                            activeColor:
                                                                ColorsValue
                                                                    .txtBlackColor,
                                                            title: Text(
                                                              'Out Of Stock'.tr,
                                                              style: Styles
                                                                  .txtBlackColorW60014,
                                                            ),
                                                            value: 1,
                                                            groupValue:
                                                                controller
                                                                    .radioValue,
                                                            onChanged:
                                                                (int? value) {
                                                              setState(
                                                                () {
                                                                  controller
                                                                          .radioValue =
                                                                      value!;
                                                                  controller
                                                                      .radioSortValue = 1;
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Divider(
                                        height: 1,
                                        color: ColorsValue.greyAAA,
                                      ),
                                      Dimens.boxHeight10,
                                      Padding(
                                        padding: Dimens.edgeInsets20_0_20_0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                onTap: () async {
                                                  Get.back();

                                                  controller.minValue = 0;
                                                  controller.maxValue = 1000;
                                                  controller.startValue = 0;
                                                  controller.endValue = 1000;
                                                  controller.minWeightController
                                                      .clear();
                                                  controller.maxWeightController
                                                      .clear();
                                                  controller.isFilter = false;
                                                  controller.update();
                                                  controller.postArrivalViewAll(
                                                      1,
                                                      controller
                                                          .productTypeViewAll);
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: Dimens.fifty,
                                                  width: double.maxFinite,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        ColorsValue.whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      Dimens.ten,
                                                    ),
                                                    border: Border.all(
                                                      color:
                                                          ColorsValue.appColor,
                                                      width: Dimens.one,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Clear Filters'.tr,
                                                    style:
                                                        Styles.appColorW50012,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Dimens.boxWidth23,
                                            Expanded(
                                              child: InkWell(
                                                onTap: () async {
                                                  Get.back();
                                                  controller.isFilter = true;
                                                  controller.postArrivalViewAll(
                                                      1,
                                                      controller
                                                          .productTypeViewAll);
                                                  controller.update();
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: Dimens.fifty,
                                                  width: double.maxFinite,
                                                  decoration: BoxDecoration(
                                                    color: ColorsValue.appColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      Dimens.ten,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Apply'.tr,
                                                    style:
                                                        Styles.whiteColorW60012,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: Dimens.edgeInsets14_0_14_0,
                        height: Dimens.thirty,
                        alignment: AlignmentDirectional.centerStart,
                        decoration: BoxDecoration(
                          color: controller.isFilter
                              ? ColorsValue.lightE2E8F0
                              : ColorsValue.whiteColor,
                          borderRadius: BorderRadius.circular(
                            Dimens.ten,
                          ),
                          border: Border.all(
                            width: Dimens.one,
                            color: ColorsValue.black64748B,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Filter'.tr,
                              style: Styles.txtBlackColorW60014,
                            ),
                            Dimens.boxWidth10,
                            SvgPicture.asset(
                              AssetConstants.ic_filter,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Dimens.boxHeight20,
                Expanded(
                  child: !controller.isViewAllLoading
                      ? controller.viewAllDocList.isNotEmpty
                          ? RefreshIndicator(
                              onRefresh: () => Future.sync(
                                () async {
                                  controller.isViewAllLoading = true;
                                  controller.update();
                                  await controller.postArrivalViewAll(
                                      1, controller.productTypeViewAll);
                                },
                              ),
                              child: GridView.builder(
                                controller: controller.scrollViewAllController,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: Dimens.fifteen,
                                  crossAxisSpacing: Dimens.ten,
                                        mainAxisExtent: Dimens.threeHundredThirty
                                ),
                                itemCount: controller.viewAllDocList.length,
                                itemBuilder: (context, index) {
                                  var item = controller.viewAllDocList[index];
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        Dimens.ten,
                                      ),
                                      color: ColorsValue.textfildBorder,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        Dimens.ten,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    RouteManagement
                                                        .goToShowFullScareenImage(
                                                            item.image ?? "",
                                                            "image");
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                          Dimens.ten),
                                                      topRight: Radius.circular(
                                                          Dimens.ten),
                                                    ),
                                                    child: CachedNetworkImage(
                                                      imageUrl:
                                                          item.image ?? "",
                                                      fit: BoxFit.cover,
                                                      height:
                                                          Dimens.hundredSixty,
                                                      width: double.maxFinite,
                                                      placeholder:
                                                          (context, url) =>
                                                              Image.asset(
                                                        AssetConstants
                                                            .placeholder,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Image.asset(
                                                        AssetConstants
                                                            .placeholder,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: Dimens.edgeInsets14,
                                                child: Align(
                                                  alignment: Alignment.topRight,
                                                  child: Container(
                                                    height: Dimens.thirty,
                                                    width: Dimens.thirty,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        Dimens.fifty,
                                                      ),
                                                      color: ColorsValue
                                                          .whiteColor,
                                                      border: Border.all(
                                                        width: Dimens.one,
                                                        color: ColorsValue
                                                            .lightPrimaryColor,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: InkWell(
                                                        onTap: () {
                                                          controller
                                                              .postWishlistAddRemove(
                                                                  item.id ?? "",
                                                                  index,
                                                                  false);
                                                        },
                                                        child: SvgPicture.asset(
                                                          item.wishlistStatus ??
                                                                  false
                                                              ? AssetConstants
                                                                  .ic_fill_like
                                                              : AssetConstants
                                                                  .ic_like,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          // Dimens.boxHeight10,
                                          Padding(
                                            padding:
                                                Dimens.edgeInsets10_10_10_0,
                                            child: Text(
                                              item.name ?? "Ring 01",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              style: Styles.blackW60014,
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding: Dimens
                                                        .edgeInsets10_0_10_0,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Weigth",
                                                              style: Styles
                                                                  .blackW60014,
                                                            ),
                                                            Text(
                                                              "${item.weight} gm",
                                                              style: Styles
                                                                  .black60012,
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {},
                                                              // onTap:
                                                              // item.inCart ?? false
                                                              //     ? null
                                                              //     : () {
                                                              //   if (controller
                                                              //       .getAllProductDocList[
                                                              //   index]
                                                              //       .cartquantity
                                                              //       .toDouble() >
                                                              //       0) {
                                                              //     controller
                                                              //         .getAllProductDocList[
                                                              //     index]
                                                              //         .cartquantity--;
                                                              //   }
                                                              //   controller
                                                              //       .update();
                                                              // },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    Dimens.ten,
                                                                  ),
                                                                  color: ColorsValue
                                                                      .colorDFDFDF,
                                                                ),
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  AssetConstants
                                                                      .ic_minus_icon,
                                                                  height: Dimens
                                                                      .twentyFour,
                                                                  width: Dimens
                                                                      .twentyFour,
                                                                ),
                                                              ),
                                                            ),
                                                            Dimens.boxWidth10,
                                                            Text(
                                                              item.cartquantity
                                                                  .toString(),
                                                            ),
                                                            Dimens.boxWidth10,
                                                            GestureDetector(
                                                              onTap:
                                                                  item.inCart ??
                                                                          false
                                                                      ? null
                                                                      : () {
                                                                          // controller
                                                                          //     .getAllProductDocList[
                                                                          // index]
                                                                          //     .cartquantity++;
                                                                          // controller
                                                                          //     .update();
                                                                        },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: ColorsValue
                                                                      .colorDFDFDF,
                                                                ),
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  AssetConstants
                                                                      .ic_plus_icon,
                                                                  height: Dimens
                                                                      .twentyFour,
                                                                  width: Dimens
                                                                      .twentyFour,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Dimens.boxHeight10,
                                                  Padding(
                                                    padding: Dimens
                                                        .edgeInsets10_0_10_10,
                                                    child: Row(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            Get.closeCurrentSnackbar();
                                                            if (item.inCart ??
                                                                false) {
                                                              Get.find<
                                                                      BottomBarController>()
                                                                  .tabController
                                                                  ?.animateTo(
                                                                      1);
                                                            } else {
                                                              // if (controller
                                                              //     .productArrivalDocList[
                                                              // index]
                                                              //     .cartquantity
                                                              //     .toDouble() >
                                                              //     0) {
                                                              //   controller.postAddToCart(
                                                              //       item.id ?? "",
                                                              //       item.cartquantity,
                                                              //       index,
                                                              //       "arrival");
                                                              // } else {
                                                              //   Utility.errorMessage(
                                                              //       "Please add one item.");
                                                              // }
                                                            }
                                                          },
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/svg/ic_bank.svg',
                                                            // height: 25,
                                                          ),
                                                        ),
                                                        Dimens.boxWidth10,
                                                        Expanded(
                                                          child: InkWell(
                                                            onTap: () {
                                                              showCustomCartDialog(
                                                                context:
                                                                    context,
                                                                item: item,
                                                                onIncrease:
                                                                    () => print(
                                                                        "Increment Quantity"),
                                                                onDecrease:
                                                                    () => print(
                                                                        "Decrease Quantity"),
                                                                onCheckout:
                                                                    () => print(
                                                                        "Checkout"),
                                                                onRemove: () =>
                                                                    print(
                                                                        "Remove Item"),
                                                              );
                                                            },
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              padding: Dimens
                                                                  .edgeInsets14_0_14_0,
                                                              height:
                                                                  Dimens.fourty,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: ColorsValue
                                                                    .buttomColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  Dimens.ten,
                                                                ),
                                                              ),
                                                              child: Text(
                                                                'Order Now',
                                                                style: Styles
                                                                    .whiteColorW60012,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AssetConstants.ic_filter_empty,
                                  ),
                                  Dimens.boxHeight10,
                                  Text(
                                    controller.category.isNotEmpty
                                        ? "${controller.categoryName} data not found...!"
                                        : "${controller.productTypeViewAll} data not found...!",
                                    style: Styles.black64748BW50016,
                                  )
                                ],
                              ),
                            )
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
