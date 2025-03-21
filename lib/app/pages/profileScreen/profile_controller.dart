import 'dart:io';

import 'package:flutter/material.dart';
import 'package:Ga_Gold/app/app.dart';
import 'package:Ga_Gold/domain/domain.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  ProfileController(this.profilePresenter);

  final ProfilePresenter profilePresenter;

  @override
  onInit() {
    super.onInit();
  }

  bool isProfileLoading = true;
  GetProfileData? getProfileModel;
  var client = http.Client();

  Future<void> getProfile() async {
    var response = await client.get(
      Uri.parse("https://api.gagold.in/user/profile"),
      headers: {
        "Content-Type": "application/json",
        'Authorization':
            'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
      },
    );
    var profileModel = getProfileModelFromJson(response.body);

    if (profileModel.data != null) {
      Utility.closeLoader();
      getProfileModel = profileModel.data;
      Get.find<Repository>()
          .saveValue(LocalKeys.chanelId, getProfileModel?.channelid ?? "");
      selectedProfileImage = getProfileModel?.profilePic ?? "";
      isProfileLoading = false;
    } else {
      Utility.closeLoader();
      isProfileLoading = false;
      Utility.errorMessage(profileModel.message ?? "");
    }
    update();
  }

  // Future<void> getProfile() async {
  //   var response = await profilePresenter.getProfile(
  //     isLoading: false,
  //   );
  //   getProfileModel = null;
  //   if (response != null) {
  //     getProfileModel = response.data;
  //     Get.find<Repository>()
  //         .saveValue(LocalKeys.chanelId, getProfileModel?.channelid ?? "");
  //     isProfileLoading = false;
  //   } else {
  //     isProfileLoading = false;
  //     Utility.errorMessage(response?.message ?? "");
  //   }
  //   update();
  // }

  // String? profileImage;
  // final picker = ImagePicker();

  // Future selectProfilePic() async {
  //   final pickedFile = await picker.pickImage(
  //     source: ImageSource.gallery,
  //   );

  //   if (pickedFile != null) {
  //     if (Utility.getImageSizeMB(pickedFile.path) <= 5) {
  //       profileImage = await profilePresenter.postUploadProfile(
  //         filePath: pickedFile.path,
  //         isLoading: true,
  //       );
  //       update();
  //     } else {
  //       Utility.errorMessage("max_5_mb_img_error".tr);
  //     }
  //   }
  //   update();
  // }

  TextEditingController holderName = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController branchName = TextEditingController();
  TextEditingController acNumber = TextEditingController();
  TextEditingController IFSCcode = TextEditingController();

  File? imageFile;
  final pickerProfile = ImagePicker();

  // Future setProfilePic() async {
  //   final pickedFile =
  //       await pickerProfile.pickImage(source: ImageSource.gallery);
  //
  //   if (pickedFile != null) {
  //     imageFile = File(pickedFile.path);
  //     print(">>>>>>>>>>>>>> File Path ${imageFile?.path}");
  //     print(
  //         ">>>>>>>>>>>>>> Splited File Path ${imageFile?.path.split("/").last}");
  //     final profileImage = await profilePresenter.postUploadProfile(
  //       filePath: imageFile?.path ?? '',
  //     );
  //   }
  //   update();
  // }

  String? selectedProfileImage;

  Future setProfilePic() async {
    isProfileLoading = true;
    final pickedFile = await pickerProfile.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      var respnse = await profilePresenter.postUploadProfile(
        filePath: imageFile?.path ?? '',
        isLoading: false,
      );
      if (respnse?.data != null) {
        isProfileLoading = false;
        selectedProfileImage = respnse?.data?.profilePic ?? "";
      } else {
        isProfileLoading = false;
        Utility.errorMessage(respnse?.message ?? "");
      }
    } else {
      isProfileLoading = false;
    }
    update();
  }
}
