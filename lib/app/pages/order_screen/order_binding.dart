import 'package:get/get.dart';

import '../../../domain/domain.dart';
import '../../app.dart';


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
