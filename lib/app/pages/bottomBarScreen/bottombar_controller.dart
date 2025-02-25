import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app.dart';

class BottomBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  BottomBarController(this.bottomBarPresenter);

  final BottomBarPresenter bottomBarPresenter;

  int selectedIndex = 0;
  TabController? tabController;

  // @override
  void onInit() {
    tabController = TabController(vsync: this, length: 3);
    tabController?.addListener(update);
    // getProfile();

    super.onInit();

    // SocketConnection.initSocket();
    // FirebaseApi().initNotification();
  }

  // GetProfileData? getProfileModel;

  // Future<void> getProfile() async {
  //   var response = await bottomBarPresenter.getProfile(
  //     isLoading: true,
  //   );
  //   getProfileModel = null;
  //   if (response != null) {
  //     getProfileModel = response.data;
  //     Get.find<Repository>()
  //         .saveValue(LocalKeys.chanelId, getProfileModel?.channelid ?? "");
  //     update();
  //   } else {
  //     Utility.errorMessage(response?.message ?? "");
  //   }
  // }
}
