import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ga_final/app/app.dart';
import 'package:ga_final/app/navigators/navigators.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      initState: (state) async {
        var controller = Get.find<CategoryController>();
        controller.getAllCategories();
      },
      builder: (controller) => Scaffold(
        backgroundColor: ColorsValue.primaryColor,
        appBar: AppBar(
          backgroundColor: ColorsValue.primaryColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Categories",
            style: Styles.color01010170020,
          ),
        ),
        body: !controller.isLoading
            ? controller.getCategoriesList.isNotEmpty
                ? ListView.builder(
                    padding: Dimens.edgeInsets20_0_20_20,
                    itemCount: controller.getCategoriesList.length,
                    itemBuilder: (context, index) {
                      var item = controller.getCategoriesList[index];
                      var type = controller.getCategoriesList[index].image
                          ?.split(".")
                          .last;
                      return GestureDetector(
                        onTap: () {
                          RouteManagement.goToViewAllProductScreen(
                              "", item.id ?? "", item.name ?? "");
                        },
                        child: Padding(
                          padding: Dimens.edgeInsetsTop10,
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Dimens.ten,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                Dimens.ten,
                              ),
                              child: type != "svg"
                                  ? CachedNetworkImage(
                                      imageUrl: (item.image ?? ""),
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) {
                                        return Image.asset(
                                          AssetConstants.placeholder,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                      errorWidget: (context, url, error) {
                                        return Image.asset(
                                          AssetConstants.placeholder,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    )
                                  : SvgPicture.network(
                                      item.image ?? "",
                                    ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text(
                      "Categories data not found...!",
                      style: Styles.black60016,
                    ),
                  )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
