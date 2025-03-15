import 'dart:async';

import 'package:get/get.dart';
import 'package:ga_final/app/app.dart';
import 'package:ga_final/app/navigators/navigators.dart';
import 'package:ga_final/domain/domain.dart';

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
      // if (Platform.isAndroid) {
      //   if (result.currentVersion != result.newVersion) {
      //     appUrl = result.appURL ?? "";
      //     RouteManagement.goToInAppUpdateScreen(result.appURL ?? "");
      //   } else {
      //     final result = Get.find<Repository>()
      //         .getStringValue(LocalKeys.authToken)
      //         .isEmpty;
      //     if (result) {
      //       RouteManagement.goToLoginView();
      //     } else {
      //       RouteManagement.goToBottomBarView();
      //     }
      //   }
      // } else {
      final result =
          Get.find<Repository>().getStringValue(LocalKeys.authToken).isEmpty;
      if (result) {
        RouteManagement.goToLoginView();
      } else {
        RouteManagement.goToBottomBarView();
      }
      // }
    });
    update();
  }
}
