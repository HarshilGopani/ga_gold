import 'package:flutter/material.dart';
import 'package:ga_gold/app/app.dart';
import 'package:get/get.dart';

class MobileNumberVerification extends StatelessWidget {
  const MobileNumberVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) => Scaffold(
        backgroundColor: ColorsValue.primaryColor,
        body: Scaffold(
          bottomNavigationBar: Padding(
            padding: Dimens.edgeInsets20_30,
            child: CustomButton(
              text: "get_started".tr,
              onTap: () {
                RouteManagement.goToBottomBarView();
              },
              height: Dimens.fifty,
              backgroundColor: ColorsValue.blueColor,
              radius: BorderRadius.circular(10),
              style: TextStyle(
                  color: ColorsValue.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          body: Padding(
            padding: Dimens.edgeInsets16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset(AssetConstants.appLogo)),
                Dimens.boxHeight20,
                Center(
                  child: Image.asset(
                    AssetConstants.mobileVarificationImage,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: Get.height * .2,
                ),
                Text(
                  "verify_your_identity".tr,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                Dimens.boxHeight8,
                Text(
                  "your_mobile_number_approval".tr,
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
