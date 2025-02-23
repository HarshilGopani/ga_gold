import 'package:ga_gold/app/app.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UploadWidgets extends StatelessWidget {
  final String txt;
  final String? svgPicture;
  Color bgColor;
  double height;
  GestureTapCallback onTap;
  UploadWidgets(
      {super.key,
      required this.txt,
      required this.height,
      required this.onTap,
      required this.bgColor,
      this.svgPicture});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(Dimens.five)),
      child: InkWell(
        onTap: onTap,
        child: DottedBorder(
          color: ColorsValue.appColor,
          radius: Radius.circular(Dimens.five),
          borderType: BorderType.RRect,
          strokeWidth: Dimens.two,
          dashPattern: [
            Dimens.five,
          ],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(svgPicture ?? ""),
              Dimens.boxWidth10,
              Center(
                child: Text(
                  txt,
                  style: Styles.txtFieldColorPoppinsW90016,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
