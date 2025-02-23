import 'package:flutter/material.dart';
import 'package:ga_gold/app/app.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final BorderRadiusGeometry? radius;
  final Function()? onTap;
  final TextStyle? style;
  final BoxBorder? side;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.height,
    this.width,
    this.backgroundColor,
    this.radius,
    this.style,
    this.side,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor ?? ColorsValue.buttomColor,
          borderRadius: radius ?? BorderRadius.circular(Dimens.ten),
          border: side,
        ),
        child: Center(
          child: Text(
            text,
            style: style ??
                TextStyle(
                    color: ColorsValue.whiteColor,
                    fontWeight: FontWeight.w800,
                    fontSize: Dimens.fourteen),
          ),
        ),
      ),
    );
  }
}
