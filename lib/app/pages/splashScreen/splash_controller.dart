import 'dart:async';

import 'package:get/get.dart';
import 'package:Ga_Gold/app/app.dart';
import 'package:Ga_Gold/app/navigators/navigators.dart';
import 'package:Ga_Gold/domain/domain.dart';

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
      // final result =
      //     Get.find<Repository>().getStringValue(LocalKeys.authToken).isEmpty;
      // if (result) {
      //   RouteManagement.goToLoginView();
      // } else {
      //
      // }
    });
    update();
  }
}
