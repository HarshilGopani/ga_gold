import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Ga_Gold/app/app.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => Scaffold(
        backgroundColor: ColorsValue.whiteColor,
        body: Center(
          child: Image.asset(
            AssetConstants.kirshina,
            height: double.infinity,
            width: double.infinity,
            repeat: ImageRepeat.repeat,
          ),
        ),
      ),
      // builder: (controller) => Scaffold(
      //   body: Center(
      //     child: Image.asset(
      //       AssetConstants.kirshina,
      //       height: double.infinity,
      //       width: double.infinity,
      //       repeat: ImageRepeat.repeat,
      //     ),
      //   ),
      // ),
    );
  }
}
