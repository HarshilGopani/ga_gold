import 'package:flutter/material.dart';
import 'package:Ga_Gold/app/navigators/navigators.dart';
import 'package:Ga_Gold/app/pages/pages.dart';
import 'package:Ga_Gold/app/theme/theme.dart';
import 'package:Ga_Gold/app/utils/utils.dart';
import 'package:Ga_Gold/app/widgets/custom_button.dart';
import 'package:get/get.dart';

class MobileNumberVerification extends StatelessWidget {
  const MobileNumberVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => Scaffold(
        backgroundColor: ColorsValue.primaryColor,
        body: Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: CustomButton(
              text: "Get Started",
              onTap: () {
                RouteManagement.goToBottomBarView();
              },
              height: 50,
              backgroundColor: Colors.blueAccent,
              radius: BorderRadius.circular(10),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset(AssetConstants.appLogo)),
                Dimens.boxHeight20,
                Center(
                  child: Image.asset(
                    AssetConstants.mobileVarificationImage,
                  ),
                ),
                SizedBox(
                  height: Get.height * .2,
                ),
                Text(
                  "Verify Your Identity",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                Dimens.boxHeight8,
                Text(
                  "Your mobile number +91 ******3515 has gone to admin for approval.",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
