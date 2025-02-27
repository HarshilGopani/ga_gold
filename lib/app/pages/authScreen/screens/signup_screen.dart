import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ga_gold/app/pages/pages.dart';
import 'package:ga_gold/app/theme/theme.dart';
import 'package:ga_gold/app/utils/utils.dart';
import 'package:ga_gold/app/widgets/widgets.dart';
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
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.maxFinite, Dimens.zero),
            child: AppBar(
              backgroundColor: ColorsValue.primaryColor,
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: 'already_have_an_account'.tr,
                    style: Styles.black50012,
                  ),
                  TextSpan(
                    text: 'log_in'.tr,
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
          body: Form(
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
                  controller: controller.emailController,
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
                        .contains(controller.confirmPasswordController.text)) {
                      return 'pass_validation'.tr;
                    }
                    return null;
                  },
                ),
                Dimens.boxHeight20,
                Text("upload_visiting_card".tr, style: Styles.color21212150014),
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
                        UploadCardButton(title: "upload_front_side".tr),
                        Expanded(
                          child: UploadCardButton(title: "upload_back_side".tr),
                        ),
                      ],
                    ),
                  ),
                ),
                Dimens.boxHeight20,
                Text(
                  "buyer_type".tr,
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
                  hint: Text("select_type".tr),
                  items: controller.buyerTypes.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      controller.selectedBuyerType = value;
                    });
                  },
                ),
                Dimens.boxHeight20,
                CustomButton(
                  height: Dimens.fifty,
                  text: 'sign_up'.tr,
                  onTap: () {
                    if (controller.signUpFormkey.currentState!.validate()) {}
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class UploadCardButton extends StatelessWidget {
  final String title;

  const UploadCardButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: DottedBorder(
          radius: Radius.circular(Dimens.ten),
          color: ColorsValue.color64748,
          child: Container(
            decoration: BoxDecoration(
              color: ColorsValue.transparent,
              borderRadius: BorderRadius.circular(Dimens.twelve),
            ),
            child: Padding(
              padding: EdgeInsets.all(Dimens.twelve),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AssetConstants.downloadIcon),
                  Dimens.boxHeight5,
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Styles.color6474814500,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
