// coverage:ignore-file
import 'package:flutter/material.dart';

/// A list of custom color used in the application.
///
/// Will be ignored for test since all are static values and would not change.
abstract class ColorsValue {
  /// Colors
  static Color primaryColor = const Color(
    // primaryColorHex,
    whiteColorHex,
  );
  static Color lightPrimaryColor = const Color(lightPrimary).withOpacity(.1);

  static Color secondaryColor = Color(
    secondaryColorHex,
  );
  static Color instagramAddIconsColor = const Color(
    instagramAddIconsColorHex,
  );
  static Color bottomSheetLightBackground = const Color(
    bottomSheetLightBackgroundHex,
  );

  static const Color blackColor = Color(
    blackColorHex,
  );
  static const Color lightGreyCancelButtonColor = Color(
    greyColorHex,
  );
  static const Color hookupHeaderBlackColor = Color(
    hookupHeaderBlackColorHex,
  );
  static const Color hookupHeaderGreyColor = Color(
    hookupHeaderGreyColorHex,
  );

  static const Color whiteColor = Color(
    whiteColorHex,
  );

  static const Color blueColor = Color(
    blueColorHex,
  );

  static const Color skyBlueColor = Color(
    skyBlueColorHex,
  );

  static const Color greyColor = Color(
    greyColorHex,
  );

  static const Color greyDividerColor = Color(lightGreyDividerColorHex);

  static const Color lightGreyTextColor = Color(lightGreyTextColorHex);

  static const Color transparent = Colors.transparent;

  // ============================================

  /// Non-common Colors
  ///
  static const Color facebookButtonColor = Color(
    facebookButtonColorHex,
  );

  static const Color iconColor = Color(
    iconColorHex,
  );

  static const Color greyLightColor = Color(
    greyLightColorHex,
  );

  static const Color purpleColor = Color(
    purpleColorHex,
  );

  static const Color lightGreyColorWithOpacity35 = Color(
    lightGreyColorWithOpacityHex35,
  );

  static const Color lightGreyColor = Color(
    lightGreyColorHex,
  );

  static const Color heavyGreyColor = Color(
    heavyGreyColorHex,
  );

  static const Color lightGreyColorWithOpacity50 = Color(
    lightGreyColorWithOpacityHex50,
  );

  static const Color lightRedColor = Color(
    lightRedColorHex,
  );

  static const Color blackColorWithOpacity59 = Color(
    blackColorHexWithOpacity59,
  );

  static const Color primaryColorWithOpacity = Color(
    primaryColorHexWithOpacity,
  );

  static const Color textFieldColor = Color(
    textFieldColorHex,
  );

  static const Color subTitleColor = Color(
    subTitlecolorHex,
  );

  static const Color originalGreyColor = Color(
    originalGreyColorHex,
  );

  static const Color textfieldHintColor = Color(
    textfieldHintColorHex,
  );

  static const Color bottomNavBgColor = Color(
    bottomNavBgColorHex,
  );

  static const Color blueMediumColor = Color(
    blueMediumColorHex,
  );

  static const Color blueDarkColor = Color(
    darkBlueColorHex,
  );

  static const Color lightBlueColor = Color(
    lightBlueColorHex,
  );

  static const Color lightBlueishColor = Color(
    lightBlueishColorHex,
  );

  static const Color lightGreenColor = Color(
    lightGreenColorHex,
  );

  static const Color yellowColor = Color(
    yellowColorHex,
  );

  static const Color greyLightColo = Color(greyLightColoHex);

  static const Color loginPlaceholderFontColor = Color(
    loginPlaceholderFontColorHex,
  );

  static const Color pinkColor = Color(
    pinkColorHex,
  );

  static const Color greyBorderColor = Color(
    greyBorderColorHex,
  );

  static const Color shadowColor = Color(
    shadowColorHex,
  );

  static const Color checkBoxColor = Color(
    checkBoxColorHex,
  );

  static const textFieldBorderColor = Color(
    textFieldBorderColorHex,
  );

  static const greySvgColor = Color(
    greySvgColorHex,
  );

  static const tabBarUnselectedColor = Color(
    tabBarUnselectedColorHex,
  );

  static const reelsGiftButtonBlackColor = Color(
    reelsGiftButtonBlackColorHex,
  );

  static const reelsGiftButtonInnerBorderColor = Color(
    reelsGiftButtonInnerBorderColorHex,
  );

  static const dialogDividerColor = Color(
    dialogDividerColorHex,
  );

  static const reddishOrangeColor = Color(
    reddishOrangeColorHex,
  );

  /// tirth kevadiya
  static const textcolor = Color(0xff13E1B0);
  static const redeemcode = Color(0xffC4FBEE);
  static const yelloshade = Color(0xffFABA15);

  static const greyColor8888 = Color(greyColor8888Hex);

  static Color F3F4F6Color = const Color(0xFFF3F4F6);
  static const greyColorEEEE = Color(greyColorEEEEHex);
  static Color lightAppColor = const Color(0xFFE7E7FC);
  static Color color64748 = const Color(0xFF64748B);
  static const greyColor4444 = Color(greyColor4444Hex);
  static const giftBackgroundColor = Color(giftBackgroundColorHex);
  static const greyColor9195A8 = Color(greyColor9195A8Hex);

  // ===========================================================================

  /// Hex Values
  ///
  static const int primaryColorHex = 0xffFFF8F1;
  static int secondaryColorHex = 0xff9BA0A8;
  static const int blackColorHex = 0xff000000;
  static const int greyColorHex = 0xFFF8F8F8;
  static const int hookupHeaderBlackColorHex = 0xFF0A0A0A;
  static const int hookupHeaderGreyColorHex = 0xFFAAAAAA;
  static const int whiteColorHex = 0xffffffff;
  static const int blueColorHex = 0xff2196f3;
  static const int darkBlueColorHex = 0xff1B53F4;
  static const int skyBlueColorHex = 0xff63c0df;
  static const int blueMediumColorHex = 0xffd9e5f6;
  static const int lightBlueColorHex = 0xffd1ddfd;
  static const int lightGreenColorHex = 0xff00D215;
  static const int yellowColorHex = 0xfffedf5c;
  static const int lightBlackColorHex = 0xff040414;

  // ============================================

  /// Hex Values for Non-Common Colors
  ///
  static const int facebookButtonColorHex = 0xff3B5998;
  static const int iconColorHex = 0xff606060;
  static const int greyLightColorHex = 0xff1C1C1C;
  static const int purpleColorHex = 0xffB000F0;
  static const int lightGreyColorWithOpacityHex35 = 0x59C9CCD1;
  static const int lightGreyColorHex = 0xffC9CCD1;
  static const int heavyGreyColorHex = 0xff666666;
  static const int lightGreyColorWithOpacityHex50 = 0x80C9CCD1;
  static const int lightRedColorHex = 0xffFF4A49;
  static const int blackColorHexWithOpacity59 = 0x59000000;
  static const int primaryColorHexWithOpacity = 0x596730EC;
  static const int textFieldColorHex = 0xffF1F2F6;
  static const int subTitlecolorHex = 0xfe666666;
  static const int originalGreyColorHex = 0xff535353;
  static const int textfieldHintColorHex = 0xffBFBFBF;
  static const int bottomNavBgColorHex = 0xff171717;
  static const int loginPlaceholderFontColorHex = 0xffD4D5D7;
  static const int lightGreyDividerColorHex = 0xffF6F6F6;
  static const int lightGreyTextColorHex = 0xff808080;
  static const int pinkColorHex = 0xffF31B82;
  static const int greyBorderColorHex = 0xffF2F2F2;
  static const int greyLightColoHex = 0xffCFCFCF;
  static const int redColorDarkHex = 0xffEB5757;
  static const int lightBlueishColorHex = 0xffEFF3FB;
  static const int shadowColorHex = 0xffDDE3F8;
  static const int checkBoxColorHex = 0xffD4D7D9;
  static const int lightPrimary = 0xffEA6F00;
  static const int bottomSheetLightBackgroundHex = 0xffFDF1E6;
  static const int instagramAddIconsColorHex = 0xffCECECE;
  static const int textFieldBorderColorHex = 0xffDDDDDD;
  static const int greySvgColorHex = 0xff9CA4B7;
  static const int tabBarUnselectedColorHex = 0xffCC9C9C9;
  static const int reelsGiftButtonBlackColorHex = 0xff302222;
  static const int reelsGiftButtonInnerBorderColorHex = 0xffFBA23B;
  static const int dialogDividerColorHex = 0xffE1E1E1;
  static const int greyColor8888Hex = 0xff888888;
  static const int greyColorEEEEHex = 0xffEEEEEE;
  static const int greyColor4444Hex = 0xff444444;
  static const int giftBackgroundColorHex = 0xffE2E2E2;
  static const int greyColor9195A8Hex = 0xff9195A8;
  static const int reddishOrangeColorHex = 0x1AFF4C00;

  /// Tirth kevadiya
  // static const lightYellow = Color(0xffE7AC2D);
  static const lightYellow = Color(0xff286AB0); //color286AB0

  static const textfildBorder = Color(0xffE2E8F0);
  static const redColor = Color(0xffcf000f);
  static const color4E4B66 = Color(0xff4E4B66);
  static const color94A3B8 = Color(0xFF94A3B8);
  static const color212121 = Color(0xff212121);
  static const colorEEEAEA = Color(0xffEEEAEA);
  static const colorF8FAFC = Color(0xffF8FAFC);

  static const color9C9C9C = Color(0xff9C9C9C);
  static const greyAAAAAA = Color(0xffAAAAAA);
  static const colorF3F4F6 = Color(0xffF3F4F6);
  static const color2E363F = Color(0xff2E363F);
  static const color544B6C = Color(0xff544B6C);

  static const color010101 = Color(0xff010101);
  static const colorEDC97D = Color(0xffEDC97D);
  static const buttomColor = Color(0xff286AB0);
  static const colorFBF7F3 = Color(0xffFBF7F3);
  static const colorDFDFDF = Color(0xffDFDFDF);
  static const colorD9D9D9 = Color(0xffD9D9D9);
  static const blackEEEAEA = Color(0xffEEEAEA);
  static const greyD9D9D9 = Color(0xffD9D9D9);
  static const greyF4F4F5 = Color(0xffF4F4F5);
  static Color grey94A3B8 = Color(0xff94A3B8);
  static const black221 = Color(0xff222221);
  static const colorA7A7A7 = Color(0xffA7A7A7);
  static const appBg = Color(0xffFFF8F1);
  static const appColor = Color(0xffE7AC2D);
  static const colorC7D1DD = Color(0xffC7D1DD);
  static const black333 = Color(0xff333333);
  static const black343434 = Color(0xff343434);
  static const black626262 = Color(0xff626262);
  static const txtBlackColor = Color(0xFF1E293B);
  static Color lightCBD5E1 = const Color(0xFFCBD5E1);
  static Color lightE2E8F0 = const Color(0xFFE2E8F0);
  static Color black64748B = const Color(0xFF64748B);
  static Color colorEBF1F8 = const Color(0xFFEBF1F8);
  
  static Color lightF3F4F6 = const Color(0xFFF3F4F6);
  static Color black010101 = const Color(0xFF010101);
  static Color greyAAA = const Color(0xFFAAAAAA);
  static Color colorFFA500 = const Color(0xFFFFA500);
  static Color appColorLight = const Color(0xFFFFEAD4);
  static Color grey9DB2CE = const Color(0xFF9DB2CE);
  static Color color475569 = const Color(0xFF475569);
  static Color lightccc = const Color.fromARGB(255, 71, 71, 71);
  static Color color334155 = const Color(0xFF334155);
  static Color colorD80032 = const Color(0xFFD80032);

}
