// coverage:ignore-file
import 'package:ga_final/app/pages/pages.dart';
import 'package:ga_final/domain/domain.dart';
import 'package:get/get.dart';

class BottomBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomBarController>(
      () => BottomBarController(
        Get.put(
          BottomBarPresenter(
            Get.put(
              BottomBarUseCases(
                Get.find(),
              ),
              permanent: true,
            ),
          ),
        ),
      ),
    );
    Get.put<HomeController>(
      HomeController(
        Get.put(
          HomePresenter(
            Get.put(
              HomeUseCases(
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
    Get.put<CategoryController>(
      CategoryController(
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
    Get.put<ProfileController>(
      ProfileController(
        Get.put(
          ProfilePresenter(
            Get.put(
              ProfileUseCases(
                Get.find(),
              ),
              permanent: true,
            ),
          ),
        ),
      ),
    );

    Get.put<ShoppingCartController>(
      ShoppingCartController(
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

    Get.put<RepairController>(
      RepairController(
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
