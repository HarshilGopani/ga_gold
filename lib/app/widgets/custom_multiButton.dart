import 'package:flutter/material.dart';
import 'package:ga_gold/app/app.dart';

class CustomBottomButton extends StatelessWidget {
  String? firstbtnText, secondbtnTxt;
  VoidCallback? firstOnPressed, secondOnPressed;
  TextStyle? firstStyle, secondStyle;
  Color? bordercolor;
  Color? buttoncolor;
  Color? secondbtnColor;
  bool? ispadding = false;
  bool? isspace = false;
  double? height;

  CustomBottomButton({
    super.key,
    required this.firstbtnText,
    required this.secondbtnTxt,
    required this.firstOnPressed,
    required this.secondOnPressed,
    this.buttoncolor,
    this.secondbtnColor,
    this.bordercolor,
    this.firstStyle,
    this.secondStyle,
    this.ispadding,
    this.isspace,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: firstOnPressed,
            child: Container(
              alignment: Alignment.center,
              height: Dimens.fourtyEight,
              decoration: BoxDecoration(
                color: buttoncolor ?? ColorsValue.lightAppColor,
                borderRadius: BorderRadius.circular(
                  Dimens.sixteen,
                ),
              ),
              child: Text(
                firstbtnText ?? "",
                style: firstStyle ?? Styles.appColorW70018,
              ),
            ),
          ),
        ),
        isspace == true ? Dimens.box0 : Dimens.boxWidth10,
        Expanded(
          child: InkWell(
            onTap: secondOnPressed,
            child: Container(
              alignment: Alignment.center,
              height: Dimens.fourtyEight,
              decoration: BoxDecoration(
                color: ColorsValue.appColor,
                borderRadius: BorderRadius.circular(
                  Dimens.sixteen,
                ),
              ),
              child: Text(
                secondbtnTxt ?? "",
                style: secondStyle ?? Styles.whiteColorW70018,
              ),
            ),
          ),
        )
      ],
    );
  }
}
