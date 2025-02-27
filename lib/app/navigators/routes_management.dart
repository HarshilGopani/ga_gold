import 'package:get/get.dart';

import 'app_pages.dart';

abstract class RouteManagement {
  static void goToLoginScreen() => Get.offAllNamed<void>(Routes.loginScreen);
  static void goToSignupView() => Get.toNamed<void>(Routes.signupScreen);
  static void goToForgotView() => Get.toNamed<void>(Routes.forgotPassScreen);
  static void goToMobileVerificationView() =>
      Get.toNamed<void>(Routes.mobileNumberVerificationScreen);
  static void goToHomeView() => Get.toNamed<void>(Routes.homeScreen);
  static void goToBottomBarView() =>
      Get.offAllNamed<void>(Routes.bottomBarScreen);
      static void goToShoppingCartScreen(bool isBack) =>
      Get.toNamed<void>(Routes.shoppingCartScreen, arguments: isBack);
      static void goToShowFullScareenImage(String image, String type) =>
      Get.toNamed<void>(Routes.showFullScareenImage, arguments: [image, type]);
  static void goToWishlistScreen() => Get.toNamed<void>(Routes.wishlistScreen);
static void goToSampleOrderHistoryScreen() =>
      Get.toNamed<void>(Routes.sampleOrderHistoryScreen);
      static void goToRepairOrderHistoryScreen() =>
      Get.toNamed<void>(Routes.repairOrderHistoryScreen);
  static void goToOrderScreen() => Get.toNamed<void>(Routes.orderScreen);
  static void goToOrderDetailScreen() => Get.toNamed<void>(Routes.orderDetailScreen);

}
