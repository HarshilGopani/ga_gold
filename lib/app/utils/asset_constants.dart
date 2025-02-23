// coverage:ignore-file

// ignore_for_file: constant_identifier_names

/// An asset constant class which will hold all the
/// assets path which are used in the application.
///
/// Will be ignored for test since all are static values and would not change.
abstract class AssetConstants {
  static const String appLogo = "assets/images/AppIcon.png";
  static const String ic_back = "assets/icons/ic_back.svg";
  static const String loginIcon = "assets/images/loginImage.png";
  static const String forgotMainView = 'assets/images/forgotPassword.png';
  static const String downloadIcon = 'assets/icons/downloadIcon.svg';
  static const String mobileVarificationImage =
      'assets/images/mobileVarification.png';
}
