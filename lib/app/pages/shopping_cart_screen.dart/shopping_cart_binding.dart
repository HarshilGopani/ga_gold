import 'package:get/get.dart';

import '../../../domain/domain.dart';
import '../../app.dart';


class ShoppingCartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShoppingCartController>(
      () => ShoppingCartController(
        Get.put(
          ShoppingCartPresenter(
            Get.put(
              ShoppingCartUsecases(
                Get.find(),
              ),
              permanent: true,
            ),
            Get.put(
              CommonUsecases(
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
