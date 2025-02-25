import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../app.dart';

class BottomBarScreen extends StatelessWidget {
  const BottomBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarController>(
      builder: (controller) => DefaultTabController(
        length: controller.tabController?.length ?? 0,
        initialIndex: 0,
        child: Scaffold(
          bottomNavigationBar: ConvexAppBar(
            controller: controller.tabController,
            onTap: (index) {
              controller.tabController?.index = index;
              controller.update();
            },
            height: 60,
            items: [
              TabItem(
                icon: SvgPicture.asset(AssetConstants.ic_home),
                activeIcon: SvgPicture.asset(AssetConstants.ic_fillHome),
              ),
              TabItem(
                icon: CircleAvatar(
                  backgroundColor: ColorsValue.whiteColor,
                  child: SvgPicture.asset(
                    AssetConstants.ic_Cart,
                  ),
                ),
              ),
              TabItem(
                icon: SvgPicture.asset(AssetConstants.ic_Profile),
                activeIcon: SvgPicture.asset(AssetConstants.ic_fillProfile),
              ),
            ],
            backgroundColor: const Color(0xffFFFFFF),
            style: TabStyle.fixedCircle,
          ),
          body: TabBarView(
            controller: controller.tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              HomeScreen(),
              // CategoryScreen(),
              ShoppingCartScreen(),
              // RepairScreen(),
              ProfileScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
