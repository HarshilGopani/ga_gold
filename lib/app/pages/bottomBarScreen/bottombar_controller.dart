import 'package:Ga_Gold/app/app.dart';
import 'package:Ga_Gold/domain/domain.dart';
import 'package:Ga_Gold/domain/services/firebase_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  BottomBarController(this.bottomBarPresenter);

  final BottomBarPresenter bottomBarPresenter;

  int selectedIndex = 0;
  TabController? tabController;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 4);
    tabController?.addListener(update);

    super.onInit();

    SocketConnection.initSocket();
    FirebaseApi().initNotification();

    if (Utility.isLoginOrNot()) {
      getProfile();
    }
  }

  GetProfileData? getProfileModel;

  Future<void> getProfile() async {
    var response = await bottomBarPresenter.getProfile(
      isLoading: true,
    );
    getProfileModel = null;
    if (response != null) {
      Utility.profileData = response.data;
      getProfileModel = response.data;
      Get.find<Repository>()
          .saveValue(LocalKeys.chanelId, getProfileModel?.channelid ?? "");
      Get.forceAppUpdate();
    } else {
      Utility.errorMessage(response?.message ?? "");
    }
    update();
  }
}
