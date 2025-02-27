//coverage:ignore-file

import 'package:flutter/material.dart';
import 'package:ga_gold/app/app.dart';
import 'package:google_fonts/google_fonts.dart';

/// A chunk of styles used in the application.
/// Will be ignored for test since all are static values and would not change.
abstract class Styles {
  static TextStyle appColormontserratW70030 = GoogleFonts.montserrat(
    color: ColorsValue.appColor,
    fontSize: Dimens.thirty,
    fontWeight: FontWeight.w700,
  );

  static TextStyle blackBold12 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twelve,
  );
  static TextStyle black50014 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.fourteen,
  );
  static TextStyle grey94A3B860012 = GoogleFonts.montserrat(
    color: ColorsValue.grey94A3B8,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.twelve,
  );
  static TextStyle colorFBF7F350010 = GoogleFonts.montserrat(
    color: ColorsValue.colorFBF7F3,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.ten,
  );
  static TextStyle black60012 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.twelve,
  );
  static TextStyle blackW60014 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.fourteen,
  );
  static TextStyle whiteColorW60012 = GoogleFonts.montserrat(
    color: ColorsValue.whiteColor,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w600,
  );
  static TextStyle black60016 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.sixteen,
  );
  static TextStyle appColormontserratW70016 = GoogleFonts.montserrat(
    color: ColorsValue.appColor,
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtFieldColormontserratW90016 = GoogleFonts.montserrat(
    color: ColorsValue.txtFieldColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtFieldColormontserratW40016 = GoogleFonts.montserrat(
    color: ColorsValue.txtFieldColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtFieldColormontserratW40014 = GoogleFonts.montserrat(
    color: ColorsValue.txtFieldColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w400,
  );

  static TextStyle greyColormontserratW40016 = GoogleFonts.montserrat(
    color: ColorsValue.greyColor,
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtFieldColormontserratW50018 = GoogleFonts.montserrat(
    color: ColorsValue.txtFieldColor,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.w500,
  );

  static TextStyle blackColormontserratW80020 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontSize: Dimens.twenty,
    fontWeight: FontWeight.w800,
  );

  static TextStyle blackColormontserratW60014 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w600,
  );

  static TextStyle redColormontserrat50014 = GoogleFonts.montserrat(
    color: ColorsValue.redColor,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.fourteen,
  );

  static TextStyle blackColormontserratW50014 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w500,
  );

  static TextStyle blackColorLineW70014 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  );

  static TextStyle color6474814500 = GoogleFonts.montserrat(
    color: ColorsValue.color64748,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w500,
  );

  static TextStyle whiteColormontserratW70018 = GoogleFonts.montserrat(
    color: ColorsValue.whiteColor,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.w700,
  );

  static TextStyle whiteColormontserratW70016 = GoogleFonts.montserrat(
    color: ColorsValue.whiteColor,
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w700,
  );

  static TextStyle appColorW90018 = GoogleFonts.montserrat(
    color: ColorsValue.appColor,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.w900,
  );

  static TextStyle appColorW50012 = GoogleFonts.montserrat(
    color: ColorsValue.appColor,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w500,
  );
  static TextStyle blackw60012 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.twelve,
  );
  static TextStyle appColorW60016 = GoogleFonts.montserrat(
    color: ColorsValue.appColor,
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w600,
  );

  static TextStyle appColorW60018 = GoogleFonts.montserrat(
    color: ColorsValue.appColor,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.w600,
  );
  static TextStyle titleColorW60018 = GoogleFonts.montserrat(
    color: ColorsValue.titleColor,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.w600,
  );

  static TextStyle grey939393W60012 = GoogleFonts.montserrat(
    color: ColorsValue.grey939393,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w600,
  );

  static TextStyle grey939393W60014 = GoogleFonts.montserrat(
    color: ColorsValue.grey939393,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w600,
  );

  static TextStyle appColorW90020 = GoogleFonts.montserrat(
    color: ColorsValue.appColor,
    fontSize: Dimens.twenty,
    fontWeight: FontWeight.w900,
  );

  static TextStyle txtFieldColorW90016 = GoogleFonts.montserrat(
    color: ColorsValue.txtFieldColor,
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w900,
  );

  static TextStyle appColorW70018 = GoogleFonts.montserrat(
    color: ColorsValue.appColor,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.w700,
  );

  static TextStyle appColorW70016 = GoogleFonts.montserrat(
    color: ColorsValue.appColor,
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w700,
  );

  static TextStyle appColorW70014 = GoogleFonts.montserrat(
    color: ColorsValue.appColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
  );

  static TextStyle appColorW70030 = GoogleFonts.montserrat(
    color: ColorsValue.appColor,
    fontSize: Dimens.thirty,
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtFieldColorW50016 = GoogleFonts.montserrat(
    color: ColorsValue.txtFieldColor,
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtFieldColorW60012 = GoogleFonts.montserrat(
    color: ColorsValue.txtFieldColor,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtFieldColorW60014 = GoogleFonts.montserrat(
    color: ColorsValue.txtFieldColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtFieldColorW50014 = GoogleFonts.montserrat(
    color: ColorsValue.txtFieldColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtFieldColorW50012 = GoogleFonts.montserrat(
    color: ColorsValue.txtFieldColor,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtFieldColorW40014 = GoogleFonts.montserrat(
    color: ColorsValue.txtFieldColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtFieldColorW40028 = GoogleFonts.montserrat(
    color: ColorsValue.txtFieldColor,
    fontSize: Dimens.twentyEight,
    fontWeight: FontWeight.w400,
  );

  static TextStyle blackColorW60018 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.w600,
  );

  static TextStyle blackColorW60020 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontSize: Dimens.twenty,
    fontWeight: FontWeight.w600,
  );

  static TextStyle blackColorW60014 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w600,
  );

  static TextStyle blackColorW60016 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w600,
  );

  static TextStyle blackColorW60012 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w600,
  );

  static TextStyle blackColorW50018 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.w500,
  );

  static TextStyle blackColorW50014 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w500,
  );

  static TextStyle blackColorW50016 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w500,
  );

  static TextStyle blackColorW70014 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
  );

  static TextStyle blackColorW70016 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w700,
  );

  static TextStyle blackColorW70018 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.w700,
  );

  static TextStyle redColorW70012 = GoogleFonts.montserrat(
    color: ColorsValue.redColor,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w700,
  );

  static TextStyle whiteColorW70018 = GoogleFonts.montserrat(
    color: ColorsValue.whiteColor,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.w700,
  );

  static TextStyle whiteColorW70014 = GoogleFonts.montserrat(
    color: ColorsValue.whiteColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
  );

  static TextStyle orangeGuj60012 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.orange,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.twelve,
  );

  static TextStyle greenGuj60012 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.green,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.twelve,
  );

  static TextStyle redGuj60012 = GoogleFonts.notoSerifGujarati(
    color: ColorsValue.redColor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.twelve,
  );

  /// Dialog Text

  static TextStyle redColor50014 = GoogleFonts.montserrat(
    color: ColorsValue.redColor,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.fourteen,
  );

  static TextStyle redColor50012 = GoogleFonts.montserrat(
    color: ColorsValue.redColor,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.twelve,
  );

  static TextStyle redColor70016 = GoogleFonts.montserrat(
    color: ColorsValue.redColor,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.sixteen,
  );

  static TextStyle black12 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontSize: Dimens.twelve,
  );

  static TextStyle black50012 = GoogleFonts.montserrat(
    color: const Color(0xFF0A0A0A),
    fontWeight: FontWeight.w500,
    fontSize: Dimens.twelve,
  );

  static TextStyle lightYellow40012 = GoogleFonts.montserrat(
    color: ColorsValue.lightYellow,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.twelve,
  );

  static TextStyle primaryBold28 = GoogleFonts.montserrat(
    color: ColorsValue.lightYellow,
    fontSize: Dimens.twentyEight,
    fontWeight: FontWeight.w700,
  );

  static TextStyle black40016 = GoogleFonts.montserrat(
    color: const Color(0xFF0A0A0A),
    fontWeight: FontWeight.w400,
    fontSize: Dimens.fourteen,
  );

  static TextStyle color21212150014 = GoogleFonts.montserrat(
    color: ColorsValue.color212121,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.fourteen,
  );

  static TextStyle txtRedBold10 = GoogleFonts.montserrat(
    color: ColorsValue.redColor,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.ten,
  );

  static TextStyle txtRedW50010 = GoogleFonts.montserrat(
    color: ColorsValue.redColor,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.ten,
  );

  static TextStyle color94A3B8W70016 = GoogleFonts.montserrat(
    color: ColorsValue.color94A3B8,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static TextStyle color94A3B8W40010 = GoogleFonts.montserrat(
    color: ColorsValue.color94A3B8,
    fontWeight: FontWeight.w400,
    fontSize: 10,
  );

  static TextStyle color9C9C9C40016 = GoogleFonts.montserrat(
    color: ColorsValue.color9C9C9C,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static TextStyle color9C9C9C40010 = GoogleFonts.montserrat(
    color: ColorsValue.color9C9C9C,
    fontWeight: FontWeight.w400,
    fontSize: Dimens.ten,
  );

  static TextStyle txtRedBold12 = GoogleFonts.montserrat(
    color: ColorsValue.redColor,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.twelve,
  );

  static TextStyle redcolor50014 = GoogleFonts.montserrat(
    color: ColorsValue.redColor,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.fourteen,
  );

  static TextStyle txtWhite80018 = GoogleFonts.montserrat(
    color: ColorsValue.whiteColor,
    fontWeight: FontWeight.w800,
    fontSize: Dimens.eighteen,
  );

  static TextStyle greyAAA40014 = GoogleFonts.montserrat(
    color: ColorsValue.greyAAAAAA,
    fontWeight: FontWeight.w400,
    fontSize: Dimens.fourteen,
  );

  static TextStyle blackW80018 = GoogleFonts.montserrat(
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.w800,
    color: ColorsValue.blackColor,
  );

  static TextStyle whiteW70014 = GoogleFonts.montserrat(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
    color: ColorsValue.whiteColor,
  );

  static TextStyle color21212170014 = GoogleFonts.montserrat(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
    color: ColorsValue.color212121,
  );

  static TextStyle color21212160014 = GoogleFonts.montserrat(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w600,
    color: ColorsValue.color212121,
  );

  static TextStyle color21212160012 = GoogleFonts.montserrat(
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w600,
    color: ColorsValue.color212121,
  );

  static TextStyle whiteW70016 = GoogleFonts.montserrat(
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w700,
    color: ColorsValue.whiteColor,
  );

  static TextStyle whiteW60016 = GoogleFonts.montserrat(
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w600,
    color: ColorsValue.whiteColor,
  );
  static TextStyle lightcccW50010 = GoogleFonts.montserrat(
    fontSize: Dimens.ten,
    fontWeight: FontWeight.w600,
    color: ColorsValue.lightccc,
  );

  static TextStyle color212121W80018 = GoogleFonts.montserrat(
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.w800,
    color: ColorsValue.color212121,
  );

  static TextStyle color212121W70012 = GoogleFonts.montserrat(
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w700,
    color: ColorsValue.color212121,
  );

  static TextStyle color212121W50014 = GoogleFonts.montserrat(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w500,
    color: ColorsValue.color212121,
  );

  static TextStyle color212121W70024 = GoogleFonts.montserrat(
    fontSize: Dimens.twentyFour,
    fontWeight: FontWeight.w700,
    color: ColorsValue.color212121,
  );
  static TextStyle color212121W70020 = GoogleFonts.montserrat(
    fontSize: Dimens.twenty,
    fontWeight: FontWeight.w700,
    color: ColorsValue.color212121,
  );

  static TextStyle color212121W70010 = GoogleFonts.montserrat(
    fontSize: Dimens.ten,
    fontWeight: FontWeight.w700,
    color: ColorsValue.color212121,
  );

  static TextStyle color212121W90010 = GoogleFonts.montserrat(
    fontSize: Dimens.ten,
    fontWeight: FontWeight.w900,
    color: ColorsValue.color212121,
  );

  static TextStyle color212121W90012 = GoogleFonts.montserrat(
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w900,
    color: ColorsValue.color212121,
  );

  static TextStyle color9C9C9CW50010 = GoogleFonts.montserrat(
    fontSize: Dimens.ten,
    fontWeight: FontWeight.w500,
    color: ColorsValue.color9C9C9C,
  );

  static TextStyle appColor70010 = GoogleFonts.montserrat(
    fontSize: Dimens.ten,
    fontWeight: FontWeight.w700,
    color: ColorsValue.appColor,
  );

  static TextStyle appColor70012 = GoogleFonts.montserrat(
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w700,
    color: ColorsValue.appColor,
  );

  static TextStyle grey94A3B850014 = GoogleFonts.montserrat(
    color: ColorsValue.grey94A3B8,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.fourteen,
  );

  static TextStyle appColor70014 = GoogleFonts.montserrat(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
    color: ColorsValue.appColor,
  );

  static TextStyle colorA7A7A750016 = GoogleFonts.montserrat(
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w500,
    color: ColorsValue.colorA7A7A7,
  );

  static TextStyle colorA7A7A750010 = GoogleFonts.montserrat(
    fontSize: Dimens.ten,
    fontWeight: FontWeight.w500,
    color: ColorsValue.colorA7A7A7,
  );

  static TextStyle color6474860016 = GoogleFonts.montserrat(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w600,
    color: ColorsValue.color64748,
  );

  static TextStyle colorA7A7A780014 = GoogleFonts.montserrat(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w800,
    color: ColorsValue.colorA7A7A7,
  );

  static TextStyle colorA7A7A750012 = GoogleFonts.montserrat(
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w500,
    color: ColorsValue.colorA7A7A7,
  );

  static TextStyle colorA7A7A770012 = GoogleFonts.montserrat(
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w700,
    color: ColorsValue.colorA7A7A7,
  );

  static TextStyle whiteW80024 = GoogleFonts.montserrat(
    fontSize: Dimens.twentyFour,
    fontWeight: FontWeight.w800,
    color: ColorsValue.whiteColor,
  );

  static TextStyle whiteW80014 = GoogleFonts.montserrat(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w800,
    color: ColorsValue.whiteColor,
  );

  static TextStyle whiteW60012 = GoogleFonts.montserrat(
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w600,
    color: ColorsValue.whiteColor,
  );

  static TextStyle black221W70010 = GoogleFonts.montserrat(
    fontSize: Dimens.ten,
    fontWeight: FontWeight.w700,
    color: ColorsValue.black221,
  );

  static TextStyle black221W70018 = GoogleFonts.montserrat(
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.w700,
    color: ColorsValue.black221,
  );

  static TextStyle black626262W50012 = GoogleFonts.montserrat(
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w500,
    color: ColorsValue.black626262,
  );
}
