import 'package:Ga_Gold/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BottomBarScreen extends StatelessWidget {
  const BottomBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarController>(
      builder: (controller) => Scaffold(
        bottomNavigationBar: SafeArea(
          child: DefaultTabController(
            length: controller.tabController?.length ?? 0,
            initialIndex: 0,
            child: Container(
              height: Get.height * .08,
              // padding: Dimens.edgeInsetsTop10,
              color: ColorsValue.whiteColor,
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: controller.tabController!.index,
                onTap: (index) {
                  controller.tabController?.index = index;
                  controller.update();
                },
                items: [
                  BottomNavigationBarItem(
                    label: '',
                    icon: SvgPicture.asset("assets/icons/home.svg"),
                    activeIcon: SvgPicture.asset("assets/svg/ic_home_fill.svg"),
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    icon: SvgPicture.asset("assets/svg/ic_cart.svg"),
                    activeIcon: SvgPicture.asset("assets/svg/ic_cart_fill.svg"),
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    icon: SvgPicture.asset(
                      AssetConstants.ic_repair,
                      colorFilter: ColorFilter.mode(
                        ColorsValue.grey9DB2CE,
                        BlendMode.srcIn,
                      ),
                    ),
                    activeIcon: SvgPicture.asset(
                      AssetConstants.ic_repair,
                      colorFilter: const ColorFilter.mode(
                        ColorsValue.blueColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    icon: SvgPicture.asset("assets/icons/profile.svg"),
                    activeIcon:
                        SvgPicture.asset("assets/svg/ic_Profile_fill.svg"),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: controller.tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            HomeScreen(),
            // CategoryScreen(),
            !Utility.isLoginOrNot()
                ? Utility.LoginNotWidget('ShoppingScreen/Cart Screen')
                : ShoppingCartScreen(),
            !Utility.isLoginOrNot()
                ? Utility.LoginNotWidget('Repair and Customize Screen')
                : RepairScreen(),
            !Utility.isLoginOrNot()
                ? Utility.LoginNotWidget('ProfileScreen')
                : ProfileScreen(),
          ],
        ),
      ),
    );
  }
}
