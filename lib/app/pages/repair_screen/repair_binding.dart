import 'package:get/get.dart';
import 'package:ga_final/app/app.dart';
import 'package:ga_final/domain/domain.dart';

class RepairBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RepairController>(
      () => RepairController(
        Get.put(
          RepairPresenter(
            Get.put(
              RepairUsecases(
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
