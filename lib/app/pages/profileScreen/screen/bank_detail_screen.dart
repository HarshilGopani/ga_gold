import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ga_final/app/app.dart';
import 'package:ga_final/app/widgets/appbar_widgets.dart';

class BankDetailScreen extends StatelessWidget {
  const BankDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(initState: (state) {
      var controller = Get.find<ProfileController>();
      controller.holderName.text = 'KRISHNA ORNAMENTS';
      controller.bankName.text = 'HDFC';
      controller.branchName.text = "MANDVI BRANCH";
      controller.acNumber.text = '50200034149231';
      controller.IFSCcode.text = 'HDFC0002031';
    }, builder: (controller) {
      return Scaffold(
        backgroundColor: ColorsValue.appBg,
        appBar: AppBarWidget(
          onTapBack: () {
            Get.back();
          },
          title: "Bank Detail",
          isVisible: true,
        ),
        body: Padding(
          padding: Dimens.edgeInsets20_00_20_00,
          child: Column(
            children: [
              CustomTextFormField(
                text: 'Account Holder Name',
                readOnly: true,
                suffixIcon: GestureDetector(
                  onTap: () async {
                    await Clipboard.setData(
                        ClipboardData(text: controller.holderName.text));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(AssetConstants.copyIcon),
                  ),
                ),
                controller: controller.holderName,
              ),
              Dimens.boxHeight10,
              CustomTextFormField(
                text: 'Bank Name',
                readOnly: true,
                suffixIcon: GestureDetector(
                  onTap: () async {
                    await Clipboard.setData(
                        ClipboardData(text: controller.bankName.text));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(AssetConstants.copyIcon),
                  ),
                ),
                controller: controller.bankName,
              ),
              Dimens.boxHeight10,
              CustomTextFormField(
                text: 'Branch Name',
                readOnly: true,
                suffixIcon: GestureDetector(
                  onTap: () async {
                    await Clipboard.setData(
                        ClipboardData(text: controller.branchName.text));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(
                      AssetConstants.copyIcon,
                    ),
                  ),
                ),
                controller: controller.branchName,
              ),
              Dimens.boxHeight10,
              CustomTextFormField(
                text: 'A/C No.',
                readOnly: true,
                suffixIcon: GestureDetector(
                  onTap: () async {
                    await Clipboard.setData(
                        ClipboardData(text: controller.acNumber.text));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(AssetConstants.copyIcon),
                  ),
                ),
                controller: controller.acNumber,
              ),
              Dimens.boxHeight10,
              CustomTextFormField(
                text: 'IFSC Code',
                readOnly: true,
                suffixIcon: GestureDetector(
                  onTap: () async {
                    await Clipboard.setData(
                        ClipboardData(text: controller.IFSCcode.text));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(AssetConstants.copyIcon),
                  ),
                ),
                controller: controller.IFSCcode,
              ),
            ],
          ),
        ),
      );
    });
  }
}
