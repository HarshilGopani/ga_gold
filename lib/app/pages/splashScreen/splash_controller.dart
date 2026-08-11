import 'dart:async';

import 'package:ga_gold/app/app.dart';
import 'package:ga_gold/app/navigators/navigators.dart';
import 'package:ga_gold/domain/domain.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController(this.splashPresenter);

  final SplashPresenter splashPresenter;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  String? appUrl;

  void startTimer() async {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      RouteManagement.goToBottomBarView();

      if (Get.find<Repository>()
          .getStringValue(LocalKeys.authToken)
          .isNotEmpty) {
        RouteManagement.goToBottomBarView();
      } else {
        RouteManagement.goToLoginView();
      }
    });
    update();
  }
}
