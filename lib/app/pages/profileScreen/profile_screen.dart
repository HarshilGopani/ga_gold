import 'dart:io';

import 'package:Ga_Gold/app/app.dart';
import 'package:Ga_Gold/app/navigators/navigators.dart';
import 'package:Ga_Gold/device/device.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      initState: (state) {
        var controller = Get.find<ProfileController>();
        if (Utility.isLoginOrNot()) {
          controller.isProfileLoading = true;
          controller.getProfile();
        }
      },
      builder: (controller) => Scaffold(
        backgroundColor: ColorsValue.primaryColor,
        body: Stack(
          children: [
            ListView(
              physics: const ClampingScrollPhysics(),
              children: [
                Padding(
                  padding: Dimens.edgeInsets20,
                  child: Stack(
                    children: [
                      Padding(
                        padding: Dimens.edgeInsetsTop60,
                        child: Container(
                          height: Dimens.hundredThirtySix,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: ColorsValue.colorF3F4F6,
                            borderRadius: BorderRadius.circular(
                              Dimens.sixteen,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                controller.getProfileModel?.name ?? ' Parthiv ',
                                style: Styles.blackW80018,
                              ),
                              Dimens.boxHeight5,
                              Text(
                                controller.getProfileModel?.email ??
                                    'test@email.com',
                                style: Styles.color21212170014,
                              ),
                              Dimens.boxHeight25
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            if (await Utility.imagePermissionCheack(context)) {
                              controller.setProfilePic();
                              controller.isProfileLoading = true;
                              controller.update();
                            }
                          },
                          child: SizedBox(
                            height: Dimens.hundredTen,
                            width: Dimens.hundredTen,
                            child: Stack(
                              children: [
                                Container(
                                  height: Dimens.hundredTen,
                                  width: Dimens.hundredTen,
                                  decoration: BoxDecoration(
                                    color: ColorsValue.colorF3F4F6,
                                    borderRadius: BorderRadius.circular(
                                      Dimens.twoHundred,
                                    ),
                                    border: Border.all(
                                      width: 5,
                                      color: ColorsValue.colorF3F4F6,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      Dimens.twoHundred,
                                    ),
                                    child: CachedNetworkImage(
                                      height: Dimens.hundredTen,
                                      width: Dimens.hundredTen,
                                      imageUrl:
                                          controller.selectedProfileImage ??
                                              (''),
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) {
                                        return Image.asset(
                                          AssetConstants.usera,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                      errorWidget: (context, url, error) {
                                        return Image.asset(
                                          AssetConstants.usera,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                    // CachedNetworkImage(
                                    //   height: Dimens.hundredTen,
                                    //   width: Dimens.hundredTen,
                                    //   imageUrl: controller.profileImage ?? '',
                                    //   fit: BoxFit.cover,
                                    //   placeholder: (context, url) {
                                    //     return Image.asset(
                                    //       AssetConstants.placeholder,
                                    //       fit: BoxFit.cover,
                                    //     );
                                    //   },
                                    //   errorWidget: (context, url, error) {
                                    //     return SvgPicture.asset(
                                    //       AssetConstants.placeholder,
                                    //       fit: BoxFit.cover,
                                    //     );
                                    //   },
                                    // ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: Dimens.thirty,
                                    width: Dimens.thirty,
                                    decoration: BoxDecoration(
                                      color: ColorsValue.primaryColor,
                                      borderRadius: BorderRadius.circular(
                                        Dimens.hundred,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.edit,
                                      color: ColorsValue.blackColor,
                                      size: Dimens.twenty,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: Dimens.edgeInsets20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: Dimens.sixty,
                        decoration: BoxDecoration(
                          color: ColorsValue.colorF3F4F6,
                          borderRadius: BorderRadius.circular(
                            Dimens.sixteen,
                          ),
                        ),
                        child: Center(
                          child: ListTile(
                            contentPadding: Dimens.edgeInsets20_00_20_00,
                            leading: SvgPicture.asset(
                              AssetConstants.ic_call,
                              colorFilter: ColorFilter.mode(
                                ColorsValue.color475569,
                                BlendMode.srcIn,
                              ),
                            ),
                            title: Text(
                              controller.getProfileModel?.mobile ??
                                  "+91 1234567890",
                              style: Styles.color21212160014,
                            ),
                          ),
                        ),
                      ),
                      Dimens.boxHeight20,
                      Divider(
                        height: Dimens.one,
                        color: ColorsValue.colorF3F4F6,
                      ),
                      Dimens.boxHeight20,
                      GestureDetector(
                        onTap: () {
                          RouteManagement.goToOrderScreen();
                        },
                        child: Container(
                          height: Dimens.sixty,
                          decoration: BoxDecoration(
                            color: ColorsValue.colorF3F4F6,
                            borderRadius: BorderRadius.circular(
                              Dimens.sixteen,
                            ),
                          ),
                          child: Center(
                            child: ListTile(
                              contentPadding: Dimens.edgeInsets20_00_20_00,
                              trailing: const Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: ColorsValue.colorA7A7A7,
                              ),
                              leading: SvgPicture.asset(
                                AssetConstants.ic_orderHistory,
                                height: Dimens.twentyFour,
                                width: Dimens.twentyFour,
                              ),
                              title: Text(
                                "order_history".tr,
                                style: Styles.color21212160014,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Dimens.boxHeight20,
                      InkWell(
                        onTap: () =>
                            RouteManagement.goToRepairOrderHistoryScreen(),
                        child: Container(
                          height: Dimens.sixty,
                          decoration: BoxDecoration(
                            color: ColorsValue.colorF3F4F6,
                            borderRadius: BorderRadius.circular(
                              Dimens.sixteen,
                            ),
                          ),
                          child: Center(
                            child: ListTile(
                              contentPadding: Dimens.edgeInsets20_00_20_00,
                              trailing: const Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: ColorsValue.colorA7A7A7,
                              ),
                              leading: SvgPicture.asset(
                                AssetConstants.ic_repair,
                                colorFilter: ColorFilter.mode(
                                  ColorsValue.color475569,
                                  BlendMode.srcIn,
                                ),
                                height: Dimens.twentyFour,
                                width: Dimens.twentyFour,
                              ),
                              title: Text(
                                "repair_order_history".tr,
                                style: Styles.color21212160014,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Dimens.boxHeight20,
                      InkWell(
                        onTap: () =>
                            RouteManagement.goToSampleOrderHistoryScreen(),
                        child: Container(
                          height: Dimens.sixty,
                          decoration: BoxDecoration(
                            color: ColorsValue.colorF3F4F6,
                            borderRadius: BorderRadius.circular(
                              Dimens.sixteen,
                            ),
                          ),
                          child: Center(
                            child: ListTile(
                              contentPadding: Dimens.edgeInsets20_00_20_00,
                              trailing: const Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: ColorsValue.colorA7A7A7,
                              ),
                              leading: SvgPicture.asset(
                                AssetConstants.ic_customize,
                              ),
                              title: Text(
                                "customize_order_history".tr,
                                style: Styles.color21212160014,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Dimens.boxHeight20,
                      Container(
                        height: Dimens.sixty,
                        decoration: BoxDecoration(
                          color: ColorsValue.colorF3F4F6,
                          borderRadius: BorderRadius.circular(
                            Dimens.sixteen,
                          ),
                        ),
                        child: Center(
                          child: ListTile(
                            onTap: () async {
                              await Get.dialog(
                                Material(
                                  color: ColorsValue.transparent,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: Dimens.edgeInsets20_00_20_00,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(Dimens.sixteen),
                                              ),
                                              color: ColorsValue.whiteColor),
                                          width: Get.width,
                                          child: Padding(
                                            padding:
                                                Dimens.edgeInsets30_30_30_20,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SvgPicture.asset(
                                                  AssetConstants.ic_logout,
                                                  height: Dimens.sixtyFour,
                                                  width: Dimens.sixtyFour,
                                                  colorFilter: ColorFilter.mode(
                                                    ColorsValue.redColor,
                                                    BlendMode.srcIn,
                                                  ),
                                                ),
                                                Dimens.boxHeight20,
                                                Text(
                                                  "Are you sure you want to\nLogout?"
                                                      .tr,
                                                  style: Styles.black221W70018,
                                                  textAlign: TextAlign.center,
                                                ),
                                                Dimens.boxHeight20,
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          fixedSize: Size(
                                                              double.infinity,
                                                              Dimens
                                                                  .fourtyFive),
                                                          backgroundColor:
                                                              ColorsValue
                                                                  .primaryColor,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        Dimens
                                                                            .six),
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        child: Text(
                                                          "cancle"
                                                              .tr
                                                              .toUpperCase(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: Styles
                                                              .blackColorW50014,
                                                        ),
                                                      ),
                                                    ),
                                                    Dimens.boxWidth15,
                                                    Expanded(
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          fixedSize: Size(
                                                              double.infinity,
                                                              Dimens
                                                                  .fourtyFive),
                                                          backgroundColor:
                                                              ColorsValue
                                                                  .redColor,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        Dimens
                                                                            .six),
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          Get.find<
                                                                  DeviceRepository>()
                                                              .deleteBox();
                                                          RouteManagement
                                                              .goToLoginView();
                                                        },
                                                        child: Text(
                                                          "logout"
                                                              .tr
                                                              .toUpperCase(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: Styles
                                                              .whiteW60016,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            contentPadding: Dimens.edgeInsets20_00_20_00,
                            leading: SvgPicture.asset(
                              AssetConstants.ic_logout,
                              colorFilter: ColorFilter.mode(
                                ColorsValue.colorD80032,
                                BlendMode.srcIn,
                              ),
                            ),
                            title: Text(
                              "logout".tr,
                              style: Styles.colorD8003260014,
                            ),
                          ),
                        ),
                      ),
                      if (Platform.isIOS) ...[
                        Dimens.boxHeight20,
                        InkWell(
                          onTap: () {
                            Utility.launchLinkURL(
                                "https://docs.google.com/forms/d/e/1FAIpQLSe2Psqwa-MxssS1xWREob1UyK1LCS2rMILMkz8IR5mRjNaQMQ/viewform?usp=dialog");
                          },
                          child: Container(
                            height: Dimens.sixty,
                            decoration: BoxDecoration(
                              color: ColorsValue.colorF3F4F6,
                              borderRadius: BorderRadius.circular(
                                Dimens.sixteen,
                              ),
                            ),
                            child: Center(
                              child: ListTile(
                                contentPadding: Dimens.edgeInsets20_00_20_00,
                                leading: Image.asset(
                                  AssetConstants.delete_ac,
                                  height: Dimens.thirty,
                                  width: Dimens.thirty,
                                  color: ColorsValue.redColor,
                                ),
                                title: Text(
                                  "Delete Account".tr,
                                  style: Styles.colorD8003260014,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
