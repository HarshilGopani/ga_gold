import 'package:ga_gold/app/pages/authScreen/screens/screen.dart';
import 'package:get/get.dart';

import '../app.dart';

part 'app_routes.dart';

class AppPages {
  static var transitionDuration = const Duration(milliseconds: 300);

  static const initial = _Paths.splashScreen;
  static final pages = <GetPage>[
    GetPage<SplashScreen>(
      name: _Paths.splashScreen,
      transitionDuration: transitionDuration,
      page: SplashScreen.new,
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<LoginScreen>(
      name: _Paths.loginScreen,
      transitionDuration: transitionDuration,
      page: LoginScreen.new,
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<ForgetPasswordView>(
      name: _Paths.forgotPassScreen,
      transitionDuration: transitionDuration,
      page: ForgetPasswordView.new,
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<SignupScreen>(
      name: _Paths.signupScreen,
      transitionDuration: transitionDuration,
      page: SignupScreen.new,
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<MobileNumberVerification>(
      name: _Paths.mobileNumberVerificationScreen,
      transitionDuration: transitionDuration,
      page: MobileNumberVerification.new,
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<HomeScreen>(
      name: _Paths.homeScreen,
      transitionDuration: transitionDuration,
      page: HomeScreen.new,
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<BottomBarScreen>(
      name: _Paths.bottomBarScreen,
      transitionDuration: transitionDuration,
      page: BottomBarScreen.new,
      binding: BottomBarBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<ShoppingCartScreen>(
      name: _Paths.shoppingCartScreen,
      transitionDuration: transitionDuration,
      page: ShoppingCartScreen.new,
      binding: ShoppingCartBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<ShowFullScareenImage>(
      name: _Paths.showFullScareenImage,
      transitionDuration: transitionDuration,
      page: ShowFullScareenImage.new,
      binding: RepairBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<WishlistScreen>(
      name: _Paths.wishlistScreen,
      transitionDuration: transitionDuration,
      page: WishlistScreen.new,
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<SampleOrderHistoryScreen>(
      name: _Paths.sampleOrderHistoryScreen,
      transitionDuration: transitionDuration,
      page: SampleOrderHistoryScreen.new,
      binding: RepairBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<RepairOrderHistoryScreen>(
      name: _Paths.repairOrderHistoryScreen,
      transitionDuration: transitionDuration,
      page: RepairOrderHistoryScreen.new,
      binding: RepairBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<OrderScreen>(
      name: _Paths.orderScreen,
      transitionDuration: transitionDuration,
      page: OrderScreen.new,
      binding: OrderBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<OrderDetalisScreen>(
      name: _Paths.orderDetailScreen,
      transitionDuration: transitionDuration,
      page: OrderDetalisScreen.new,
      binding: OrderBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
