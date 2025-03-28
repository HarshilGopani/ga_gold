import 'package:Ga_Gold/app/app.dart';
import 'package:Ga_Gold/app/navigators/navigators.dart';
import 'package:Ga_Gold/app/widgets/appbar_widgets.dart';
import 'package:Ga_Gold/domain/models/getOne_order_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetalisScreen extends StatelessWidget {
  const OrderDetalisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      initState: (state) {
        var controller = Get.find<OrderController>();
        controller.orderId = Get.arguments;
        controller.postOrderGetOne();
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: 'order_details'.tr,
          ),
          body: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: Dimens.edgeInsets10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      children: controller.getOneOrderData?.products?.map((e) {
                            return CustomJewelryCard(item: e);
                          }).toList() ??
                          [],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomJewelryCard extends StatelessWidget {
  final GetOneOrderProduct item;

  const CustomJewelryCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // RouteManagement.goToOneOrderDetailScreen(item.productId ?? '');
        // goToSampleOrderDetailsScreen
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: ColorsValue.colorF8FAFC,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      RouteManagement.goToShowFullScareenImage(
                          item.productImage ?? "", "image");
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: item.productImage ?? '',
                        fit: BoxFit.cover,
                        maxWidthDiskCache: 300,
                        maxHeightDiskCache: 300,
                        height: Dimens.hundred,
                        width: Dimens.hundred,
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
                      ),

                      // Image.network(
                      //   item.productImage ?? '',
                      //   height: 80,
                      //   width: 80,
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          item.productName ?? 'title',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Actual Weight: ${item.productWeight} gm",
                          style: Styles.black64748BW50014,
                        ),
                        Dimens.boxHeight3,
                        Text(
                          "Total Quantity: ${item.quantity}",
                          style: Styles.black64748BW50014,
                        ),
                        Dimens.boxHeight3,
                        Text(
                          "Total Weight: ${item.totalWeight} gm",
                          style: Styles.black64748BW50014,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildInfoChip("Gold purity", item.priority ?? '-'),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildInfoChip("Weight", '${item.weight ?? '-'}gm'),
                  ),
                  Expanded(
                    child: _buildInfoChip("Size", item.size ?? '-'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: ColorsValue.lightE2E8F0,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    item.description != null
                        ? 'N/A'
                        : item.description ?? 'N/A',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorsValue.color64748,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        color: ColorsValue.lightE2E8F0,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorsValue.color475569,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: ColorsValue.color64748,
            ),
          )
        ],
      ),
    );
  }
}
