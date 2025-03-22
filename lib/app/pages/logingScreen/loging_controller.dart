import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Ga_Gold/domain/models/upload_image_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:Ga_Gold/app/app.dart';
import 'package:Ga_Gold/app/navigators/routes_management.dart';
import 'package:Ga_Gold/domain/domain.dart';

class LoginController extends GetxController {
  LoginController(this.loginPresenter);

  final LoginPresenter loginPresenter;

  var firebaseMessaging = FirebaseMessaging.instance;

  String? facmToken;

  @override
  onInit() async {
    super.onInit();
    await firebaseMessaging.getToken().then((token) async {
      facmToken = token;
    });
  }

  ///// =========== >>>>> Login Screen <<<<< =========== /////

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> logingFormkey = GlobalKey<FormState>();

  String? selectedBuyerType;
  List<String> buyerTypes = ['Wholesale', 'B2B', 'Manufacturer'];

  LoginModel? loginData;

  bool isLoginLoading = false;

  Future<void> loginApi() async {
    try {
      var response = await http.post(
        Uri.parse("https://api.gagold.in/user/login"),
        headers: {
          "Content-Type": "application/json",
          'Authorization':
              'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
        },
        body: jsonEncode({
          "username": emailController.text,
          "password": passwordController.text,
          "fcm": facmToken ?? "",
        }),
      );

      var loginModel = LoginModel.fromJson(jsonDecode(response.body));

      loginData = null;
      if (response.statusCode == 200 && loginModel.data != null) {
        loginData = loginModel;

        Get.find<Repository>().saveValue(LocalKeys.authToken,
            loginModel.data is Data ? loginModel.data?.accessToken : "");
        RouteManagement.goToBottomBarView();
      } else {
        Utility.errorMessage(
            loginModel.message ?? 'Oops, something went wrong');
      }
    } catch (e) {
      isLoginLoading = false;
      Utility.errorMessage('An error occurred: ${e.toString()}');
    } finally {
      isLoginLoading = false;
      update();
    }
  }

  ///// =========== >>>>> Signup Screen <<<<< =========== /////

  GlobalKey<FormState> signUpFormkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController compleyNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController signEmailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  List<String> images = [];

  bool isEditValid = false;
  var dailEditcode = '+91';
  var client = http.Client();

  Future<void> registerApi() async {
    List<Map<String, String>> images = [];
    if (frountImage.isNotEmpty == true) {
      images.add({"url": frountImage});
    }
    if (backImage.isNotEmpty == true) {
      images.add({"url": backImage});
    }

    final body = jsonEncode({
      "name": nameController.text,
      "email": signEmailController.text,
      "companyname": compleyNameController.text,
      "city": cityController.text,
      "countryCode": dailEditcode,
      "mobile": "${dailEditcode.split("+").last}${mobileNumberController.text}",
      "country_wise_contact": {
        "number": mobileNumberController.text.isEmpty
            ? ""
            : "0${mobileNumberController.text}",
        "internationalNumber": "$dailEditcode ${mobileNumberController.text}",
        "nationalNumber": "0${mobileNumberController.text}",
        "e164Number": dailEditcode + mobileNumberController.text,
        "countryCode": PhoneNumber.getISO2CodeByPrefix(dailEditcode),
        "dialCode": dailEditcode,
      },
      "password": confirmPasswordController.text,
      "images": images,
      "buyertype": selectedBuyerType
    });
    var response = await client.post(
      Uri.parse("https://api.gagold.in/user/register"),
      headers: {
        "Content-Type": "application/json",
        'Authorization':
            'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
      },
      body: body,
    );
    var registerModel = registerModelFromJson(response.body);

    if (registerModel.data != null) {
      Utility.closeLoader();
      Utility.snacBar(registerModel.message ?? '', ColorsValue.primaryColor);
      RouteManagement.goToLoginView();
    } else {
      Utility.closeLoader();
      Utility.errorMessage(jsonDecode(registerModel.message ?? ""));
    }
    update();
  }

  selectImage(BuildContext context, bool isBack) {
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
                              Get.back();
                              selectPic(ImageSource.gallery, isBack: isBack);
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
                                style: Styles.whiteW60012,
                              )
                            ],
                          ),
                        ),
                        Dimens.boxWidth50,
                        InkWell(
                          onTap: () async {
                            if (await Utility.cameraPermissionCheack(context)) {
                              Get.back();
                              selectPic(ImageSource.camera, isBack: isBack);
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
                                style: Styles.whiteW60012,
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
  List<UploadImageDatum>? uploadData;
  String frountImage = '';
  String backImage = '';

  Future selectPic(ImageSource sourcePic, {required bool isBack}) async {
    Utility.showLoader();
    final pickedFile = await pickerProfile.pickImage(
      source: sourcePic,
    );

    if (pickedFile != null) {
      if (Utility.getImageSizeMB(pickedFile.path) <= 10) {
        imageFile = File(pickedFile.path);
        var response = await loginPresenter.uploadImage(
          filePath: pickedFile.path,
          isLoading: false,
        );
        uploadData = null;
        if (response?.data != null) {
          Utility.closeLoader();
          isBack
              ? backImage = response?.data[0].url ?? ''
              : frountImage = response?.data[0].url ?? '';
          // uploadData?.addAll(response?.data ?? []);
          // uploadData += response?.data ?? [];
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

  // Future<void> registerApi() async {
  //   var response = await loginPresenter.registerApi(
  //     city: cityController.text,
  //     countryCode: dailEditcode,
  //     mobile: "${dailEditcode.split("+").last}${mobileNumberController.text}",
  //     password: confirmPasswordController.text,
  //     name: nameController.text,
  //     email: emailController.text,
  //     companyname: compleyNameController.text,
  //     isLoading: true,
  //   );
  //   if (response?.data != null) {
  //     Utility.snacBar(response?.message ?? '', Colors.black26);l̥
  //     RouteManagement.goToLoginView();
  //   } else {
  //     Utility.errorMessage(jsonDecode(response?.message ?? ""));
  //   }
  //   update();
  // }

  ///// =========== >>>>> Signup Screen <<<<< =========== /////

  TextEditingController forgotEmailController = TextEditingController();
  GlobalKey<FormState> forgotPassFormkey = GlobalKey<FormState>();

  // Future<void> forgotPass() async {
  //   var response = await loginPresenter.forgotPass(
  //     email: forgotEmailController.text,
  //     isLoading: true,
  //   );

  //   // if (response?.data != null) {
  //   //   Get.snackbar('Forgot PassWord', response!.message.toString(),
  //   //       backgroundColor: ColorsValue.appColor);
  //   //   update();
  //   // } else {
  //   //   Utility.errorMessage('Oops something went wrong');
  //   // }
  //   if (response?.data != null) {
  //     Get.snackbar('Forgot PassWord', response!.message.toString(),
  //         backgroundColor: ColorsValue.appColor);
  //     Utility.closeLoader();
  //   } else {
  //     Utility.closeLoader();

  //     Utility.errorMessage('Oops something went wrong');
  //   }
  // }

  Future<void> forgotPass() async {
    var response = await client.post(
      Uri.parse("https://api.gagold.in/user/forgotpassword"),
      headers: {
        "Content-Type": "application/json",
        'Authorization':
            'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
      },
      body: jsonEncode({
        "email": forgotEmailController.text,
      }),
    );
    var forgotPassModel = forgotPassModelFromJson(response.body);
    if (forgotPassModel.data != null) {
      Get.snackbar('Forgot PassWord', forgotPassModel.message.toString(),
          backgroundColor: ColorsValue.appColor);
      Utility.closeLoader();
    } else {
      Utility.closeLoader();

      Utility.errorMessage('Oops something went wrong');
    }
    update();
  }

  @override
  void dispose() {
    emailController.clear();
    super.dispose();
  }
}
