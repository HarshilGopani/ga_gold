import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../domain/domain.dart';
import '../app.dart';
import 'custom_wishList_order.dart';

//
// void showCustomCartDialog({
//   required BuildContext context,
//   required VoidCallback onIncrease,
//   required VoidCallback onDecrease,
//   required VoidCallback onCheckout,
//   required VoidCallback onRemove,
//   required ProductsDoc item,
// }) {
//   TextEditingController tcpurityController = TextEditingController();
//   TextEditingController tcWeigthController = TextEditingController();
//   TextEditingController tcSizeController = TextEditingController();
//   TextEditingController tcDiscriptionController = TextEditingController();
//
//   double calculateTotalWeight() {
//     double? baseWeight = item.weight;
//     int quantity = item.cartquantity;
//     double inputWeight = double.tryParse(tcWeigthController.text) ?? 0.0;
//     return (tcWeigthController.text.isEmpty)
//         ? baseWeight! * quantity
//         : inputWeight * quantity;
//   }
//
//   showDialog(
//     context: context,
//     builder: (context) {
//       return StatefulBuilder(
//         builder: (context, setState) => Dialog(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           child: SingleChildScrollView(
//             child: Stack(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Center(
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: CachedNetworkImage(
//                             imageUrl: item.image ?? '',
//                             fit: BoxFit.cover,
//                             placeholder: (context, url) => Image.asset(
//                                 AssetConstants.placeholder,
//                                 fit: BoxFit.cover),
//                             errorWidget: (context, url, error) => Image.asset(
//                                 AssetConstants.placeholder,
//                                 fit: BoxFit.cover),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Flexible(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   item.name ?? '',
//                                   style: const TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Text(
//                                   "Actual Weight: ${item.weight} gm",
//                                   style: const TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               IconButton(
//                                 onPressed: () {
//                                   if (item.cartquantity > 1) {
//                                     item.cartquantity--;
//                                     setState(() {});
//                                   }
//                                 },
//                                 icon: const Icon(Icons.remove),
//                               ),
//                               Text(
//                                 "${item.cartquantity}",
//                                 style: const TextStyle(
//                                     fontSize: 16, fontWeight: FontWeight.bold),
//                               ),
//                               IconButton(
//                                 onPressed: () {
//                                   item.cartquantity++;
//                                   setState(() {});
//                                 },
//                                 icon: const Icon(Icons.add),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       _infoTag(
//                         title: "Gold purity",
//                         item: item,
//                         controller: tcpurityController,
//                         onChanged: (value) {
//                           tcpurityController.text = value;
//                           setState(() {});
//                         },
//                       ),
//                       const SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             child: _infoTag(
//                               title: "Weight",
//                               item: item,
//                               controller: tcWeigthController,
//                               onChanged: (value) {
//                                 tcWeigthController.text = value;
//                                 setState(() {});
//                               },
//                             ),
//                           ),
//                           Dimens.boxWidth4,
//                           Expanded(
//                             child: _infoTag(
//                               title: "Size",
//                               item: item,
//                               controller: tcSizeController,
//                               onChanged: (value) {
//                                 tcSizeController.text = value;
//                                 setState(() {});
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       Container(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                         decoration: BoxDecoration(
//                           color: ColorsValue.textfildBorder,
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: TextField(
//                           controller: tcDiscriptionController,
//                           decoration: InputDecoration(
//                             hintText: "Add Remark",
//                             border: InputBorder.none,
//                             enabledBorder: InputBorder.none,
//                             focusedBorder: InputBorder.none,
//                             disabledBorder: InputBorder.none,
//                             contentPadding: EdgeInsets.zero,
//                             isDense: true,
//                           ),
//                           style: Styles.color64748B50012,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Text("Total Products: ${item.cartquantity}",
//                           style: const TextStyle(fontWeight: FontWeight.bold)),
//                       Text("Total Weight: ${calculateTotalWeight()} gm",
//                           style: const TextStyle(fontWeight: FontWeight.bold)),
//                       const SizedBox(height: 10),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             postOrderCreate(Product(
//                               priority: tcpurityController.text,
//                               size: tcSizeController.text,
//                               weight: tcWeigthController.text,
//                               description: tcDiscriptionController.text,
//                               productId: item.id,
//                               quantity: item.cartquantity,
//                             ));
//                             Get.back();
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: ColorsValue.lightYellow,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8)),
//                           ),
//                           child: const Text("Checkout",
//                               style: TextStyle(color: Colors.white)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   right: 20,
//                   top: 15,
//                   child: GestureDetector(
//                     onTap: onRemove,
//                     child: SvgPicture.asset(
//                       "assets/svg/removeProduct.svg",
//                       height: 24,
//                     ),
//                     // const Icon(Icons.delete, color: Colors.red,size: 30,),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }
//
// Widget calculation(String weight, int quantity) {
//   num count = 0;
//   count = (int.parse(weight) * quantity) as num;
//   return Text(
//     "Total Weight: ${count ?? ''} gm",
//     style: const TextStyle(fontWeight: FontWeight.bold),
//   );
//   // return count.toString();
// }
//
// // Helper Widget for tags
// Widget _buildTag(String title, String value) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//     decoration: BoxDecoration(
//       color: Colors.grey[200],
//       borderRadius: BorderRadius.circular(5),
//     ),
//     child: Text("$title $value", style: const TextStyle(fontSize: 12)),
//   );
// }
//
// Widget _infoTag({
//   required String title,
//   required ProductsDoc item,
//   required TextEditingController controller,
//   required Function(String)? onChanged,
// }) {
//   return Container(
//       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       decoration: BoxDecoration(
//         color: ColorsValue.textfildBorder,
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Row(
//         children: [
//           Text("$title : ", style: Styles.color475569W70012),
//           Dimens.boxWidth4,
//           Expanded(
//             child: TextField(
//               controller: controller,
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 enabledBorder: InputBorder.none,
//                 focusedBorder: InputBorder.none,
//                 disabledBorder: InputBorder.none,
//                 contentPadding: EdgeInsets.zero,
//                 isDense: true, // Reduces extra spacing
//               ),
//               style: Styles.color64748B50012,
//               onChanged: onChanged,
//               //     (value) {
//               //   controller.text = value;
//               // },
//             ),
//           )
//         ],
//       )
//       // child: Text("$title: $value", style: Styles.color212121W70012),
//       );
// }
//
// var client = http.Client();
//
// Future<void> postOrderCreate(Product product) async {
//   try {
//     var response = await http.post(
//       Uri.parse("https://api.gagold.in/user/orders/create"),
//       headers: {
//         "Content-Type": "application/json",
//         'Authorization':
//             'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
//       },
//       body: jsonEncode({
//         "cartid": '',
//         "products": [product],
//       }),
//     );
//
//     print("Response: ${response.body}");
//     print("Response: ${jsonDecode(response.body)['Message']}");
//     var responseData = jsonDecode(response.body);
//     Get.closeAllSnackbars();
//     if (response.statusCode == 200) {
//       // Get.back();
//       Utility.snacBar(
//           jsonDecode(response.body)['Message'] ?? "Order placed successfully",
//           ColorsValue.lightYellow);
//     } else {
//       Utility.errorMessage(
//           jsonDecode(response.body)['Message'] ?? "Something went wrong");
//     }
//   } catch (e) {
//     Utility.errorMessage("An error occurred: ${e.toString()}");
//   }
// }

void showCustomCartDialog({
  required BuildContext context,
  required VoidCallback onIncrease,
  required VoidCallback onDecrease,
  required VoidCallback onCheckout,
  required VoidCallback onRemove,
  required dynamic item, // Accepts both ProductsDoc and ProductId
}) {
  // Extract common properties safely
  String productId = "";
  String name = "Unknown Product";
  String imageUrl = "";
  num weight = 0.0;
  int quantity = 1;

  // Check the type and extract values accordingly
  if (item is ProductsDoc) {
    productId = item.id ?? "";
    name = item.name ?? "Unknown Product";
    imageUrl = item.image ?? "";
    weight = item.weight ?? 0.0;
    quantity = item.cartquantity ?? 1;
  } else if (item is Productid) {
    productId = item.id ?? "";
    name = item.name ?? "Unknown Product";
    imageUrl = item.image ?? "";
    weight = item.weight ?? 0.0;
    quantity = item.quantity ?? 1;
  } else {
    print("Error: Unsupported item type");
    return;
  }

  TextEditingController tcpurityController = TextEditingController();
  TextEditingController tcWeigthController = TextEditingController();
  TextEditingController tcSizeController = TextEditingController();
  TextEditingController tcDiscriptionController = TextEditingController();

  num calculateTotalWeight() {
    double inputWeight = double.tryParse(tcWeigthController.text) ?? 0.0;
    return (tcWeigthController.text.isEmpty)
        ? weight * quantity
        : inputWeight * quantity;
  }

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Image.asset(
                                AssetConstants.placeholder,
                                fit: BoxFit.cover),
                            errorWidget: (context, url, error) => Image.asset(
                                AssetConstants.placeholder,
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "Actual Weight: ${weight} gm",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (quantity > 1) {
                                    quantity--;
                                    setState(() {});
                                  }
                                },
                                icon: const Icon(Icons.remove),
                              ),
                              Text(
                                "$quantity",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                onPressed: () {
                                  quantity++;
                                  setState(() {});
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      _infoTag(
                        title: "Gold purity",
                        item: item,
                        controller: tcpurityController,
                        onChanged: (value) {
                          tcpurityController.text = value;
                          setState(() {});
                        },
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: _infoTag(
                              title: "Weight",
                              item: item,
                              controller: tcWeigthController,
                              onChanged: (value) {
                                tcWeigthController.text = value;
                                setState(() {});
                              },
                            ),
                          ),
                          Dimens.boxWidth4,
                          Expanded(
                            child: _infoTag(
                              title: "Size",
                              item: item,
                              controller: tcSizeController,
                              onChanged: (value) {
                                tcSizeController.text = value;
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                        decoration: BoxDecoration(
                          color: ColorsValue.textfildBorder,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextField(
                          controller: tcDiscriptionController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Add Remark",
                            contentPadding: EdgeInsets.zero,
                            isDense: true,
                          ),
                          style: Styles.color64748B50012,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("Total Products: $quantity",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                          "Total Weight: ${calculateTotalWeight().toStringAsFixed(2)} gm",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            postOrderCreate(Product(
                              priority: tcpurityController.text,
                              size: tcSizeController.text,
                              weight: tcWeigthController.text,
                              description: tcDiscriptionController.text,
                              productId: productId,
                              quantity: quantity,
                            ));
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsValue.lightYellow,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Text("Checkout",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 15,
                  child: GestureDetector(
                    onTap: onRemove,
                    child: SvgPicture.asset(
                      "assets/svg/removeProduct.svg",
                      height: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _infoTag({
  required String title,
  required dynamic item, // Accepts both ProductsDoc and ProductId
  required TextEditingController controller,
  required Function(String)? onChanged,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: ColorsValue.textfildBorder,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      children: [
        Text("$title : ", style: Styles.color475569W70012),
        Dimens.boxWidth4,
        Expanded(
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              isDense: true, // Reduces extra spacing
            ),
            style: Styles.color64748B50012,
            onChanged: onChanged,
          ),
        ),
      ],
    ),
  );
}

var client = http.Client();

Future<void> postOrderCreate(Product product) async {
  try {
    var response = await http.post(
      Uri.parse("https://api.gagold.in/user/orders/create"),
      headers: {
        "Content-Type": "application/json",
        'Authorization':
            'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
      },
      body: jsonEncode({
        "cartid": '',
        "products": [product],
      }),
    );

    print("Response: ${response.body}");
    print("Response: ${jsonDecode(response.body)['Message']}");
    var responseData = jsonDecode(response.body);
    Get.closeAllSnackbars();
    if (response.statusCode == 200) {
      // Get.back();
      Utility.snacBar(
          jsonDecode(response.body)['Message'] ?? "Order placed successfully",
          ColorsValue.lightYellow);
    } else {
      Utility.errorMessage(
          jsonDecode(response.body)['Message'] ?? "Something went wrong");
    }
  } catch (e) {
    Utility.errorMessage("An error occurred: ${e.toString()}");
  }
}
