import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Ga_Gold/app/app.dart';

// ignore: must_be_immutable
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({
    super.key,
    required this.onTapBack,
    required this.title,
    this.isTitle = true,
    this.isVisible = true,
    this.isBottomVisible = true,
  });

  void Function()? onTapBack;
  String title;
  bool isTitle;
  bool isVisible;
  bool isBottomVisible;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsValue.whiteColor,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: Visibility(
        visible: isVisible,
        child: Padding(
          padding: Dimens.edgeInsetsLeft20,
          child: GestureDetector(
            onTap: onTapBack,
            child: SvgPicture.asset(
              AssetConstants.ic_back_arrow,
            ),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Container(
          color: isBottomVisible ? ColorsValue.lightE2E8F0 : ColorsValue.transparent,
          // Change this to your preferred border color
          height: 1.0,
        ),
      ),
      title: Visibility(
        visible: isTitle,
        child: Text(
          title,
          style: Styles.color212121W80018,
        ),
      ),
    );
  }

  static final _appBar = AppBar();

  @override
  Size get preferredSize => _appBar.preferredSize;
}
