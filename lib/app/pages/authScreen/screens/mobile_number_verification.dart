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
          bottomNavigationBar: CustomButton(
            text: "Get Started",
            onTap: () {},
            height: 50,
            backgroundColor: Colors.blueAccent,
            radius: BorderRadius.circular(30),
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Center(child: Image.asset(AssetConstants.appLogo)),
                Dimens.boxHeight16,
                Image.asset(
                  AssetConstants.mobileVarificationImage,
                ),
                Text(
                  "Verify Your Identity",
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
