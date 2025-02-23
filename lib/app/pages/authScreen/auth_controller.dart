import 'package:flutter/cupertino.dart';
import 'package:ga_gold/app/app.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  AuthController(this.authPresenter);

  final AuthPresenter authPresenter;

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController tcUserName = TextEditingController();
  TextEditingController tcPasss = TextEditingController();

  ///// =========== >>>>> Forgot Pass Screen <<<<< =========== /////

  GlobalKey<FormState> forgotPassFormkey = GlobalKey<FormState>();
  TextEditingController forgotEmailController = TextEditingController();

  ///// =========== >>>>> Signup Screen <<<<< =========== /////

  GlobalKey<FormState> signUpFormkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController compleyNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  

  bool isEditValid = false;
  var dailEditcode = '+91';

  String? selectedBuyerType;
  List<String> buyerTypes = ['Retail', 'Wholesale', 'Distributor'];
}
