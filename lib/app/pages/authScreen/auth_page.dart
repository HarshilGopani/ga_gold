import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ga_gold/app/app.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) => Scaffold(
        backgroundColor: ColorsValue.whiteColor,
        body: Padding(
          padding: Dimens.edgeInsets20_20_20_0,
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Image.asset(
                  AssetConstants.loginIcon,
                  height: Get.height / 1.89,
                ),
                CustomTextFormField(
                  text: 'user_name'.tr,
                  hintText: 'user_name'.tr,
                  controller: controller.tcUserName,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  hintStyle: Styles.black12.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: ColorsValue.blackColor,
                  ),
                  validation: (value) {
                    if (value!.isEmpty) return "enter_user_name".tr;
                    return null;
                  },
                ),
                Dimens.boxHeight10,
                CustomTextFormField(
                  text: 'password'.tr,
                  hintText: 'password'.tr,
                  controller: controller.tcPasss,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  hintStyle: Styles.black12.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: ColorsValue.blackColor,
                  ),
                  validation: (value) {
                    if (value!.isEmpty) return "enter_password".tr;
                    return null;
                  },
                ),
                Dimens.boxHeight20,
                CustomButton(
                  height: Dimens.fifty,
                  text: 'login'.tr,
                  onTap: () {
                    RouteManagement.goToMobileVerificationView();
                  },
                ),
                Dimens.boxHeight10,
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'forgot_your_log'.tr,
                          style: Styles.black50012,
                        ),
                        TextSpan(
                          text: 'get_help_logging_in'.tr,
                          style: Styles.lightYellow40012,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              RouteManagement.goToForgotView();
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                Dimens.boxHeight40,
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'dont_have_an_account'.tr,
                          style: Styles.black50012,
                        ),
                        TextSpan(
                          text: 'sign_up'.tr,
                          style: Styles.lightYellow40012,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              RouteManagement.goToSignupView();
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                Dimens.boxHeight5,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
