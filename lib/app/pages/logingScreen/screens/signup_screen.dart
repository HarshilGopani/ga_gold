import 'package:Ga_Gold/app/app.dart';
import 'package:Ga_Gold/app/widgets/custom_button.dart';
import 'package:Ga_Gold/app/widgets/custom_international_textformfield.dart';
import 'package:Ga_Gold/app/widgets/upload_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.maxFinite, Dimens.zero),
            child: AppBar(
              backgroundColor: ColorsValue.primaryColor,
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Already Have An Account? ',
                    style: Styles.black50012,
                  ),
                  TextSpan(
                    text: 'Log In',
                    style: Styles.lightYellow40012,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.offAll(const LoginScreen());
                      },
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: ColorsValue.primaryColor,
          body: SafeArea(
            child: Form(
              key: controller.signUpFormkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(
                padding: Dimens.edgeInsets20,
                children: [
                  Text(
                    'sign_up'.tr,
                    style: Styles.primaryBold28,
                  ),
                  Dimens.boxHeight20,
                  CustomTextFormField(
                    text: 'name'.tr,
                    hintText: 'enter_your_name'.tr,
                    controller: controller.nameController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'please_enter_name'.tr;
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight14,
                  CustomTextFormField(
                    text: 'company_name'.tr,
                    hintText: 'enter_your_company_name'.tr,
                    controller: controller.compleyNameController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'please_enter_your_company_name'.tr;
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight14,
                  CustomInternationalPhoneFild(
                    textEditingController: controller.mobileNumberController,
                    text: 'mobile_number'.tr,
                    hintText: 'enter_mobile_number'.tr,
                    initialvalue: PhoneNumber(
                      isoCode: PhoneNumber.getISO2CodeByPrefix(
                        controller.dailEditcode,
                      ),
                    ),
                    onInputChanged: (PhoneNumber number) {
                      controller.dailEditcode = number.dialCode ?? '';
                    },
                    oninitialValidation: (bool value) {
                      controller.isEditValid = value;
                      controller.update();
                    },
                    validation: (value) {
                      if (value!.isEmpty) {
                        return "enteryournumber".tr;
                      } else if (!controller.isEditValid) {
                        return "enter_valid_phone_number".tr;
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight14,
                  CustomTextFormField(
                    text: 'email'.tr,
                    hintText: 'enter_your_email'.tr,
                    controller: controller.signEmailController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'please_enter_your_email'.tr;
                      } else if (!Utility.emailValidator(value)) {
                        return 'please_enter_valid_email'.tr;
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight14,
                  CustomTextFormField(
                    text: 'city'.tr,
                    hintText: 'please_enter_city'.tr,
                    controller: controller.cityController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'please_enter_city'.tr;
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight14,
                  CustomTextFormField(
                    text: 'new_password'.tr,
                    hintText: 'enter_new_password'.tr,
                    controller: controller.newPasswordController,
                    textInputAction: TextInputAction.next,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'please_enter_new_password'.tr;
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight14,
                  CustomTextFormField(
                    text: 'confirm_password'.tr,
                    hintText: 'enter_confirm_password'.tr,
                    controller: controller.confirmPasswordController,
                    textInputAction: TextInputAction.next,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'please_enter_confirm_password'.tr;
                      } else if (!controller.newPasswordController.text
                          .contains(
                              controller.confirmPasswordController.text)) {
                        return 'pass_validation'.tr;
                      }
                      return null;
                    },
                  ),
                  Dimens.boxHeight30,
                  Text("Upload Visiting Card".tr,
                      style: Styles.color21212150014),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorsValue.F3F4F6Color,
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: (controller.frountImage == '' ||
                                    controller.frountImage.isEmpty)
                                ? UploadCardButton(
                                    title: "Upload fount side".tr,
                                    loginController: controller,
                                    isBack: false,
                                  )
                                : Stack(
                                    children: [
                                      SizedBox(
                                        width: Get.width,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                (controller.frountImage ?? ''),
                                            fit: BoxFit.cover,
                                            maxWidthDiskCache: 100,
                                            maxHeightDiskCache: 100,
                                            height: Dimens.hundred,
                                            width: Dimens.fifty,
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
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: InkWell(
                                          onTap: () {
                                            controller.frountImage = '';
                                            controller.update();
                                          },
                                          child: SvgPicture.asset(
                                            AssetConstants.ic_remove,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                          Dimens.boxWidth10,
                          Expanded(
                            child: (controller.backImage == '' ||
                                    controller.backImage.isEmpty)
                                ? UploadCardButton(
                                    title: "Upload Back side".tr,
                                    loginController: controller,
                                    isBack: true,
                                  )
                                : Stack(
                                    children: [
                                      SizedBox(
                                        width: Get.width,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                (controller.backImage ?? ''),
                                            fit: BoxFit.cover,
                                            maxWidthDiskCache: 100,
                                            maxHeightDiskCache: 100,
                                            height: Dimens.hundred,
                                            width: Dimens.fifty,
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
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: InkWell(
                                          onTap: () {
                                            controller.backImage = '';
                                            controller.update();
                                          },
                                          child: SvgPicture.asset(
                                            AssetConstants.ic_remove,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Dimens.boxHeight20,
                  Text(
                    "Buyer Type",
                    style: Styles.color21212150014,
                  ),
                  Dimens.boxHeight10,
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    ),
                    value: controller.selectedBuyerType,
                    dropdownColor: ColorsValue.textfildBorder,
                    hint: Text("Select Type"),
                    items: controller.buyerTypes.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      );
                    }).toList(),
                    onChanged: (value) {
                      controller.selectedBuyerType = value;
                      controller.update();
                    },
                  ),
                  Dimens.boxHeight20,
                  CustomButton(
                    height: Dimens.fourtyFive,
                    text: 'Sign Up',
                    onTap: () {
                      if (controller.frountImage.isEmpty) {
                        Utility.errorMessage("Upload front side image.");
                      } else if (controller.backImage.isEmpty) {
                        Utility.errorMessage("Upload back side image.");
                      } else {
                        if (controller.signUpFormkey.currentState!.validate()) {
                          Utility.showLoader();
                          controller.registerApi();
                        }
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
      dispose: (state) {
        state.controller?.backImage = '';
        state.controller?.frountImage = '';
      },
    );
  }
}
