import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      // initState: (state) async {
      //   var controller = Get.find<HomeController>();
      //   controller.postWishlist(1);
      //   controller.scrollWishListController.addListener(() async {
      //     if (controller.scrollWishListController.position.pixels ==
      //         controller.scrollWishListController.position.maxScrollExtent) {
      //       if (controller.isWishListLoading == false) {
      //         controller.isWishListLoading = true;
      //         controller.update();
      //         if (controller.isWishListLastPage == false) {
      //           await controller.postWishlist(controller.pageWishCount);
      //         }
      //         controller.isWishListLoading = false;
      //         controller.update();
      //       }
      //     }
      //   });
      // },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          appBar: AppbarWidgets(
            onTapBack: () {
              Get.back();
            },
            title: "wishlist".tr,
            isCenter: true,
          ),
          body: RefreshIndicator(
            onRefresh: () => Future.sync(
              () async {
                // await controller.postWishlist(1);
              },
            ),
            child: controller.wishlistList.isNotEmpty
                ? GridView.builder(
                    controller: controller.scrollWishListController,
                    padding: Dimens.edgeInsets20,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: Dimens.fifteen,
                      crossAxisSpacing: Dimens.ten,
                      mainAxisExtent: Dimens.twoHundredEighty,
                    ),
                    itemCount: controller.wishlistList.length,
                    itemBuilder: (context, index) {
                      var item = controller.wishlistList[index];
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Dimens.ten,
                          ),
                          color: ColorsValue.lightAppColor,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            Dimens.ten,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      RouteManagement.goToShowFullScareenImage(
                                          item.productid?.image ?? "", "image");
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(Dimens.ten),
                                        topRight: Radius.circular(Dimens.ten),
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: item.productid?.image ?? "",
                                        fit: BoxFit.cover,
                                        height: Dimens.hundredSixty,
                                        width: double.maxFinite,
                                        placeholder: (context, url) =>
                                            Image.asset(
                                          AssetConstants.placeholder,
                                          fit: BoxFit.cover,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                          AssetConstants.placeholder,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: InkWell(
                                      onTap: () {
                                        // controller.postWishlistAddRemove(
                                        //     item.productid?.id ?? "",
                                        //     index,
                                        //     true);
                                      },
                                      child: Container(
                                        margin: Dimens.edgeInsets10,
                                        height: Dimens.thirty,
                                        width: Dimens.thirty,
                                        decoration: BoxDecoration(
                                          color: ColorsValue.whiteColor,
                                          borderRadius: BorderRadius.circular(
                                            Dimens.fiveHundred,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.close,
                                          color: ColorsValue.redColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Dimens.boxHeight10,
                              Padding(
                                padding: Dimens.edgeInsets10_0_10_0,
                                child: Text(
                                  item.productid?.name ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style: Styles.blackW60014,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: Dimens.edgeInsets10_0_10_0,
                                        child: Text(
                                          "Weigth : ${item.productid?.weight} gm",
                                          style: Styles.blackColorW60014,
                                        ),
                                      ),
                                      Dimens.boxHeight10,
                                      Padding(
                                        padding: Dimens.edgeInsets10_0_10_10,
                                        child: InkWell(
                                          onTap: () {
                                            if (item.inCart ?? false) {
                                            } else {}
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: Dimens.edgeInsets14_0_14_0,
                                            height: Dimens.thirty,
                                            decoration: BoxDecoration(
                                              color: ColorsValue.colorEDC97D,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                Dimens.four,
                                              ),
                                            ),
                                            child: Text(
                                              item.inCart ?? false
                                                  ? 'Item In Cart'
                                                  : 'Add To Cart',
                                              style: Styles.colorFBF7F350010,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text(
                      "Wishlist data not found...!",
                      style: Styles.black60016,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
