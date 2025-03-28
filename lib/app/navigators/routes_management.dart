// coverage:ignore-file

import 'package:Ga_Gold/app/navigators/navigators.dart';
import 'package:get/get.dart';

/// A chunk of routes taken in the application.
///
/// Will be ignored for test since all are static values and would not change.
abstract class RouteManagement {
  static void goToLoginView() => Get.offAllNamed<void>(Routes.loginScreen);
  static void goToForgotView() => Get.toNamed<void>(Routes.forgotScreen);
  static void goToSignupView() => Get.toNamed<void>(Routes.signUpScreen);
  static void goToHomeView() => Get.toNamed<void>(Routes.homeScreen);
  static void goToMobileVerificationView() =>
      Get.toNamed<void>(Routes.numberVerifyScreen);
  static void goToBottomBarView() =>
      Get.offAllNamed<void>(Routes.bottomBarScreen);
  static void goToOrderScreen() => Get.toNamed<void>(Routes.orderScreen);
  static void goToOrderDetalisScreen(String orderId) =>
      Get.toNamed<void>(Routes.orderDetalisScreen, arguments: orderId);
  static void goToBagDetailScreen(String bugId) =>
      Get.toNamed<void>(Routes.bagDetailScreen, arguments: bugId);
  static void goToRepairScreen() => Get.toNamed<void>(Routes.repairScreen);
  static void goToRepairDetailsScreen() =>
      Get.toNamed<void>(Routes.repairDetailsScreen);
  static void goToRepairOrderHistoryScreen() =>
      Get.toNamed<void>(Routes.repairOrderHistoryScreen);
  static void goToRepairOrderDetalisScreen(String id) =>
      Get.toNamed<void>(Routes.repairOrderDetalisScreen, arguments: id);
  static void goToSampleOrderScreen() =>
      Get.toNamed<void>(Routes.sampleOrderScreen);
  static void goToSampleOrderDetailsScreen(String id) =>
      Get.toNamed<void>(Routes.sampleOrderDetailsScreen, arguments: id);
  static void goToSampleOrderHistoryScreen() =>
      Get.toNamed<void>(Routes.sampleOrderHistoryScreen);
  static void goToShowFullScareenImage(String image, String type) =>
      Get.toNamed<void>(Routes.showFullScareenImage, arguments: [image, type]);
  static void goToWishlistScreen() => Get.toNamed<void>(Routes.wishlistScreen);
  static void goToViewAllProductScreen(
          String type, String categories, String categoriesName) =>
      Get.toNamed<void>(Routes.viewAllProductScreen,
          arguments: [type, categories, categoriesName]);
  static void goToSearchScreen() =>
      Get.toNamed<void>(Routes.searchProductScreen);
  static void goToBankDetailScreen() =>
      Get.toNamed<void>(Routes.bankDetailScreen);
  static void goToContactUsScreen() =>
      Get.toNamed<void>(Routes.contactUsScreen);
  static void goToShoppingCartScreen(bool isBack) =>
      Get.toNamed<void>(Routes.shoppingCartScreen, arguments: isBack);
  static void goToInAppUpdateScreen(String appUrl) =>
      Get.offAllNamed<void>(Routes.inAppUpdateScreen, arguments: appUrl);
  static void goToOneOrderDetailScreen(String id) =>
      Get.offAllNamed<void>(Routes.oneOrderDetailScreen, arguments: id);
  static void goToVerifyIdentityScreen() =>
      Get.offAllNamed<void>(Routes.verifyIdentityScreen);
}
