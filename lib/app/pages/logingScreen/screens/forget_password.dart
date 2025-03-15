import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ga_final/app/app.dart';
import 'package:ga_final/app/widgets/custom_button.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => Scaffold(
        backgroundColor: ColorsValue.primaryColor,
        body: SafeArea(
          child: Form(
            key: controller.forgotPassFormkey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: context.width,
                    height: context.height * 0.4,
                    child: Image.asset(
                      AssetConstants.forgotMainView,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Dimens.boxHeight40,
                  Padding(
                    padding: Dimens.edgeInsets20_0_20_0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringConstants.forgot_password,
                          style: Styles.primaryBold28,
                        ),
                        Dimens.boxHeight12,
                        Text(
                          StringConstants.enter_email_set_pass,
                          style: Styles.black40016,
                        ),
                        Dimens.boxHeight40,
                        CustomTextFormField(
                          text: StringConstants.email,
                          hintText: StringConstants.enter_email,
                          fillColor: ColorsValue.colorEEEAEA,
                          controller: controller.forgotEmailController,
                          validation: (value) {
                            if (value!.isNotEmpty) {
                              if (validateEmail(value) != null) {
                                return StringConstants.please_enter_valid_email;
                              }
                            } else {
                              return StringConstants.please_enter_valid_email;
                            }
                            return null;
                          },
                        ),
                        Dimens.boxHeight50,
                        CustomButton(
                          height: Dimens.fourtyFive,
                          text: StringConstants.recover_password,
                          onTap: () {
                            if (controller.forgotPassFormkey.currentState!
                                .validate()) {
                              controller.forgotPass();
                            }
                          },
                        ),
                      ],
                    ),
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