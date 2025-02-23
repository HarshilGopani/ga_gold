import 'package:get/get.dart';
import 'package:ga_gold/app/app.dart';

class SplashController extends GetxController {
  SplashController(this.splashPresenter);

  final SplashPresenter splashPresenter;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2)).then(
      (value) {
        RouteManagement.goToLoginScreen();
      },
    );
  }
}
