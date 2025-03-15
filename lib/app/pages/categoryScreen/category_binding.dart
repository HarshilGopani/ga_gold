import 'package:ga_final/app/pages/categoryScreen/category_page.dart';
import 'package:ga_final/domain/usecases/usecases.dart';
import 'package:get/get.dart';

// coverage:ignore-file
/// A list of bindings which will be used in the route of [SplashView].
class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(
      () => CategoryController(
        Get.put(
          CategoryPresenter(
            Get.put(
              CategoryUseCases(
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
