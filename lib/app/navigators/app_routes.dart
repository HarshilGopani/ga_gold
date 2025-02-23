part of 'app_pages.dart';

abstract class Routes {
  static const splashScreen = _Paths.splashScreen;
  static const loginScreen = _Paths.loginScreen;
  static const forgotPassScreen = _Paths.forgotPassScreen;
  static const signupScreen = _Paths.signupScreen;
  static const mobileNumberVerificationScreen =
      _Paths.mobileNumberVerificationScreen;
}

abstract class _Paths {
  static const splashScreen = '/splashScreen';
  static const loginScreen = '/loginScreen';
  static const forgotPassScreen = '/forgotPassScreen';
  static const signupScreen = '/signupScreen';
  static const mobileNumberVerificationScreen =
      '/MobileNumberVerificationScreen';
}
