import 'package:Ga_Gold/app/app.dart';
import 'package:Ga_Gold/app/widgets/custom_button.dart';
import 'package:Ga_Gold/domain/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class VerifyIdentityScreen extends StatelessWidget {
  const VerifyIdentityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: Dimens.edgeInsets20,
                child: CustomButton(
                  height: Dimens.fourtyFive,
                  backgroundColor: Get.find<Repository>()
                          .getStringValue(LocalKeys.authToken)
                          .isNotEmpty
                      ? ColorsValue.lightYellow
                      : ColorsValue.appColor.withValues(alpha: 0.5),
                  text: 'Get Start',
                  onTap: () {},
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: ListView(
              padding: Dimens.edgeInsets20,
              physics: ClampingScrollPhysics(),
              children: [
                Image.asset(
                  AssetConstants.app_logo,
                  height: Dimens.hundredThirty,
                  width: Dimens.hundredThirty,
                ),
                SvgPicture.asset(
                  AssetConstants.verify_user,
                  height: Dimens.threeHundredFifty,
                ),
                Dimens.boxHeight20,
                Center(
                  child: Text(
                    "Verify Your Identity",
                    style: Styles.appColor70020,
                  ),
                ),
                Dimens.boxHeight20,
                Center(
                  child: Text(
                    "Your mobile number ${controller.emailController.text} has gone to admin for approval.",
                    style: Styles.black64748BW50016,
                    textAlign: TextAlign.center,
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
