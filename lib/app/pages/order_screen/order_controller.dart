import 'package:ga_gold/app/pages/order_screen/order_page.dart';
import 'package:ga_gold/domain/models/getOneOrder_model.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  OrderController(this.orderPresenter);

  final OrderPresenter orderPresenter;

  var list = ["fsdfds", "dfsdsf", "DSFdsfds"];

  int galleryLimit = 10;
  List<GetOrderHistoryProduct> orderListModel = [GetOrderHistoryProduct(),GetOrderHistoryProduct()];

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
}
