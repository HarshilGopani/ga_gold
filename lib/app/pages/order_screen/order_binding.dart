import 'package:ga_gold/app/pages/order_screen/order_page.dart';
import 'package:ga_gold/domain/usecases/order_usecases.dart';
import 'package:get/get.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(
      () => OrderController(
        Get.put(
          OrderPresenter(
            Get.put(
              OrderUsecases(
                Get.find(),
              ),
              permanent: true,
            ),
          ),
        ),
      ),
    );
  }
}
