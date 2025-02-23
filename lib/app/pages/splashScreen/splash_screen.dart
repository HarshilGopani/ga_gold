import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ga_gold/app/app.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (context) {
        return Scaffold(
          backgroundColor: ColorsValue.primaryColor,
          body: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Image.asset(
                  AssetConstants.appLogo,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
