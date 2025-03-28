import 'package:Ga_Gold/app/app.dart';
import 'package:Ga_Gold/app/navigators/routes_management.dart';
import 'package:Ga_Gold/app/widgets/custom_order_dilog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (state) async {
        var controller = Get.find<HomeController>();
        if (Utility.isLoginOrNot()) {
          controller.hasMore = true;
          controller.currentPage = 1;
          controller.getAllProductDocList.clear();
          controller.postGetAllProduct();
          controller.scrollViewAllController.addListener(controller.onScroll);
          controller.postWishlistCount();
        }
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.primaryColor,
          appBar: AppBar(
            toolbarHeight: 50,
            backgroundColor: ColorsValue.primaryColor,
            title: Padding(
              padding: EdgeInsets.all(Dimens.five),
              child: Text(
                "Hi, ${Utility.profileData?.name ?? 'User'}",
                style: Styles.color01010160018,
              ),
            ),
            automaticallyImplyLeading: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: InkWell(
                  onTap: () {
                    RouteManagement.goToSearchScreen();
                  },
                  child: SvgPicture.asset(
                    AssetConstants.searchView,
                    height: Dimens.twentySix,
                    width: Dimens.twentySix,
                    colorFilter: ColorFilter.mode(
                      ColorsValue.color334155,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: Dimens.ten,
                ),
                child: InkWell(
                  onTap: () {
                    RouteManagement.goToWishlistScreen();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: Dimens.ten),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(
                          AssetConstants.ic_wishlist,
                          height: Dimens.twentyFour,
                          width: Dimens.twentyFour,
                          colorFilter: ColorFilter.mode(
                            ColorsValue.color334155,
                            BlendMode.srcIn,
                          ),
                        ),
                        if (controller.wishListCount != null &&
                            controller.wishListCount != 0) ...[
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              alignment: Alignment.center,
                              height: Dimens.fifteen,
                              width: Dimens.fifteen,
                              decoration: BoxDecoration(
                                color: ColorsValue.lightYellow,
                                borderRadius: BorderRadius.circular(
                                  Dimens.hundred,
                                ),
                              ),
                              child: Text(
                                controller.wishListCount.toString(),
                                style: GoogleFonts.montserrat(
                                  fontSize: Dimens.eight,
                                  color: ColorsValue.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ]
                        // if (controller.wishListCount != null &&
                        //     controller.wishListCount != 0) ...[
                        //   Positioned(
                        //     right: 0,
                        //     top: 0,
                        //     child: Container(
                        //       alignment: Alignment.center,
                        //       height: Dimens.fifteen,
                        //       width: Dimens.fifteen,
                        //       decoration: BoxDecoration(
                        //         color: ColorsValue.colorEBF1F8,
                        //         borderRadius: BorderRadius.circular(
                        //           Dimens.hundred,
                        //         ),
                        //       ),
                        //       child: Text(
                        //         controller.wishListCount.toString(),
                        //         style: GoogleFonts.montserrat(
                        //           fontSize: Dimens.eight,
                        //           color: ColorsValue.whiteColor,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ]
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: CustomScrollView(
            controller: controller.scrollViewAllController,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 240,
                floating: false,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: Dimens.edgeInsets20_20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.maxFinite,
                              height: Dimens.twoHundred,
                              child: PageView.builder(
                                itemCount: controller.bnnerList.length,
                                onPageChanged: (value) {
                                  controller.selectPage = value;
                                  controller.update();
                                },
                                itemBuilder: (context, index) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      Dimens.ten,
                                    ),
                                    child: Image.asset(
                                      controller.bnnerList[index],
                                      width: double.maxFinite,
                                      // AssetConstants.app_logo,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Dimens.boxHeight8,
                            Center(
                              child: Wrap(
                                children: controller.bnnerList
                                    .asMap()
                                    .entries
                                    .map((e) {
                                  return Padding(
                                    padding: Dimens.edgeInsetsLeft4,
                                    child: Container(
                                      width: controller.selectPage == e.key
                                          ? Dimens.ten
                                          : Dimens.six,
                                      height: Dimens.six,
                                      decoration: BoxDecoration(
                                        color: controller.selectPage == e.key
                                            ? ColorsValue.appColor
                                            : ColorsValue.greyAAAAAA,
                                        borderRadius: BorderRadius.circular(
                                          Dimens.twenty,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            if (!Utility.isLoginOrNot()) ...[
                              Dimens.boxHeight10,
                              if (controller.getCategoriesList.isNotEmpty) ...[
                                Text(
                                  'Categories',
                                  style: Styles.color01010170020,
                                ),
                                Dimens.boxHeight10,
                                SizedBox(
                                  height: Dimens.hundredThirty,
                                  child: ListView.builder(
                                    padding: Dimens.edgeInsetsBottom10,
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        controller.getCategoriesList.length,
                                    itemBuilder: (context, index) {
                                      var item =
                                          controller.getCategoriesList[index];
                                      var type = controller
                                          .getCategoriesList[index].image
                                          ?.split(".")
                                          .last;
                                      return GestureDetector(
                                        onTap: () {
                                          controller.hasMore = true;
                                          controller.currentPage = 1;
                                          controller.getAllProductDocList
                                              .clear();
                                          controller.isSelcted != index
                                              ? item.id ==
                                                      controller
                                                          .getCategoriesList[
                                                              index]
                                                          .id
                                                  ? controller.isSelcted = index
                                                  : null
                                              : controller.isSelcted = -1;
                                          controller.postGetAllProduct(
                                              categoryId:
                                                  controller.isSelcted == -1
                                                      ? ''
                                                      : item.id ?? '');
                                          // RouteManagement.goToViewAllProductScreen(
                                          //     "", item.id ?? "", item.name ?? "");
                                        },
                                        child: Padding(
                                          padding: Dimens.edgeInsetsRight20,
                                          child: SizedBox(
                                            width: Dimens.hundredTen,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: Dimens.seventyFive,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: controller
                                                                .isSelcted ==
                                                            index
                                                        ? ColorsValue
                                                            .colorC7D1DD
                                                        : ColorsValue
                                                            .whiteColor,
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: ColorsValue
                                                              .blackColor
                                                              .withOpacity(0.1),
                                                          blurRadius: 3,
                                                          spreadRadius: 2,
                                                          blurStyle:
                                                              BlurStyle.normal,
                                                          offset: Offset(1, 4))
                                                    ],
                                                  ),
                                                  child: ClipOval(
                                                    child: type != "svg"
                                                        ? CachedNetworkImage(
                                                            imageUrl:
                                                                (item.image ??
                                                                    ""),
                                                            fit: BoxFit.cover,
                                                            height: Dimens
                                                                .seventyFive,
                                                            width: Dimens
                                                                .seventyFive,
                                                            placeholder:
                                                                (context, url) {
                                                              return Image
                                                                  .asset(
                                                                AssetConstants
                                                                    .ring,
                                                              );
                                                            },
                                                            errorWidget:
                                                                (context, url,
                                                                    error) {
                                                              return Image
                                                                  .asset(
                                                                AssetConstants
                                                                    .ring,
                                                              );
                                                            },
                                                          )
                                                        : SvgPicture.network(
                                                            item.image ?? "",
                                                            height: Dimens
                                                                .seventyFive,
                                                            width: Dimens
                                                                .seventyFive,
                                                          ),
                                                  ),
                                                ),

                                                Dimens.boxHeight10,
                                                Text(
                                                  item.name ?? '',
                                                  style: Styles.blackw60012,
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                // Container(
                                                //   alignment: Alignment.center,
                                                //   width: Dimens.seventyFive,
                                                //   decoration: BoxDecoration(
                                                //     borderRadius: BorderRadius.circular(
                                                //       Dimens.fiveHundred,
                                                //     ),
                                                //     color: controller.isSelcted == index
                                                //         ? ColorsValue.redColor
                                                //         : ColorsValue.whiteColor,
                                                //   ),
                                                //   child: ClipRRect(
                                                //     borderRadius: BorderRadius.circular(
                                                //       Dimens.fiveHundred,
                                                //     ),
                                                //     child: type != "svg"
                                                //         ? CachedNetworkImage(
                                                //             imageUrl: (item.icon ?? ""),
                                                //             height: Dimens.seventyFive,
                                                //             width: Dimens.seventyFive,
                                                //             placeholder:
                                                //                 (context, url) {
                                                //               return Image.asset(
                                                //                 AssetConstants.ring,
                                                //               );
                                                //             },
                                                //             errorWidget:
                                                //                 (context, url, error) {
                                                //               return Image.asset(
                                                //                 AssetConstants.ring,
                                                //               );
                                                //             },
                                                //           )
                                                //         : SvgPicture.network(
                                                //             item.image ?? "",
                                                //             height: Dimens.seventyFive,
                                                //             width: Dimens.seventyFive,
                                                //           ),
                                                //   ),
                                                // ),
                                                // Dimens.boxHeight10,
                                                // Text(
                                                //   item.name ?? "",
                                                //   style: Styles.blackw60012,
                                                //   maxLines: 2,
                                                //   textAlign: TextAlign.center,
                                                //   overflow: TextOverflow.ellipsis,
                                                // )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                              Dimens.boxHeight10,
                            ]
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              !Utility.isLoginOrNot()
                  ? SliverPadding(
                      padding: Dimens.edgeInsets20_20,
                      sliver: SliverGrid.builder(
                        // controller: controller.scrollViewAllController,
                        // itemCount: controller.getAllProductDocList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: Dimens.fifteen,
                          crossAxisSpacing: Dimens.ten,
                          mainAxisExtent: Dimens.twoHundredFiftyFive,
                        ),
                        itemCount: controller.isNotLoginProduct.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Dimens.ten,
                              ),
                              color: ColorsValue.textfildBorder,
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
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft:
                                                  Radius.circular(Dimens.ten),
                                              topRight:
                                                  Radius.circular(Dimens.ten),
                                            ),
                                            child: Image.asset(
                                              controller
                                                  .isNotLoginProduct[index]
                                                  .image,
                                              fit: BoxFit.cover,
                                              height: Dimens.hundredSixty,
                                              width: double.maxFinite,
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Padding(
                                      //   padding: Dimens.edgeInsets14,
                                      //   child: InkWell(
                                      //     onTap: () {
                                      //     },
                                      //     child: Align(
                                      //       alignment: Alignment.topRight,
                                      //       child: Container(
                                      //         height: Dimens.thirty,
                                      //         width: Dimens.thirty,
                                      //         decoration: BoxDecoration(
                                      //           borderRadius: BorderRadius.circular(
                                      //             Dimens.fifty,
                                      //           ),
                                      //           color: ColorsValue.whiteColor,
                                      //           border: Border.all(
                                      //             width: Dimens.one,
                                      //             color: ColorsValue.whiteColor,
                                      //           ),
                                      //         ),
                                      //         child: Center(
                                      //           child: SvgPicture.asset(
                                      //             item.wishlistStatus ?? false
                                      //                 ? AssetConstants.ic_fill_like
                                      //                 : AssetConstants.ic_like,
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  // Dimens.boxHeight10,
                                  Padding(
                                    padding: Dimens.edgeInsets10_0_10_0,
                                    child: Text(
                                      controller.isNotLoginProduct[index].title,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: Dimens.edgeInsets10_0_10_0,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Weight",
                                                      style: Styles.blackW60014,
                                                    ),
                                                    Text(
                                                      "${controller.isNotLoginProduct[index].weight} gm",
                                                      style: Styles.black60012,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Dimens.boxHeight10,
                                          // Padding(
                                          //   padding:
                                          //       Dimens.edgeInsets10_0_10_10,
                                          //   child: Row(
                                          //     children: [
                                          //       GestureDetector(
                                          //         child: SvgPicture.asset(
                                          //             AssetConstants.ic_cart),
                                          //       ),
                                          //       Dimens.boxWidth10,
                                          //     ],
                                          //   ),
                                          // )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildListDelegate([
                        Dimens.boxHeight10,
                        if (controller.getCategoriesList.isNotEmpty) ...[
                          Padding(
                            padding: Dimens.edgeInsets20_20,
                            child: Text(
                              'Categories',
                              style: Styles.color01010170020,
                            ),
                          ),
                          Dimens.boxHeight10,
                          Padding(
                            padding: Dimens.edgeInsets20_20,
                            child: SizedBox(
                              height: Dimens.hundredThirty,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.getCategoriesList.length,
                                itemBuilder: (context, index) {
                                  var item =
                                      controller.getCategoriesList[index];
                                  var type = item.image?.split(".").last;
                                  return GestureDetector(
                                    onTap: () {
                                      controller.hasMore = true;
                                      controller.currentPage = 1;
                                      controller.getAllProductDocList.clear();
                                      controller.isSelcted != index
                                          ? item.id ==
                                                  controller
                                                      .getCategoriesList[index]
                                                      .id
                                              ? controller.isSelcted = index
                                              : null
                                          : controller.isSelcted = -1;
                                      controller.postGetAllProduct(
                                          categoryId: controller.isSelcted == -1
                                              ? ''
                                              : item.id ?? '');
                                      // controller.isSelcted = (controller.isSelcted != index)
                                      //     ? item.id == item.id
                                      //     ? index
                                      //     : null
                                      //     : -1;
                                      // controller.postGetAllProduct(categoryId: controller.isSelcted == -1 ? '' : item.id ?? '');
                                    },
                                    child: Padding(
                                      padding: Dimens.edgeInsetsRight20,
                                      child: SizedBox(
                                        width: Dimens.hundredTen,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              width: Dimens.seventyFive,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: controller.isSelcted ==
                                                        index
                                                    ? ColorsValue.colorC7D1DD
                                                    : ColorsValue.whiteColor,
                                              ),
                                              child: ClipOval(
                                                child: type != "svg"
                                                    ? CachedNetworkImage(
                                                        imageUrl:
                                                            item.image ?? "",
                                                        fit: BoxFit.cover,
                                                        height:
                                                            Dimens.seventyFive,
                                                        width:
                                                            Dimens.seventyFive,
                                                        placeholder: (context,
                                                                url) =>
                                                            Image.asset(
                                                                AssetConstants
                                                                    .ring),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Image.asset(
                                                                AssetConstants
                                                                    .ring),
                                                      )
                                                    : SvgPicture.network(
                                                        item.image ?? "",
                                                        height:
                                                            Dimens.seventyFive,
                                                        width:
                                                            Dimens.seventyFive,
                                                      ),
                                              ),
                                            ),
                                            Dimens.boxHeight10,
                                            Text(
                                              item.name ?? '',
                                              style: Styles.blackw60012,
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                        Dimens.boxHeight10,
                      ]),
                    ),
              SliverPadding(
                padding: Dimens.edgeInsets20_20,
                sliver: SliverGrid.builder(
                  // controller: controller.scrollViewAllController,
                  // itemCount: controller.getAllProductDocList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: Dimens.fifteen,
                    crossAxisSpacing: Dimens.ten,
                    mainAxisExtent: Dimens.threeHundredThirty,
                  ),
                  itemCount: controller.getAllProductDocList.length +
                      (controller.isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < controller.getAllProductDocList.length) {
                      final item = controller.getAllProductDocList[index];
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Dimens.ten,
                          ),
                          color: ColorsValue.textfildBorder,
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
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: GestureDetector(
                                      onTap: () {
                                        RouteManagement
                                            .goToShowFullScareenImage(
                                                item.image ?? "", "image");
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(Dimens.ten),
                                          topRight: Radius.circular(Dimens.ten),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: item.image ?? "",
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
                                  ),
                                  Padding(
                                    padding: Dimens.edgeInsets14,
                                    child: InkWell(
                                      onTap: () {
                                        controller.postWishlistAddRemove(
                                            item.id ?? "", index, false);
                                      },
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          height: Dimens.thirty,
                                          width: Dimens.thirty,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              Dimens.fifty,
                                            ),
                                            color: ColorsValue.whiteColor,
                                            border: Border.all(
                                              width: Dimens.one,
                                              color: ColorsValue.whiteColor,
                                            ),
                                          ),
                                          child: Center(
                                            child: SvgPicture.asset(
                                              item.wishlistStatus ?? false
                                                  ? AssetConstants.ic_fill_like
                                                  : AssetConstants.ic_like,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Dimens.boxHeight10,
                              Padding(
                                padding: Dimens.edgeInsets10_0_10_0,
                                child: Text(
                                  item.name ?? "Ring 01",
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
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: Dimens.edgeInsets10_0_10_0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Weight",
                                                  style: Styles.blackW60014,
                                                ),
                                                Text(
                                                  "${item.weight} gm",
                                                  style: Styles.black60012,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: item.inCart ?? true
                                                      ? null
                                                      : () {
                                                          if (item.cartquantity
                                                                  .toDouble() >
                                                              1) {
                                                            item.cartquantity--;
                                                          }

                                                          // if (controller
                                                          //         .getAllProductDocList[
                                                          //             index]
                                                          //         .cartquantity
                                                          //         .toDouble() >
                                                          //     0) {
                                                          //   controller
                                                          //       .getAllProductDocList[
                                                          //           index]
                                                          //       .cartquantity--;
                                                          // }
                                                          controller.update();
                                                        },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        Dimens.ten,
                                                      ),
                                                      color: ColorsValue
                                                          .colorDFDFDF,
                                                    ),
                                                    child: SvgPicture.asset(
                                                      AssetConstants
                                                          .ic_minus_icon,
                                                      height: Dimens.twentyFour,
                                                      width: Dimens.twentyFour,
                                                    ),
                                                  ),
                                                ),
                                                Dimens.boxWidth10,
                                                Text(item.cartquantity
                                                    .toString()),
                                                Dimens.boxWidth10,
                                                GestureDetector(
                                                  onTap: item.inCart ?? true
                                                      ? null
                                                      : () {
                                                          item.cartquantity++;
                                                          controller.update();
                                                        },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: ColorsValue
                                                          .colorDFDFDF,
                                                    ),
                                                    child: SvgPicture.asset(
                                                      AssetConstants
                                                          .ic_plus_icon,
                                                      height: Dimens.twentyFour,
                                                      width: Dimens.twentyFour,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Dimens.boxHeight10,
                                      Padding(
                                        padding: Dimens.edgeInsets10_0_10_10,
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Get.closeCurrentSnackbar();
                                                if (item.inCart ?? false) {
                                                  Get.find<
                                                          BottomBarController>()
                                                      .tabController
                                                      ?.animateTo(1);
                                                } else {
                                                  if (controller
                                                          .getAllProductDocList[
                                                              index]
                                                          .cartquantity
                                                          .toDouble() >
                                                      0) {
                                                    controller.postAddToCart(
                                                        item.id ?? "",
                                                        item.cartquantity,
                                                        index,
                                                        "arrival");
                                                  } else {
                                                    Utility.errorMessage(
                                                        "Please add one item.");
                                                  }
                                                }
                                              },
                                              child: SvgPicture.asset(
                                                !(item.inCart ?? true)
                                                    ? AssetConstants.ic_cart
                                                    : AssetConstants
                                                        .ic_fill_cart,
                                              ),
                                            ),
                                            Dimens.boxWidth10,
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  showCustomCartDialog(
                                                    context: context,
                                                    item: item,
                                                    onIncrease: () {
                                                      item.cartquantity++;
                                                      controller.update();
                                                    },
                                                    onDecrease: () {
                                                      if (item.cartquantity
                                                              .toDouble() >
                                                          1) {
                                                        item.cartquantity--;
                                                      }
                                                      controller.update();
                                                    },
                                                    onCheckout: () =>
                                                        print("Checkout"),
                                                    onRemove: () {
                                                      Get.back();
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  padding: Dimens
                                                      .edgeInsets14_0_14_0,
                                                  height: Dimens.fourty,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        ColorsValue.buttomColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      Dimens.ten,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Order Now',
                                                    softWrap: true,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style:
                                                        Styles.whiteColorW60012,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
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
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
          // body: Stack(
          //   children: [
          //     Padding(
          //       padding: Dimens.edgeInsets20_20.copyWith(bottom: 30),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           controller.bnnerList.isEmpty
          //               ? SizedBox(
          //                   width: double.maxFinite,
          //                   height: Dimens.twoHundred,
          //                   child: Center(
          //                     child: Text('No Dat Found'),
          //                   ),
          //                 )
          //               : SizedBox(
          //                   width: double.maxFinite,
          //                   height: Dimens.twoHundred,
          //                   child: PageView.builder(
          //                     itemCount: controller.bnnerList.length,
          //                     onPageChanged: (value) {
          //                       controller.selectPage = value;
          //                       controller.update();
          //                     },
          //                     itemBuilder: (context, index) {
          //                       return ClipRRect(
          //                         borderRadius: BorderRadius.circular(
          //                           Dimens.ten,
          //                         ),
          //                         child: Image.asset(
          //                           controller.bnnerList[index],
          //                           fit: BoxFit.fill,
          //                           // AssetConstants.app_logo,
          //                         ),
          //                       );
          //                     },
          //                   ),
          //                 ),
          //           Dimens.boxHeight10,
          //           if (controller.getCategoriesList.isNotEmpty) ...[
          //             Text(
          //               'Categories',
          //               style: Styles.color01010170020,
          //             ),
          //             Dimens.boxHeight10,
          //             SizedBox(
          //               height: Dimens.hundredThirty,
          //               child: ListView.builder(
          //                 scrollDirection: Axis.horizontal,
          //                 itemCount: controller.getCategoriesList.length,
          //                 itemBuilder: (context, index) {
          //                   var item = controller.getCategoriesList[index];
          //                   var type = controller.getCategoriesList[index].image
          //                       ?.split(".")
          //                       .last;
          //                   return GestureDetector(
          //                     onTap: () {
          //                       controller.isSelcted != index
          //                           ? item.id ==
          //                                   controller
          //                                       .getCategoriesList[index].id
          //                               ? controller.isSelcted = index
          //                               : null
          //                           : controller.isSelcted = -1;
          //                       controller.postGetAllProduct(
          //                           categoryId: controller.isSelcted == -1
          //                               ? ''
          //                               : item.id ?? '');
          //                       // RouteManagement.goToViewAllProductScreen(
          //                       //     "", item.id ?? "", item.name ?? "");
          //                     },
          //                     child: Padding(
          //                       padding: Dimens.edgeInsetsRight20,
          //                       child: SizedBox(
          //                         width: Dimens.hundredTen,
          //                         child: Column(
          //                           mainAxisAlignment: MainAxisAlignment.start,
          //                           crossAxisAlignment:
          //                               CrossAxisAlignment.center,
          //                           children: [
          //                             Container(
          //                               alignment: Alignment.center,
          //                               width: Dimens.seventyFive,
          //                               decoration: BoxDecoration(
          //                                 shape: BoxShape.circle,
          //                                 color: controller.isSelcted == index
          //                                     ? ColorsValue.colorC7D1DD
          //                                     : ColorsValue.whiteColor,
          //                                 boxShadow: [
          //                                   BoxShadow(
          //                                       color: ColorsValue.blackColor
          //                                           .withOpacity(0.1),
          //                                       blurRadius: 3,
          //                                       spreadRadius: 2,
          //                                       blurStyle: BlurStyle.normal,
          //                                       offset: Offset(1, 4))
          //                                 ],
          //                               ),
          //                               child: ClipOval(
          //                                 child: type != "svg"
          //                                     ? CachedNetworkImage(
          //                                         imageUrl: (item.image ?? ""),
          //                                         fit: BoxFit.cover,
          //                                         height: Dimens.seventyFive,
          //                                         width: Dimens.seventyFive,
          //                                         placeholder: (context, url) {
          //                                           return Image.asset(
          //                                             AssetConstants.ring,
          //                                           );
          //                                         },
          //                                         errorWidget:
          //                                             (context, url, error) {
          //                                           return Image.asset(
          //                                             AssetConstants.ring,
          //                                           );
          //                                         },
          //                                       )
          //                                     : SvgPicture.network(
          //                                         item.image ?? "",
          //                                         height: Dimens.seventyFive,
          //                                         width: Dimens.seventyFive,
          //                                       ),
          //                               ),
          //                             ),
          //
          //                             Dimens.boxHeight10,
          //                             Text(
          //                               item.name ?? '',
          //                               style: Styles.blackw60012,
          //                               maxLines: 2,
          //                               textAlign: TextAlign.center,
          //                               overflow: TextOverflow.ellipsis,
          //                             ),
          //                             // Container(
          //                             //   alignment: Alignment.center,
          //                             //   width: Dimens.seventyFive,
          //                             //   decoration: BoxDecoration(
          //                             //     borderRadius: BorderRadius.circular(
          //                             //       Dimens.fiveHundred,
          //                             //     ),
          //                             //     color: controller.isSelcted == index
          //                             //         ? ColorsValue.redColor
          //                             //         : ColorsValue.whiteColor,
          //                             //   ),
          //                             //   child: ClipRRect(
          //                             //     borderRadius: BorderRadius.circular(
          //                             //       Dimens.fiveHundred,
          //                             //     ),
          //                             //     child: type != "svg"
          //                             //         ? CachedNetworkImage(
          //                             //             imageUrl: (item.icon ?? ""),
          //                             //             height: Dimens.seventyFive,
          //                             //             width: Dimens.seventyFive,
          //                             //             placeholder:
          //                             //                 (context, url) {
          //                             //               return Image.asset(
          //                             //                 AssetConstants.ring,
          //                             //               );
          //                             //             },
          //                             //             errorWidget:
          //                             //                 (context, url, error) {
          //                             //               return Image.asset(
          //                             //                 AssetConstants.ring,
          //                             //               );
          //                             //             },
          //                             //           )
          //                             //         : SvgPicture.network(
          //                             //             item.image ?? "",
          //                             //             height: Dimens.seventyFive,
          //                             //             width: Dimens.seventyFive,
          //                             //           ),
          //                             //   ),
          //                             // ),
          //                             // Dimens.boxHeight10,
          //                             // Text(
          //                             //   item.name ?? "",
          //                             //   style: Styles.blackw60012,
          //                             //   maxLines: 2,
          //                             //   textAlign: TextAlign.center,
          //                             //   overflow: TextOverflow.ellipsis,
          //                             // )
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                   );
          //                 },
          //               ),
          //             ),
          //           ],
          //           Dimens.boxHeight10,
          //           Expanded(
          //             child: RefreshIndicator(
          //               onRefresh: () => Future.sync(
          //                 () => controller.postGetAllProduct(),
          //               ),
          //               child: GridView.builder(
          //                 controller: controller.scrollViewAllController,
          //                 itemCount: controller.getAllProductDocList.length,
          //                 gridDelegate:
          //                     SliverGridDelegateWithFixedCrossAxisCount(
          //                   crossAxisCount: 2,
          //                   mainAxisSpacing: Dimens.fifteen,
          //                   crossAxisSpacing: Dimens.ten,
          //                   mainAxisExtent: Dimens.threeHundredThirty,
          //                 ),
          //                 // itemCount: controller.getAllProductDocList.length +
          //                 //     (controller.isLoading ? 1 : 0),
          //                 itemBuilder: (context, index) {
          //                   if (index <
          //                       controller.getAllProductDocList.length) {
          //                     final item =
          //                         controller.getAllProductDocList[index];
          //                     return Container(
          //                       decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(
          //                           Dimens.ten,
          //                         ),
          //                         color: ColorsValue.textfildBorder,
          //                       ),
          //                       child: ClipRRect(
          //                         borderRadius: BorderRadius.circular(
          //                           Dimens.ten,
          //                         ),
          //                         child: Column(
          //                           crossAxisAlignment:
          //                               CrossAxisAlignment.start,
          //                           children: [
          //                             Stack(
          //                               children: [
          //                                 Padding(
          //                                   padding: const EdgeInsets.all(10),
          //                                   child: GestureDetector(
          //                                     onTap: () {
          //                                       RouteManagement
          //                                           .goToShowFullScareenImage(
          //                                               item.image ?? "",
          //                                               "image");
          //                                     },
          //                                     child: ClipRRect(
          //                                       borderRadius: BorderRadius.only(
          //                                         topLeft: Radius.circular(
          //                                             Dimens.ten),
          //                                         topRight: Radius.circular(
          //                                             Dimens.ten),
          //                                       ),
          //                                       child: CachedNetworkImage(
          //                                         imageUrl: item.image ?? "",
          //                                         fit: BoxFit.cover,
          //                                         height: Dimens.hundredSixty,
          //                                         width: double.maxFinite,
          //                                         placeholder: (context, url) =>
          //                                             Image.asset(
          //                                           AssetConstants.placeholder,
          //                                           fit: BoxFit.cover,
          //                                         ),
          //                                         errorWidget:
          //                                             (context, url, error) =>
          //                                                 Image.asset(
          //                                           AssetConstants.placeholder,
          //                                           fit: BoxFit.cover,
          //                                         ),
          //                                       ),
          //                                     ),
          //                                   ),
          //                                 ),
          //                                 Padding(
          //                                   padding: Dimens.edgeInsets14,
          //                                   child: Align(
          //                                     alignment: Alignment.topRight,
          //                                     child: Container(
          //                                       height: Dimens.thirty,
          //                                       width: Dimens.thirty,
          //                                       decoration: BoxDecoration(
          //                                         borderRadius:
          //                                             BorderRadius.circular(
          //                                           Dimens.fifty,
          //                                         ),
          //                                         color: ColorsValue.whiteColor,
          //                                         border: Border.all(
          //                                           width: Dimens.one,
          //                                           color:
          //                                               ColorsValue.whiteColor,
          //                                         ),
          //                                       ),
          //                                       child: Center(
          //                                         child: InkWell(
          //                                           onTap: () {
          //                                             controller
          //                                                 .postWishlistAddRemove(
          //                                                     item.id ?? "",
          //                                                     index,
          //                                                     false);
          //                                           },
          //                                           child: SvgPicture.asset(
          //                                             item.wishlistStatus ??
          //                                                     false
          //                                                 ? AssetConstants
          //                                                     .ic_fill_like
          //                                                 : AssetConstants
          //                                                     .ic_like,
          //                                           ),
          //                                         ),
          //                                       ),
          //                                     ),
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                             // Dimens.boxHeight10,
          //                             Padding(
          //                               padding: Dimens.edgeInsets10_0_10_0,
          //                               child: Text(
          //                                 item.name ?? "Ring 01",
          //                                 maxLines: 2,
          //                                 overflow: TextOverflow.ellipsis,
          //                                 softWrap: true,
          //                                 style: Styles.blackW60014,
          //                               ),
          //                             ),
          //                             Expanded(
          //                               child: Align(
          //                                 alignment: Alignment.bottomCenter,
          //                                 child: Column(
          //                                   mainAxisSize: MainAxisSize.min,
          //                                   mainAxisAlignment:
          //                                       MainAxisAlignment.end,
          //                                   crossAxisAlignment:
          //                                       CrossAxisAlignment.end,
          //                                   children: [
          //                                     Padding(
          //                                       padding:
          //                                           Dimens.edgeInsets10_0_10_0,
          //                                       child: Row(
          //                                         mainAxisAlignment:
          //                                             MainAxisAlignment
          //                                                 .spaceBetween,
          //                                         children: [
          //                                           Column(
          //                                             crossAxisAlignment:
          //                                                 CrossAxisAlignment
          //                                                     .start,
          //                                             children: [
          //                                               Text(
          //                                                 "Weight",
          //                                                 style: Styles
          //                                                     .blackW60014,
          //                                               ),
          //                                               Text(
          //                                                 "${item.weight} gm",
          //                                                 style:
          //                                                     Styles.black60012,
          //                                               ),
          //                                             ],
          //                                           ),
          //                                           Row(
          //                                             children: [
          //                                               GestureDetector(
          //                                                 onTap: item.inCart ??
          //                                                         true
          //                                                     ? null
          //                                                     : () {
          //                                                         if (item.cartquantity
          //                                                                 .toDouble() >
          //                                                             1) {
          //                                                           item.cartquantity--;
          //                                                         }
          //
          //                                                         // if (controller
          //                                                         //         .getAllProductDocList[
          //                                                         //             index]
          //                                                         //         .cartquantity
          //                                                         //         .toDouble() >
          //                                                         //     0) {
          //                                                         //   controller
          //                                                         //       .getAllProductDocList[
          //                                                         //           index]
          //                                                         //       .cartquantity--;
          //                                                         // }
          //                                                         controller
          //                                                             .update();
          //                                                       },
          //                                                 child: Container(
          //                                                   decoration:
          //                                                       BoxDecoration(
          //                                                     borderRadius:
          //                                                         BorderRadius
          //                                                             .circular(
          //                                                       Dimens.ten,
          //                                                     ),
          //                                                     color: ColorsValue
          //                                                         .colorDFDFDF,
          //                                                   ),
          //                                                   child: SvgPicture
          //                                                       .asset(
          //                                                     AssetConstants
          //                                                         .ic_minus_icon,
          //                                                     height: Dimens
          //                                                         .twentyFour,
          //                                                     width: Dimens
          //                                                         .twentyFour,
          //                                                   ),
          //                                                 ),
          //                                               ),
          //                                               Dimens.boxWidth10,
          //                                               Text(item.cartquantity
          //                                                   .toString()),
          //                                               Dimens.boxWidth10,
          //                                               GestureDetector(
          //                                                 onTap: item.inCart ??
          //                                                         true
          //                                                     ? null
          //                                                     : () {
          //                                                         item.cartquantity++;
          //                                                         controller
          //                                                             .update();
          //                                                       },
          //                                                 child: Container(
          //                                                   decoration:
          //                                                       BoxDecoration(
          //                                                     borderRadius:
          //                                                         BorderRadius
          //                                                             .circular(
          //                                                                 10),
          //                                                     color: ColorsValue
          //                                                         .colorDFDFDF,
          //                                                   ),
          //                                                   child: SvgPicture
          //                                                       .asset(
          //                                                     AssetConstants
          //                                                         .ic_plus_icon,
          //                                                     height: Dimens
          //                                                         .twentyFour,
          //                                                     width: Dimens
          //                                                         .twentyFour,
          //                                                   ),
          //                                                 ),
          //                                               ),
          //                                             ],
          //                                           ),
          //                                         ],
          //                                       ),
          //                                     ),
          //                                     Dimens.boxHeight10,
          //                                     Padding(
          //                                       padding:
          //                                           Dimens.edgeInsets10_0_10_10,
          //                                       child: Row(
          //                                         children: [
          //                                           GestureDetector(
          //                                             onTap: () {
          //                                               Get.closeCurrentSnackbar();
          //                                               if (item.inCart ??
          //                                                   false) {
          //                                                 Get.find<
          //                                                         BottomBarController>()
          //                                                     .tabController
          //                                                     ?.animateTo(1);
          //                                               } else {
          //                                                 if (controller
          //                                                         .getAllProductDocList[
          //                                                             index]
          //                                                         .cartquantity
          //                                                         .toDouble() >
          //                                                     0) {
          //                                                   controller
          //                                                       .postAddToCart(
          //                                                           item.id ??
          //                                                               "",
          //                                                           item.cartquantity,
          //                                                           index,
          //                                                           "arrival");
          //                                                 } else {
          //                                                   Utility.errorMessage(
          //                                                       "Please add one item.");
          //                                                 }
          //                                               }
          //                                             },
          //                                             child: SvgPicture.asset(
          //                                               !(item.inCart ?? true)
          //                                                   ? AssetConstants
          //                                                       .ic_cart
          //                                                   : AssetConstants
          //                                                       .ic_fill_cart,
          //                                             ),
          //                                           ),
          //                                           Dimens.boxWidth10,
          //                                           Expanded(
          //                                             child: InkWell(
          //                                               onTap: () {
          //                                                 showCustomCartDialog(
          //                                                   context: context,
          //                                                   item: item,
          //                                                   onIncrease: () {
          //                                                     item.cartquantity++;
          //                                                     controller
          //                                                         .update();
          //                                                   },
          //                                                   onDecrease: () {
          //                                                     if (item.cartquantity
          //                                                             .toDouble() >
          //                                                         1) {
          //                                                       item.cartquantity--;
          //                                                     }
          //                                                     controller
          //                                                         .update();
          //                                                   },
          //                                                   onCheckout: () =>
          //                                                       print(
          //                                                           "Checkout"),
          //                                                   onRemove: () {
          //                                                     Get.back();
          //                                                   },
          //                                                 );
          //                                               },
          //                                               child: Container(
          //                                                 alignment:
          //                                                     Alignment.center,
          //                                                 padding: Dimens
          //                                                     .edgeInsets14_0_14_0,
          //                                                 height: Dimens.fourty,
          //                                                 decoration:
          //                                                     BoxDecoration(
          //                                                   color: ColorsValue
          //                                                       .buttomColor,
          //                                                   borderRadius:
          //                                                       BorderRadius
          //                                                           .circular(
          //                                                     Dimens.ten,
          //                                                   ),
          //                                                 ),
          //                                                 child: Text(
          //                                                   'Order Now',
          //                                                   softWrap: true,
          //                                                   overflow:
          //                                                       TextOverflow
          //                                                           .ellipsis,
          //                                                   style: Styles
          //                                                       .whiteColorW60012,
          //                                                 ),
          //                                               ),
          //                                             ),
          //                                           ),
          //                                         ],
          //                                       ),
          //                                     )
          //                                   ],
          //                                 ),
          //                               ),
          //                             )
          //                           ],
          //                         ),
          //                       ),
          //                     );
          //                   } else {
          //                     return Center(child: CircularProgressIndicator());
          //                   }
          //                 },
          //               ),
          //             ),
          //           ),
          //           // Dimens.boxHeight20,
          //         ],
          //       ),
          //     ),
          //     // if (controller.isLoading) ...[
          //     //   Container(
          //     //     height: Get.height,
          //     //     width: Get.width,
          //     //     color: Colors.black.withValues(alpha: 0.5),
          //     //     child: Center(
          //     //       child: CircularProgressIndicator(),
          //     //     ),
          //     //   )
          //     // ]
          //   ],
          // ),
        );
      },
    );
  }
}
