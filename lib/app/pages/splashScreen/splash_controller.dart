import 'dart:async';

import 'package:Ga_Gold/app/app.dart';
import 'package:Ga_Gold/app/navigators/navigators.dart';
import 'package:Ga_Gold/domain/domain.dart';
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
    final result = await Utility.checker.checkUpdate();
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
