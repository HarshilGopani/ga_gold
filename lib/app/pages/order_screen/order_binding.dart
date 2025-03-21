import 'package:get/get.dart';
import 'package:Ga_Gold/app/app.dart';
import 'package:Ga_Gold/domain/domain.dart';

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
