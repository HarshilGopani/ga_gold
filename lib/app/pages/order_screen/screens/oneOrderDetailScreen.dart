import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:Ga_Gold/app/app.dart';
import 'package:Ga_Gold/app/navigators/routes_management.dart';
import 'package:Ga_Gold/app/widgets/appbar_widgets.dart';
import 'package:Ga_Gold/app/widgets/custom_stepper.dart';
import 'package:get/get.dart';

class OneOrderDetailsScreen extends StatelessWidget {
  const OneOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(initState: (state) {
      var controller = Get.find<OrderController>();
      controller.orderId = Get.arguments;
      controller.postOrderGetOne();

      // controller.sampleOrderId = Get.arguments;
      // controller.getOneSampleData = null;
      // controller.getOneSample();
    }, builder: (controller) {
      return Scaffold(
        backgroundColor: ColorsValue.whiteColor,
        appBar: AppBarWidget(
          onTapBack: () {
            Get.back();
          },
          title: 'sample_order'.tr,
        ),
        body: Padding(
          padding: Dimens.edgeInsets20,
          child: Text("data"),
          // child: SingleChildScrollView(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         'uploaded_photo'.tr,
          //         style: Styles.color21212170014,
          //       ),
          //       Dimens.boxHeight5,
          //       InkWell(
          //         onTap: () {
          //           RouteManagement.goToShowFullScareenImage(
          //               controller.getOneOrderData.products[index]. ?? '', "Image");
          //         },
          //         child: Container(
          //           height: Dimens.hundredFifty,
          //           width: Dimens.hundredFifty,
          //           decoration: BoxDecoration(
          //             color: ColorsValue.appColor,
          //             borderRadius: BorderRadius.circular(
          //               Dimens.five,
          //             ),
          //           ),
          //           child: ClipRRect(
          //             borderRadius: BorderRadius.circular(
          //               Dimens.five,
          //             ),
          //             child: CachedNetworkImage(
          //               imageUrl: controller.getOneRepairOrderData?.file ?? '',
          //               fit: BoxFit.cover,
          //               maxWidthDiskCache: 300,
          //               maxHeightDiskCache: 300,
          //               height: Dimens.hundredFifty,
          //               width: Dimens.hundredFifty,
          //               placeholder: (context, url) {
          //                 return Image.asset(
          //                   AssetConstants.placeholder,
          //                   fit: BoxFit.cover,
          //                 );
          //               },
          //               errorWidget: (context, url, error) {
          //                 return Image.asset(
          //                   AssetConstants.placeholder,
          //                   fit: BoxFit.cover,
          //                 );
          //               },
          //             ),
          //           ),
          //         ),
          //       ),
          //       Dimens.boxHeight20,
          //       Container(
          //         width: double.maxFinite,
          //         decoration: BoxDecoration(
          //             color: ColorsValue.colorF8FAFC,
          //             borderRadius: BorderRadius.circular(10)),
          //         child: Padding(
          //           padding: Dimens.edgeInsets10,
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Text("Product Name:",
          //                       style: Styles.color47556960014),
          //                   Text(
          //                       controller.getOneRepairOrderData?.productname ??
          //                           '',
          //                       style: Styles.color47556960012),
          //                 ],
          //               ),
          //               Dimens.boxHeight4,
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Text("Gold puirty:",
          //                       style: Styles.color47556960014),
          //                   Text(
          //                       controller.getOneRepairOrderData?.priority ??
          //                           '',
          //                       style: Styles.color47556960012),
          //                 ],
          //               ),
          //               Dimens.boxHeight4,
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Text("Size:", style: Styles.color47556960014),
          //                   Text(controller.getOneRepairOrderData?.size ?? '',
          //                       style: Styles.color47556960012),
          //                 ],
          //               ),
          //               Dimens.boxHeight4,
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Text("Weight:", style: Styles.color47556960014),
          //                   Text(controller.getOneRepairOrderData?.weight ?? '',
          //                       style: Styles.color47556960012),
          //                 ],
          //               ),
          //               Dimens.boxHeight4,
          //               Text(
          //                   controller.getOneRepairOrderData?.description ?? '',
          //                   style: Styles.color47556960012)
          //             ],
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
        ),
      );
    });
  }

  List<CustomStepperView> getStepperType(
      String element, RepairController controller) {
    return element == 'pending'
        ? controller.pendingStepper
        : element == 'processing'
            ? controller.pendingStepper
            : element == "completed"
                ? controller.completStepper
                : element == "cancelled"
                    ? controller.cancelledStepper
                    : [];
  }
}
