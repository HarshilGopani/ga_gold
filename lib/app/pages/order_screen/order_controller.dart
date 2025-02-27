import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../domain/domain.dart';
import '../../app.dart';

class OrderController extends GetxController {
  OrderController(this.orderPresenter);

  final OrderPresenter orderPresenter;

  var list = ["fsdfds", "dfsdsf", "DSFdsfds"];

  PagingController<int, GetOrderHistoryDoc> orderPagingController =
      PagingController(firstPageKey: 1);

  int galleryLimit = 10;

  // Future<void> postOrderHistory() async {
  //   var response = await orderPresenter.postOrderHistory(
  //     page: 1,
  //     limit: galleryLimit,
  //     isLoading: false,
  //   );

  //   // orderListModel.clear();
  //   if (response != null) {
  //     getOrderHistoryDetail = response.data!.docs![0];
  //     // orderListModel1 = orderListModel[0];
  //     update();
  //   }
  // }

  List<GetOrderHistoryProduct> orderListModel = [
    GetOrderHistoryProduct(
        categoryName: 'Ring',
        description: "this ",
        quantity: 2,
        remainingQuantity: 20,
        orderProcessing: 3,
        productOrderTracking: 'pendding',
        productWeight: '300'),
  ];
  GetOrderHistoryDoc? getOrderHistoryDoc;

  var client = http.Client();

  bool isLoading = false;

  // Future<void> postOrderHistory() async {
  //   // var response = await orderPresenter.postOrderHistory(
  //   //   page: 1,
  //   //   limit: galleryLimit,
  //   //   isLoading: true,
  //   // );
  //   // orderListModel.clear();
  //   // if (response != null) {
  //   //   print(response.data?.docs?[0].products?.length);
  //   //   getOrderHistoryDoc = response.data?.docs![0];
  //   //   orderListModel.addAll(response.data?.docs?.first.products ?? []);

  //   //   update();
  //   // }

  //   var response = await client.post(
  //     Uri.parse("https://api.krishnaornaments.com/user/orders/history"),
  //     headers: {
  //       "Content-Type": "application/json",
  //       'Authorization':
  //           'Token ${Get.find<Repository>().getStringValue(LocalKeys.authToken)}',
  //     },
  //     body: jsonEncode({
  //       "page": 1,
  //       "limit": 10,
  //     }),
  //   );

  //   var getOrderHistoryModel = getOrderHistoryModelFromJson(response.body);
  //   if (getOrderHistoryModel.status == 200) {
  //     getOrderHistoryDoc = getOrderHistoryModel.data?.docs![0];
  //     orderListModel
  //         .addAll(getOrderHistoryModel.data?.docs?.first.products ?? []);
  //     isLoading = false;
  //   } else {
  //     Utility.showMessage(getOrderHistoryModel.message.toString(),
  //         MessageType.error, () => null, '');
  //     isLoading = false;
  //   }

  //   update();
  // }

  GetOneOrderData? getOneOrderData = GetOneOrderData();

  String orderId = "";

  // Future<void> postOrderGetOne() async {
  //   var response = await orderPresenter.postOrderGetOne(
  //     orderId: orderId,
  //     isLoading: false,
  //   );
  //   getOneOrderData = null;
  //   if (response != null) {
  //     getOneOrderData = response.data;
  //     update();
  //   }
  // }

  GetOneBagData? getOneBagData = GetOneBagData();
  String? bugId;

  // Future<void> postGetOnebag() async {
  //   var response = await orderPresenter.postGetOnebag(
  //     orderId: orderId,
  //     bagId: bugId ?? "",
  //     isLoading: false,
  //   );
  //   getOneBagData = null;
  //   if (response != null) {
  //     getOneBagData = response.data;
  //     update();
  //   }
  // }
}
