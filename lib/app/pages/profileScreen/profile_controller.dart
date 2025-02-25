
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../domain/domain.dart';
import '../../app.dart';


class ProfileController extends GetxController {
  ProfileController(this.profilePresenter);

  final ProfilePresenter profilePresenter;

  // @override
  // onInit() {
  //   super.onInit();
  //   getProfile();
  // }

  bool isProfileLoading = true;
  GetProfileData? getProfileModel;

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

  String? profileImage;
  final picker = ImagePicker();

  // // Future selectProfilePic() async {
  // //   final pickedFile = await picker.pickImage(
  // //     source: ImageSource.gallery,
  // //   );

  // //   if (pickedFile != null) {
  // //     if (Utility.getImageSizeMB(pickedFile.path) <= 5) {
  // //       profileImage = await profilePresenter.postUploadProfile(
  // //         filePath: pickedFile.path,
  // //         isLoading: true,
  // //       );
  // //       update();
  // //     } else {
  // //       Utility.errorMessage("max_5_mb_img_error".tr);
  // //     }
  // //   }
  // //   update();
  // // }

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
}
