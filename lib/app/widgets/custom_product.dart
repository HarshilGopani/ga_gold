import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ga_final/app/app.dart';
import 'package:ga_final/app/navigators/navigators.dart';

// ignore: must_be_immutable
class CustomProductView extends StatelessWidget {
  CustomProductView({
    super.key,
    required this.productName,
    required this.imageUrl,
    required this.categoryName,
    required this.inWishList,
    required this.quantity,
    required this.weigth,
    this.isHorizontal = false,
    required this.onAddToCard,
    required this.addFavorite,
    required this.increment,
    required this.dincrement,
    required this.inCart,
    this.height,
    this.inOutStock = false,
  });
  String productName;
  double? height;
  String categoryName;
  String imageUrl;
  String weigth;
  int quantity;
  bool inWishList;
  bool isHorizontal;
  bool inCart;
  bool inOutStock;
  void Function()? onAddToCard;
  void Function()? addFavorite;
  void Function()? increment;
  void Function()? dincrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimens.edgeInsets10,
      height: Dimens.ten,
      width: Dimens.twoHundredTen,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Dimens.ten,
        ),
        color: ColorsValue.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  RouteManagement.goToShowFullScareenImage(imageUrl, "image");
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Dimens.ten,
                    ),
                    color: ColorsValue.appBg,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      Dimens.ten,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      height: Dimens.hundredSixty,
                      width: double.maxFinite,
                      placeholder: (context, url) => Image.asset(
                        AssetConstants.placeholder,
                        fit: BoxFit.cover,
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        AssetConstants.placeholder,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: Dimens.edgeInsets8,
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
                        color: ColorsValue.lightPrimaryColor,
                      ),
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: addFavorite,
                        child: SvgPicture.asset(
                          inWishList
                              ? AssetConstants.ic_fill_like
                              : AssetConstants.ic_like,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (inOutStock) ...[
                Container(
                  alignment: Alignment.center,
                  padding: Dimens.edgeInsets12_0_12_0,
                  margin: Dimens.edgeInsetsTop10,
                  height: Dimens.twentyFive,
                  width: Dimens.hundred,
                  decoration: BoxDecoration(
                    color: ColorsValue.redColor,
                    borderRadius: BorderRadius.circular(
                      Dimens.four,
                    ),
                  ),
                  child: Text(
                    "out_of_stock".tr,
                    style: Styles.whiteColorW60012,
                  ),
                )
              ],
            ],
          ),
          Dimens.boxHeight10,
          Text(
            productName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: Styles.blackW60014,
          ),
          Dimens.boxHeight10,
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        "Weigth : ",
                        style: Styles.blackW60014,
                      ),
                      Text(
                        "$weigth gm",
                        style: Styles.black60012,
                      ),
                    ],
                  ),
                  Dimens.boxHeight5,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: dincrement,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Dimens.ten,
                                ),
                                color: ColorsValue.colorDFDFDF,
                              ),
                              child: SvgPicture.asset(
                                AssetConstants.minus,
                                height: Dimens.twentyFour,
                                width: Dimens.twentyFour,
                              ),
                            ),
                          ),
                          Dimens.boxWidth10,
                          Text(
                            quantity.toString(),
                          ),
                          Dimens.boxWidth10,
                          GestureDetector(
                            onTap: increment,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorsValue.colorDFDFDF,
                              ),
                              child: SvgPicture.asset(
                                AssetConstants.plus,
                                height: Dimens.twentyFour,
                                width: Dimens.twentyFour,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Dimens.boxHeight10,
                      InkWell(
                        onTap: onAddToCard,
                        child: Container(
                          alignment: Alignment.center,
                          padding: Dimens.edgeInsets14_0_14_0,
                          height: Dimens.twentyFive,
                          decoration: BoxDecoration(
                            color: ColorsValue.colorEDC97D,
                            borderRadius: BorderRadius.circular(
                              Dimens.four,
                            ),
                          ),
                          child: Text(
                            inCart ? 'Item In Cart' : 'Add To Cart',
                            style: Styles.colorFBF7F350010,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
