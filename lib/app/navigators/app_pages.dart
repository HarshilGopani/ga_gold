// coverage:ignore-file

import 'package:ga_final/app/app.dart';
import 'package:ga_final/app/pages/order_screen/screens/oneOrderDetailScreen.dart';
import 'package:ga_final/app/pages/profileScreen/screen/contact_us.dart';
import 'package:get/get.dart';

import '../pages/logingScreen/screens/mobile_number_verification.dart';
import '../pages/shopping_cart_screen.dart/screens/view_all_screen.dart'
    show ViewAllProductScreen;

part 'app_routes.dart';

/// Contains the list of pages or routes taken across the whole application.
/// This will prevent us in using context for navigation. And also providing
/// the blocs required in the next named routes.
///
/// [pages] : will contain all the pages in the application as a route
/// and will be used in the material app.
/// Will be ignored for test since all are static values and would not change.
class AppPages {
  static var transitionDuration = const Duration(milliseconds: 300);

  static const initial = _Paths.splashScreen;
  static final pages = <GetPage>[
    GetPage<SplashScreen>(
      name: _Paths.splashScreen,
      transitionDuration: transitionDuration,
      page: SplashScreen.new,
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<LoginScreen>(
      name: _Paths.loginScreen,
      transitionDuration: transitionDuration,
      page: LoginScreen.new,
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<MobileNumberVerification>(
      name: _Paths.numberVerifyScreen,
      transitionDuration: transitionDuration,
      page: MobileNumberVerification.new,
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<ForgetPasswordView>(
      name: _Paths.forgotScreen,
      transitionDuration: transitionDuration,
      page: ForgetPasswordView.new,
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<SignupScreen>(
      name: _Paths.signUpScreen,
      transitionDuration: transitionDuration,
      page: SignupScreen.new,
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<HomeScreen>(
      name: _Paths.homeScreen,
      transitionDuration: transitionDuration,
      page: HomeScreen.new,
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<BottomBarScreen>(
      name: _Paths.bottomBarScreen,
      transitionDuration: transitionDuration,
      page: BottomBarScreen.new,
      binding: BottomBarBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<OrderScreen>(
      name: _Paths.orderScreen,
      transitionDuration: transitionDuration,
      page: OrderScreen.new,
      binding: OrderBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<OrderDetalisScreen>(
      name: _Paths.orderDetalisScreen,
      transitionDuration: transitionDuration,
      page: OrderDetalisScreen.new,
      binding: OrderBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<BagDetailScreen>(
      name: _Paths.bagDetailScreen,
      transitionDuration: transitionDuration,
      page: BagDetailScreen.new,
      binding: OrderBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<RepairScreen>(
      name: _Paths.repairScreen,
      transitionDuration: transitionDuration,
      page: RepairScreen.new,
      binding: RepairBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<RepairDetailsScreen>(
      name: _Paths.repairDetailsScreen,
      transitionDuration: transitionDuration,
      page: RepairDetailsScreen.new,
      binding: RepairBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<RepairOrderHistoryScreen>(
      name: _Paths.repairOrderHistoryScreen,
      transitionDuration: transitionDuration,
      page: RepairOrderHistoryScreen.new,
      binding: RepairBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<RepairOrderDetalisScreen>(
      name: _Paths.repairOrderDetalisScreen,
      transitionDuration: transitionDuration,
      page: RepairOrderDetalisScreen.new,
      binding: RepairBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<BagDetailScreen>(
      name: _Paths.bagDetailScreen,
      transitionDuration: transitionDuration,
      page: BagDetailScreen.new,
      binding: OrderBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<SampleOrderScreen>(
      name: _Paths.sampleOrderScreen,
      transitionDuration: transitionDuration,
      page: SampleOrderScreen.new,
      binding: RepairBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<SampleOrderDetailsScreen>(
      name: _Paths.sampleOrderDetailsScreen,
      transitionDuration: transitionDuration,
      page: SampleOrderDetailsScreen.new,
      binding: RepairBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<SampleOrderHistoryScreen>(
      name: _Paths.sampleOrderHistoryScreen,
      transitionDuration: transitionDuration,
      page: SampleOrderHistoryScreen.new,
      binding: RepairBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<ShowFullScareenImage>(
      name: _Paths.showFullScareenImage,
      transitionDuration: transitionDuration,
      page: ShowFullScareenImage.new,
      binding: RepairBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<WishlistScreen>(
      name: _Paths.wishlistScreen,
      transitionDuration: transitionDuration,
      page: WishlistScreen.new,
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<ViewAllProductScreen>(
      name: _Paths.viewAllProductScreen,
      transitionDuration: transitionDuration,
      page: ViewAllProductScreen.new,
      binding: ShoppingCartBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<SearchScreen>(
      name: _Paths.searchProductScreen,
      transitionDuration: transitionDuration,
      page: SearchScreen.new,
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<BankDetailScreen>(
      name: _Paths.bankDetailScreen,
      transitionDuration: transitionDuration,
      page: BankDetailScreen.new,
      binding: ProfileBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<ContactUsScreen>(
      name: _Paths.contactUsScreen,
      transitionDuration: transitionDuration,
      page: ContactUsScreen.new,
      binding: ProfileBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<ShoppingCartScreen>(
      name: _Paths.shoppingCartScreen,
      transitionDuration: transitionDuration,
      page: ShoppingCartScreen.new,
      binding: ShoppingCartBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<OneOrderDetailsScreen>(
      name: _Paths.oneOrderDetailScreen,
      transitionDuration: transitionDuration,
      page: OneOrderDetailsScreen.new,
      binding: OrderBinding(),
      transition: Transition.fadeIn,
    ),

    GetPage<InAppUpdateScreen>(
      name: _Paths.inAppUpdateScreen,
      transitionDuration: transitionDuration,
      page: InAppUpdateScreen.new,
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
