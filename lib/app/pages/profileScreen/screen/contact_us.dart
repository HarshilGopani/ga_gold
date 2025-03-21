import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Ga_Gold/app/app.dart';
import 'package:Ga_Gold/app/widgets/appbar_widgets.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) => Scaffold(
        backgroundColor: ColorsValue.appBg,
        appBar: AppBarWidget(
          onTapBack: () {
            Get.back();
          },
          title: "Cantact Us",
          isVisible: true,
        ),
        body: ListView(
          padding: Dimens.edgeInsets20,
          physics: ClampingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: Dimens.hundred,
                  width: Dimens.hundred,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Dimens.twenty,
                    ),
                    border: Border.all(
                      width: Dimens.one,
                      color: ColorsValue.appColor,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      Dimens.twenty,
                    ),
                    child: Image.asset(
                      AssetConstants.app_logo,
                      height: Dimens.hundred,
                      width: Dimens.hundred,
                    ),
                  ),
                ),
                Dimens.boxWidth30,
                Flexible(
                  child: Text(
                    "Ga Gold",
                    style: Styles.appColor70020,
                  ),
                ),
              ],
            ),
            Dimens.boxHeight30,
            containerWidget(
              AssetConstants.location,
              "Krishna Ornaments Kansara bazar.Near dr. Harshad udesiMandvi-kutchGujrat - india370465",
            ),
            Dimens.boxHeight20,
            containerWidget(
              AssetConstants.email,
              "info.sparkflows@gmail.com",
            ),
            Dimens.boxHeight20,
            containerWidget(
              AssetConstants.whatsapp,
              "+91 9825622596",
            ),
            Dimens.boxHeight20,
            containerWidget(
              AssetConstants.phone,
              "+91 9825622596",
            ),
            Dimens.boxHeight20,
          ],
        ),
      ),
    );
  }

  Widget containerWidget(String icon, String title) {
    return Container(
      padding: Dimens.edgeInsets12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Dimens.twenty,
        ),
        border: Border.all(
          width: Dimens.one,
          color: ColorsValue.appColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            height: Dimens.twentyFour,
            color: ColorsValue.appColor,
            width: Dimens.twentyFour,
          ),
          Dimens.boxHeight10,
          Text(
            title,
            style: Styles.appColor70014,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
