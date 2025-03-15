//coverage:ignore-file

import 'package:flutter/material.dart';
import 'package:ga_final/app/app.dart';
import 'package:google_fonts/google_fonts.dart';

/// A chunk of styles used in the application.
/// Will be ignored for test since all are static values and would not change.
abstract class Styles {
  static String? fontFamily = globalVariable == 1 ? 'Product-Sans' : 'Avenir';

  static TextStyle blackBold12 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twelve,
  );

  static TextStyle black64748BW50016 = GoogleFonts.outfit(
    color: ColorsValue.black64748B,
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w500,
  );

  static TextStyle black64748BW50014 = GoogleFonts.outfit(
    color: ColorsValue.black64748B,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w500,
  );

  static TextStyle yellowW70010 = GoogleFonts.nunito(
    fontSize: Dimens.ten,
    fontWeight: FontWeight.w700,
    color: Colors.yellow,
  );

  static TextStyle redColor70016 = GoogleFonts.montserrat(
    color: ColorsValue.redColor,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.sixteen,
  );

  static TextStyle blackColorW50014 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w500,
  );


  static TextStyle orangeW70010 = GoogleFonts.nunito(
    fontSize: Dimens.ten,
    fontWeight: FontWeight.w700,
    color: Colors.orange,
  );

  static TextStyle color6474814500 = GoogleFonts.montserrat(
    color: ColorsValue.color64748,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w500,
  );

  static TextStyle color212121W70012 = GoogleFonts.montserrat(
    color: ColorsValue.color212121,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w700,
  );

  static TextStyle color475569W70012 = GoogleFonts.montserrat(
    color: ColorsValue.color475569,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w700,
  );

  static TextStyle redColorW70010 = GoogleFonts.nunito(
    fontSize: Dimens.ten,
    fontWeight: FontWeight.w700,
    color: Colors.red,
  );

  static TextStyle greenW70010 = GoogleFonts.nunito(
    fontSize: Dimens.ten,
    fontWeight: FontWeight.w700,
    color: Colors.green,
  );

  static TextStyle greenW70012 = GoogleFonts.nunito(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
    color: Colors.green,
  );

  static TextStyle colorFFA500W70012 = GoogleFonts.nunito(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
    color: ColorsValue.colorFFA500,
  );

  static TextStyle redColorGuj70010 = GoogleFonts.nunito(
    color: ColorsValue.redColor,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.fourteen,
  );

  static TextStyle colorFFA50070012 = GoogleFonts.nunito(
    color: ColorsValue.colorFFA500,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.fourteen,
  );

  static TextStyle black50014 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.fourteen,
  );

  static TextStyle color64748B50012 = GoogleFonts.montserrat(
    color: ColorsValue.color64748,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.twelve,
  );

  static TextStyle blackW60014 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.fourteen,
  );

  static TextStyle txtBlackColorW70018 = GoogleFonts.outfit(
    color: ColorsValue.txtBlackColor,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.w700,
  );

  static TextStyle appColorW50012 = GoogleFonts.outfit(
    color: ColorsValue.appColor,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtBlackColorW60014 = GoogleFonts.outfit(
    color: ColorsValue.txtBlackColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w600,
  );

  static TextStyle whiteColorW60012 = GoogleFonts.outfit(
    color: ColorsValue.whiteColor,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w600,
  );

  static TextStyle whiteColorW80016 = GoogleFonts.outfit(
    color: ColorsValue.whiteColor,
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w800,
  );

  static TextStyle txtBlackColorW60016 = GoogleFonts.outfit(
    color: ColorsValue.txtBlackColor,
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtBlackColorW70014 = GoogleFonts.outfit(
    color: ColorsValue.txtBlackColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtBlackColorW50014 = GoogleFonts.outfit(
    color: ColorsValue.txtBlackColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w500,
  );

  static TextStyle black010101W40014 = GoogleFonts.outfit(
    color: ColorsValue.black010101,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w400,
  );

  static TextStyle black60016 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.sixteen,
  );

  static TextStyle grey94A3B860012 = GoogleFonts.roboto(
    color: ColorsValue.grey94A3B8,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.twelve,
  );

  static TextStyle black60012 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.twelve,
  );

  static TextStyle black70014 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.fourteen,
  );

  static TextStyle color01010160018 = GoogleFonts.montserrat(
    color: ColorsValue.color010101,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.eighteen,
  );

  static TextStyle color01010170020 = GoogleFonts.montserrat(
    color: ColorsValue.color010101,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.twenty,
  );

  static TextStyle blackBold16 = GoogleFonts.montserrat(
    color: const Color(0xFF0A0A0A),
    fontWeight: FontWeight.bold,
    fontSize: Dimens.sixteen,
  );

  static TextStyle color64748W60010 = GoogleFonts.montserrat(
    color: ColorsValue.color64748,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.ten,
  );

  static TextStyle color64748W60012 = GoogleFonts.montserrat(
    color: ColorsValue.color64748,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.twelve,
  );

  static TextStyle black50012 = GoogleFonts.montserrat(
    color: const Color(0xFF0A0A0A),
    fontWeight: FontWeight.w500,
    fontSize: Dimens.twelve,
  );

  static TextStyle colorFBF7F350010 = GoogleFonts.montserrat(
    color: ColorsValue.colorFBF7F3,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.ten,
  );

  static TextStyle lightYellow40012 = GoogleFonts.montserrat(
    color: ColorsValue.lightYellow,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.twelve,
  );

  static TextStyle lightYellow70014 = GoogleFonts.montserrat(
    color: ColorsValue.lightYellow,
    fontWeight: FontWeight.w700,
    fontSize: Dimens.fourteen,
  );

  static TextStyle white14 = GoogleFonts.montserrat(
    color: ColorsValue.whiteColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle white23 = GoogleFonts.montserrat(
    color: ColorsValue.whiteColor,
    fontSize: Dimens.twentyThree,
  );

  static TextStyle black12 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontSize: Dimens.twelve,
  );

  static TextStyle blackw60012 = GoogleFonts.montserrat(
    color: ColorsValue.blackColor,
    fontWeight: FontWeight.w600,
    fontSize: Dimens.twelve,
  );

  static TextStyle primaryBold28 = GoogleFonts.montserrat(
    color: ColorsValue.lightYellow,
    fontSize: Dimens.twentyEight,
    fontWeight: FontWeight.w700,
  );

  static TextStyle primary50014 = GoogleFonts.montserrat(
    color: ColorsValue.lightYellow,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w500,
  );

  static TextStyle color4E4B6680014 = GoogleFonts.montserrat(
    color: ColorsValue.color4E4B66,
    fontWeight: FontWeight.w800,
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

  static TextStyle black40016 = GoogleFonts.montserrat(
    color: const Color(0xFF0A0A0A),
    fontWeight: FontWeight.w400,
    fontSize: Dimens.fourteen,
  );

  static TextStyle greyAAA40014 = GoogleFonts.montserrat(
    color: ColorsValue.greyAAAAAA,
    fontWeight: FontWeight.w400,
    fontSize: Dimens.fourteen,
  );

  static TextStyle blackW80018 = GoogleFonts.nunito(
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.w800,
    color: ColorsValue.blackColor,
  );

  static TextStyle whiteW70014 = GoogleFonts.nunito(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
    color: ColorsValue.whiteColor,
  );

  static TextStyle color21212170014 = GoogleFonts.nunito(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
    color: ColorsValue.color212121,
  );

  static TextStyle color21212160014 = GoogleFonts.nunito(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w600,
    color: ColorsValue.color212121,
  );

  static TextStyle color21212160012 = GoogleFonts.nunito(
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w600,
    color: ColorsValue.color212121,
  );

  static TextStyle whiteW70016 = GoogleFonts.nunito(
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w700,
    color: ColorsValue.whiteColor,
  );

  static TextStyle lightYellowW70016 = GoogleFonts.nunito(
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w700,
    color: ColorsValue.lightYellow,
  );



  static TextStyle whiteW60016 = GoogleFonts.nunito(
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w600,
    color: ColorsValue.whiteColor,
  );
  static TextStyle lightcccW50010 = GoogleFonts.nunito(
    fontSize: Dimens.ten,
    fontWeight: FontWeight.w600,
    color: ColorsValue.lightccc,
  );

  static TextStyle color212121W80018 = GoogleFonts.nunito(
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.w800,
    color: ColorsValue.color212121,
  );

  static TextStyle color212121W70014 = GoogleFonts.nunito(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
    color: ColorsValue.color212121,
  );

  static TextStyle color212121W50014 = GoogleFonts.nunito(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w500,
    color: ColorsValue.color212121,
  );

  static TextStyle color212121W70024 = GoogleFonts.nunito(
    fontSize: Dimens.twentyFour,
    fontWeight: FontWeight.w700,
    color: ColorsValue.color212121,
  );

  static TextStyle color212121W70010 = GoogleFonts.nunito(
    fontSize: Dimens.ten,
    fontWeight: FontWeight.w700,
    color: ColorsValue.color212121,
  );

  static TextStyle redW70014 = GoogleFonts.nunito(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
    color: ColorsValue.redColor,
  );

  static TextStyle color212121W90010 = GoogleFonts.nunito(
    fontSize: Dimens.ten,
    fontWeight: FontWeight.w900,
    color: ColorsValue.color212121,
  );

  static TextStyle color212121W90012 = GoogleFonts.nunito(
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w900,
    color: ColorsValue.color212121,
  );

  static TextStyle color544B6CW70010 = GoogleFonts.nunito(
    fontSize: Dimens.ten,
    fontWeight: FontWeight.w700,
    color: ColorsValue.color544B6C,
  );



  static TextStyle color9C9C9CW50012 = GoogleFonts.nunito(
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w500,
    color: ColorsValue.color9C9C9C,
  );

  static TextStyle appColor70010 = GoogleFonts.nunito(
    fontSize: Dimens.ten,
    fontWeight: FontWeight.w700,
    color: ColorsValue.appColor,
  );

  // static TextStyle appColor70014 = GoogleFonts.nunito(
  //   fontSize: Dimens.fourty,
  //   fontWeight: FontWeight.w700,
  //   color: ColorsValue.appColor,
  // );

  static TextStyle color47556970014 = GoogleFonts.nunito(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
    color: ColorsValue.color475569,
  );



  static TextStyle appColor70012 = GoogleFonts.nunito(
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w700,
    color: ColorsValue.appColor,
  );

  static TextStyle lightYello70012 = GoogleFonts.nunito(
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w700,
    color: ColorsValue.lightYellow,
  );

  static TextStyle grey94A3B850014 = GoogleFonts.roboto(
    color: ColorsValue.grey94A3B8,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.fourteen,
  );

  static TextStyle appColor70014 = GoogleFonts.nunito(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
    color: ColorsValue.lightYellow,
  );

  static TextStyle appColor70020 = GoogleFonts.nunito(
    fontSize: Dimens.twenty,
    fontWeight: FontWeight.w700,
    color: ColorsValue.appColor,
  );

  static TextStyle colorA7A7A750016 = GoogleFonts.nunito(
    fontSize: Dimens.sixteen,
    fontWeight: FontWeight.w500,
    color: ColorsValue.colorA7A7A7,
  );

  static TextStyle colorA7A7A750010 = GoogleFonts.nunito(
    fontSize: Dimens.ten,
    fontWeight: FontWeight.w500,
    color: ColorsValue.colorA7A7A7,
  );

  static TextStyle colorA7A7A780014 = GoogleFonts.nunito(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w800,
    color: ColorsValue.colorA7A7A7,
  );

  static TextStyle colorA7A7A750012 = GoogleFonts.nunito(
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w500,
    color: ColorsValue.colorA7A7A7,
  );

  static TextStyle colorA7A7A770012 = GoogleFonts.nunito(
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w700,
    color: ColorsValue.colorA7A7A7,
  );

  static TextStyle whiteW80024 = GoogleFonts.nunito(
    fontSize: Dimens.twentyFour,
    fontWeight: FontWeight.w800,
    color: ColorsValue.whiteColor,
  );

  static TextStyle whiteW80014 = GoogleFonts.nunito(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w800,
    color: ColorsValue.whiteColor,
  );

  static TextStyle color47556980014 = GoogleFonts.nunito(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w800,
    color: ColorsValue.color475569,
  );

  static TextStyle whiteW60012 = GoogleFonts.nunito(
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w600,
    color: ColorsValue.whiteColor,
  );

  static TextStyle color47556960012 = GoogleFonts.nunito(
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w600,
    color: ColorsValue.color475569,
  );

  static TextStyle color47556960014 = GoogleFonts.nunito(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
    color: ColorsValue.color475569,
  );
  

  static TextStyle black221W70010 = GoogleFonts.nunito(
    fontSize: Dimens.ten,
    fontWeight: FontWeight.w700,
    color: ColorsValue.black221,
  );

  static TextStyle black221W70018 = GoogleFonts.nunito(
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.w700,
    color: ColorsValue.black221,
  );

  static TextStyle black626262W50012 = GoogleFonts.nunito(
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w500,
    color: ColorsValue.black626262,
  );

  static TextStyle blackColorW50018 = GoogleFonts.nunito(
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.w500,
    color: ColorsValue.blackColor,
  );
}
