import 'package:get/get.dart';
import 'package:Ga_Gold/app/app.dart';
import 'package:Ga_Gold/domain/domain.dart';

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
