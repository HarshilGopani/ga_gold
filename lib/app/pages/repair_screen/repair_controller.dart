import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ga_final/app/app.dart';
import 'package:ga_final/app/navigators/navigators.dart';
import 'package:ga_final/app/widgets/custom_stepper.dart';
import 'package:ga_final/domain/domain.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class RepairController extends GetxController {
  RepairController(this.repairPresenter);

  final RepairPresenter repairPresenter;

  int selectedValue = 0;

  final TextEditingController productNameController = TextEditingController();
  final TextEditingController tc_goldPuirty = TextEditingController();
  final TextEditingController tc_size = TextEditingController();
  final TextEditingController tc_weight = TextEditingController();

  List<CustomStepperView> pendingStepper = [
    CustomStepperView(
      title: 'Pending Order',
      subTitle: '20-07-2024',
      isActivate: true,
    ),
    CustomStepperView(
      title: 'Processing Order',
      subTitle: '20-07-2024',
      isActivate: false,
    ),
    CustomStepperView(
      title: 'Completed Order',
      subTitle: '20-07-2024',
      isActivate: false,
    ),
  ];

  List<CustomStepperView> completStepper = [
    CustomStepperView(
      title: 'Pending Order',
      subTitle: '20-07-2024',
      isActivate: true,
    ),
    CustomStepperView(
      title: 'Processing Order',
      subTitle: '20-07-2024',
      isActivate: true,
    ),
    CustomStepperView(
      title: 'Completed Order',
      subTitle: '20-07-2024',
      isActivate: true,
    ),
  ];

  List<CustomStepperView> pocessingStepper = [
    CustomStepperView(
      title: 'Pending Order',
      subTitle: '20-07-2024',
      isActivate: true,
    ),
    CustomStepperView(
      title: 'Processing Order',
      subTitle: '20-07-2024',
      isActivate: true,
    ),
    CustomStepperView(
      title: 'Completed Order',
      subTitle: '20-07-2024',
      isActivate: false,
    ),
  ];

  List<CustomStepperView> cancelledStepper = [
    CustomStepperView(
      title: 'Pending Order',
      subTitle: '20-07-2024',
      isActivate: true,
    ),
    CustomStepperView(
      title: 'Processing Order',
      subTitle: '20-07-2024',
      isActivate: true,
    ),
    CustomStepperView(
      title: 'Cancelled Order',
      subTitle: '20-07-2024',
      isActivate: true,
    ),
  ];

  selectImage(BuildContext context, bool isSample) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      barrierColor: Colors.grey.withOpacity(0.5),
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                width: double.maxFinite,
                padding: Dimens.edgeInsets20_05_20_30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimens.twelve),
                    topRight: Radius.circular(Dimens.twelve),
                  ),
                  color: ColorsValue.textfildBorder,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: Dimens.seventy,
                      height: Dimens.four,
                      decoration: BoxDecoration(
                        color: ColorsValue.whiteColor,
                        borderRadius: BorderRadius.circular(
                          Dimens.three,
                        ),
                      ),
                    ),
                    Dimens.boxHeight30,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            if (await Utility.imagePermissionCheack(context)) {
                              Utility.showLoader();
                              selectPic(ImageSource.gallery);
                              Get.back();
                            }
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AssetConstants.ic_gallery,
                              ),
                              Dimens.boxHeight10,
                              Text(
                                'gallery'.tr,
                                style: Styles.color47556960012,
                              )
                            ],
                          ),
                        ),
                        Dimens.boxWidth50,
                        InkWell(
                          onTap: () async {
                            if (await Utility.cameraPermissionCheack(context)) {
                              Utility.showLoader();
                              selectPic(ImageSource.camera);
                              Get.back();
                            }
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AssetConstants.ic_camera,
                              ),
                              Dimens.boxHeight10,
                              Text(
                                'camera'.tr,
                                style: Styles.color47556960012,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Dimens.boxHeight30,
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  final pickerProfile = ImagePicker();
  File? imageFile;
  String profileImage = "";
  RepairOrderUploadImageData? reapirUploadData;

  Future selectPic(ImageSource sourcePic) async {
    final pickedFile = await pickerProfile.pickImage(
      source: sourcePic,
    );

    if (pickedFile != null) {
      if (Utility.getImageSizeMB(pickedFile.path) <= 10) {
        Utility.showLoader();
        imageFile = File(pickedFile.path);
        var response = await repairPresenter.repairOrderImage(
          filePath: pickedFile.path,
          isLoading: false,
        );
        reapirUploadData = null;
        if (response?.data != null) {
          Utility.showLoader();
          reapirUploadData = response?.data;
          RouteManagement.goToRepairDetailsScreen();
        }
      } else {
        Utility.closeLoader();

        Utility.errorMessage("max_10_mb_img".tr);
      }
    } else {
      Utility.closeLoader();
    }
    update();
  }

  String selectSamplePic = "";
  List<SampleOrderImageDatum> imageList = [];
  final picker = ImagePicker();

  Future sampleOrderImage(BuildContext context) async {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      barrierColor: Colors.grey.withOpacity(0.5),
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                width: double.maxFinite,
                padding: Dimens.edgeInsets20_05_20_30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimens.twelve),
                    topRight: Radius.circular(Dimens.twelve),
                  ),
                  color: ColorsValue.textfildBorder,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: Dimens.seventy,
                      height: Dimens.four,
                      decoration: BoxDecoration(
                        color: ColorsValue.whiteColor,
                        borderRadius: BorderRadius.circular(
                          Dimens.three,
                        ),
                      ),
                    ),
                    Dimens.boxHeight30,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            if (await Utility.imagePermissionCheack(context)) {
                              postImage("gallery");
                              Get.back();
                              Utility.showLoader();
                            }
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AssetConstants.ic_gallery,
                              ),
                              Dimens.boxHeight10,
                              Text(
                                'gallery'.tr,
                                style: Styles.color47556960012,
                              )
                            ],
                          ),
                        ),
                        Dimens.boxWidth50,
                        InkWell(
                          onTap: () async {
                            if (await Utility.cameraPermissionCheack(context)) {
                              postImage("camera");
                              Get.back();
                              Utility.showLoader();
                            }
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AssetConstants.ic_camera,
                              ),
                              Dimens.boxHeight10,
                              Text(
                                'camera'.tr,
                                style: Styles.color47556960012,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Dimens.boxHeight30,
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  void postImage(String imageSource) async {
    if (imageSource == "gallery") {
      final List<XFile> selectedImages =
          await picker.pickMultiImage(imageQuality: 5);

      if (selectedImages.isNotEmpty) {
        for (var images in selectedImages) {
          if (Utility.getImageSizeMB(images.path) <= 10) {
            if (imageList.length < 5) {
              var response = await repairPresenter.sampleOrderImage(
                filePath: images.path,
                isLoading: false,
              );
              if (response != null) {
                imageList.addAll(response.data ?? []);
                RouteManagement.goToSampleOrderScreen();
                Utility.closeLoader();
              }
              update();
            } else {
              Utility.closeLoader();
              Utility.errorMessage('Maximum 5 Photos Upload'.tr);
            }
          } else {
            Utility.closeLoader();
            Utility.errorMessage("max_10_mb_img".tr);
          }
        }
      }
    } else {
      final pickedFile = await pickerProfile.pickImage(
        source: ImageSource.camera,
      );

      if (pickedFile != null) {
        if (Utility.getImageSizeMB(pickedFile.path) <= 10) {
          if (imageList.length < 5) {
            imageFile = File(pickedFile.path);
            var response = await repairPresenter.sampleOrderImage(
              filePath: pickedFile.path,
              isLoading: false,
            );
            if (response?.data != null) {
              Utility.closeLoader();
              imageList.addAll(response?.data ?? []);
              RouteManagement.goToSampleOrderScreen();
            }
          } else {
            Utility.closeLoader();
            Utility.errorMessage('Maximum 5 Photos Upload'.tr);
          }
        } else {
          Utility.closeLoader();
          Utility.errorMessage("max_10_mb_img".tr);
        }
      }
    }
    update();
  }

  final TextEditingController sampleproductNameController =
      TextEditingController();
  final TextEditingController sampletc_goldPuirty = TextEditingController();
  final TextEditingController sampletc_size = TextEditingController();
  final TextEditingController sampletc_weight = TextEditingController();

  int selectQuantity = 1;

  Future<void> postSampleOrder() async {
    var response = await repairPresenter.postSampleOrder(
      images: imageList,
      totalQuantity: selectQuantity,
      description: descriptionSampleController.text,
      productName: sampleproductNameController.text,
      priority: sampletc_goldPuirty.text,
      weight: sampletc_weight.text,
      size: sampletc_size.text,
      isLoading: false,
    );
    if (response?.statusCode == 200) {
      Utility.closeLoader();
      RouteManagement.goToBottomBarView();
      update();
    } else {
      Utility.closeLoader();
      Utility.errorMessage(
          jsonDecode(response?.data.toString() ?? "")["Message"]);
    }
  }

  Future<void> postRepairOrder() async {
    var response = await repairPresenter.postRepairOrder(
      file: reapirUploadData?.fileId ?? "",
      description: descriptionController.text,
      productName: productNameController.text,
      priority: tc_goldPuirty.text,
      weight: tc_weight.text,
      size: tc_size.text,
      isLoading: false,
    );
    if (response?.statusCode == 200) {
      Utility.closeLoader();
      RouteManagement.goToBottomBarView();
      update();
    } else {
      Utility.closeLoader();
      Utility.errorMessage(
          jsonDecode(response?.data.toString() ?? "")["data"]["Message"]);
    }
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  GlobalKey<FormState> desKey = GlobalKey<FormState>();
  TextEditingController descriptionController = TextEditingController();

  GlobalKey<FormState> sampleKey = GlobalKey<FormState>();
  TextEditingController descriptionSampleController = TextEditingController();

  PagingController<int, RepairOrderHistoryDoc> repairOrderPagingController =
      PagingController(firstPageKey: 1);

  List<RepairOrderHistoryDoc> repairOrderList = [];
  int repairLimit = 10;

  var client = http.Client();

  bool isRepairLoad = true;

  Future<void> repairOrderListData(pageKey) async {
    var response = await client.post(
      Uri.parse("https://api.gagold.in/user/repairingorders"),
      headers: {
        "Content-Type": "application/json",
        'Authorization':
            'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
      },
      body: jsonEncode({
        "page": pageKey,
        "limit": 10,
      }),
    );

    var repairOrderModel = repairOrderHistoryModelFromJson(response.body);
    if (repairOrderModel.data != null) {
      if (pageKey == 1) {
        repairOrderList.clear();
      }
      repairOrderList = repairOrderModel.data?.docs ?? [];

      final isLastPage = repairOrderList.length < repairLimit;
      if (isLastPage) {
        repairOrderPagingController.appendLastPage(repairOrderList);
      } else {
        var nextPageKey = pageKey + 1;
        repairOrderPagingController.appendPage(repairOrderList, nextPageKey);
      }
      isRepairLoad = false;
    } else {
      isRepairLoad = false;
      Utility.errorMessage(repairOrderModel.message.toString());
    }
    update();

    // var response = await repairPresenter.repairOrderList(
    //   page: pageKey,
    //   limit: repairLimit,
    //   isLoading: true,
    // );
    // if (response != null) {
    //   if (pageKey == 1) {
    //     repairOrderList.clear();
    //   }
    //   repairOrderList = response.data?.docs ?? [];
    //   final isLastPage = repairOrderList.length < repairLimit;
    //   if (isLastPage) {
    //     repairOrderPagingController.appendLastPage(repairOrderList);
    //   } else {
    //     var nextPageKey = pageKey + 1;
    //     repairOrderPagingController.appendPage(repairOrderList, nextPageKey);
    //   }
    // }
  }

  GetOneRepairOrderData? getOneRepairOrderData;

  Future<void> getOneRepairOrder({
    required String repairingOrderId,
  }) async {
    var response = await repairPresenter.getOneRepairOrder(
      repairingOrderId: repairingOrderId,
      isLoading: true,
    );
    getOneRepairOrderData = null;
    if (response?.data != null) {
      getOneRepairOrderData = response?.data;
      update();
    } else {
      Utility.errorMessage('Oops something went wrong');
    }
  }

  PagingController<int, SampleOrderHistoryDoc> smaplePagingController =
      PagingController(firstPageKey: 1);

  List<SampleOrderHistoryDoc> smapleListModel = [];
  int smapleLimit = 10;
  bool isSampleLoad = true;

  Future<void> postSampleOrderHistory(int pageKey) async {
    var response = await client.post(
      Uri.parse("https://api.gagold.in/user/sampleorders"),
      headers: {
        "Content-Type": "application/json",
        'Authorization':
            'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
      },
      body: jsonEncode({
        "page": pageKey,
        "limit": 10,
      }),
    );

    var sampleOrderHistoryModel =
        sampleOrderHistoryModelFromJson(response.body);
    if (sampleOrderHistoryModel.status == 200) {
      if (pageKey == 1) {
        smapleListModel.clear();
      }
      smapleListModel = sampleOrderHistoryModel.data?.docs ?? [];

      final isLastPage = smapleListModel.length < smapleLimit;
      if (isLastPage) {
        smaplePagingController.appendLastPage(smapleListModel);
      } else {
        var nextPageKey = pageKey + 1;
        smaplePagingController.appendPage(smapleListModel, nextPageKey);
      }
      isSampleLoad = false;
    } else {
      isSampleLoad = false;
      Utility.showMessage(sampleOrderHistoryModel.message.toString(),
          MessageType.error, () => null, '');
    }
    update();

    // var response = await repairPresenter.postSampleOrderHistory(
    //   page: pageKey,
    //   limit: smapleLimit,
    //   isLoading: false,
    // );
    // if (response != null) {
    //   if (pageKey == 1) {
    //     smapleListModel.clear();
    //   }
    //   smapleListModel = response.data?.docs ?? [];

    //   final isLastPage = smapleListModel.length < smapleLimit;
    //   if (isLastPage) {
    //     smaplePagingController.appendLastPage(smapleListModel);
    //   } else {
    //     var nextPageKey = pageKey + 1;
    //     smaplePagingController.appendPage(smapleListModel, nextPageKey);
    //   }
  }

  GetOneSampleData? getOneSampleData = GetOneSampleData();

  String sampleOrderId = "";

  Future<void> getOneSample() async {
    var response = await repairPresenter.getOneSample(
      sampleOrderId: sampleOrderId,
      isLoading: false,
    );
    getOneSampleData = null;
    if (response != null) {
      getOneSampleData = response.data;
      update();
    }
  }

  List stepperData = [
    {"title": "Order Placed", "subTitle": "Your order has been placed"},
    {"title": "Preparing", "subTitle": "Your order is being prepared"},
    {
      "title": "On the way",
      "subTitle": "Our delivery executive is on the way to deliver your item"
    },
    {"title": "Delivered", "subTitle": ""}
  ];
}
