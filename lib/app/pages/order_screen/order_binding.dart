import 'package:get/get.dart';
import 'package:ga_final/app/app.dart';
import 'package:ga_final/domain/domain.dart';

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
