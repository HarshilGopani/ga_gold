import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ga_final/app/app.dart';

class UploadCardButton extends StatelessWidget {
  final String title;
  final LoginController loginController;

  const UploadCardButton(
      {super.key, required this.title, required this.loginController});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          loginController.selectImage(context, true);
        },
        child: DottedBorder(
          radius: Radius.circular(Dimens.ten),
          color: ColorsValue.color64748,
          child: Container(
            decoration: BoxDecoration(
              color: ColorsValue.transparent,
              borderRadius: BorderRadius.circular(Dimens.twelve),
            ),
            child: Padding(
              padding: EdgeInsets.all(Dimens.twelve),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AssetConstants.downloadIcon),
                  Dimens.boxHeight5,
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Styles.color6474814500,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
