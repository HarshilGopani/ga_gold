import 'package:get/get.dart';

import 'app_pages.dart';

abstract class RouteManagement {
  static void goToLoginScreen() => Get.offAllNamed<void>(Routes.loginScreen);
  static void goToSignupView() => Get.toNamed<void>(Routes.signupScreen);
  static void goToForgotView() => Get.toNamed<void>(Routes.forgotPassScreen);
  static void goToMobileVerificationView() =>
      Get.toNamed<void>(Routes.numberVerifyScreen);
  static void goToHomeView() => Get.toNamed<void>(Routes.homeScreen);
  static void goToBottomBarView() =>
      Get.toNamed<void>(Routes.bottomBarScreen);
      static void goToShoppingCartScreen(bool isBack) =>
      Get.toNamed<void>(Routes.shoppingCartScreen, arguments: isBack);
      static void goToShowFullScareenImage(String image, String type) =>
      Get.toNamed<void>(Routes.showFullScareenImage, arguments: [image, type]);
  static void goToWishlistScreen() => Get.toNamed<void>(Routes.wishlistScreen);
  static void goToOrderHistoryScreen() => Get.toNamed<void>(Routes.orderHistoryScreen);

}
