import 'package:get/get.dart';
import 'package:Ga_Gold/app/pages/profileScreen/profile_page.dart';
import 'package:Ga_Gold/domain/usecases/usecases.dart';

// coverage:ignore-file
/// A list of bindings which will be used in the route of [SplashView].
class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(
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
  }
}
