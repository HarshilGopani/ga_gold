import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ga_gold/app/app.dart';

// ignore: must_be_immutable
class AppbarWidgets extends StatelessWidget implements PreferredSizeWidget {
  AppbarWidgets({
    super.key,
    required this.onTapBack,
    required this.title,
    this.isVisible = true,
    this.isCenter = false,
    this.actions,
  });

  void Function()? onTapBack;
  String title;
  bool isVisible;
  bool isCenter;
  List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsValue.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            Dimens.twenty,
          ),
          bottomRight: Radius.circular(
            Dimens.twenty,
          ),
        ),
      ),
      elevation: Dimens.ten,
      centerTitle: isCenter ? true : false,
      automaticallyImplyLeading: false,
      leading: Visibility(
        visible: isVisible,
        child: Padding(
          padding: Dimens.edgeInsets15,
          child: InkWell(
            onTap: onTapBack,
            child: SvgPicture.asset(
              AssetConstants.ic_back,
            ),
          ),
        ),
      ),
      titleSpacing: Dimens.zero,
      title: Text(
        textAlign: TextAlign.center,
        title,
        style: Styles.appColorW90020,
      ),
      actions: actions,
    );
  }

  static final _appBar = AppBar();

  @override
  Size get preferredSize => AppbarWidgets._appBar.preferredSize;
}
