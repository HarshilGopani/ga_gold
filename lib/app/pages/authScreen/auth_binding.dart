import 'package:get/get.dart';
import 'package:ga_gold/app/pages/pages.dart';
import 'package:ga_gold/domain/domain.dart';

// coverage:ignore-file
/// A list of bindings which will be used in the route of [SplashView].
class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(
        Get.put(
          AuthPresenter(
            Get.put(
              AuthUseCases(
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
