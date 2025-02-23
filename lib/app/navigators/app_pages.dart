import 'package:ga_gold/app/pages/authScreen/screens/screen.dart';
import 'package:get/get.dart';
import 'package:ga_gold/app/pages/pages.dart';

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
  ];
}
