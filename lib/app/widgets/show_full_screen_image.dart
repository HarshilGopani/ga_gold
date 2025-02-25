import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../app.dart';

class ShowFullScareenImage extends StatelessWidget {
  ShowFullScareenImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorsValue.appColor,
        appBar: AppbarWidgets(
          onTapBack: () {
            Get.back();
          },
          title: 'Gallery'.tr,
        ),
        body: SafeArea(
          child: Container(
            color: ColorsValue.appColor,
            child: PhotoViewGallery.builder(
              backgroundDecoration: BoxDecoration(
                color: ColorsValue.appColor,
              ),
              builder: (BuildContext context, int index) {
                switch (Get.arguments[1]) {
                  case "image":
                    return buildForImage(Get.arguments[0]);
                  default:
                    return buildForImage(Get.arguments[0]);
                }
              },
              itemCount: 1,
            ),
          ),
        ),
      );
    });
  }

  PhotoViewGalleryPageOptions buildForImage(image) {
    return PhotoViewGalleryPageOptions(
      imageProvider: CachedNetworkImageProvider(image),
      initialScale: PhotoViewComputedScale.contained * 1,
      minScale: PhotoViewComputedScale.contained * 1,
    );
  }
}
