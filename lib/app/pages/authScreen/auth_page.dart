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
                          text: 'Forgot your log in details?  ',
                          style: Styles.black50012,
                        ),
                        TextSpan(
                          text: 'Get help logging in. ',
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
                          text: 'Don’t have an account? ',
                          style: Styles.black50012,
                        ),
                        TextSpan(
                          text: 'Sign up',
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
