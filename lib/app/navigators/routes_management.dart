import 'package:get/get.dart';

import 'app_pages.dart';

abstract class RouteManagement {
  static void goToLoginScreen() => Get.offAllNamed<void>(Routes.loginScreen);
  static void goToSignupView() => Get.toNamed<void>(Routes.signupScreen);
  static void goToForgotView() => Get.toNamed<void>(Routes.forgotPassScreen);
  static void goToMobileVerificationView() =>
      Get.toNamed<void>(Routes.mobileNumberVerificationScreen);
}
