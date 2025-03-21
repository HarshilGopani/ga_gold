import 'package:Ga_Gold/domain/domain.dart';
import 'package:Ga_Gold/domain/models/upload_image_model.dart';

class LoginPresenter {
  LoginPresenter(this.authUseCases);

  final AuthUseCases authUseCases;

  Future<LoginModel?> loginApi({
    bool isLoading = false,
    required String mobile,
    required String password,
    required String fcm,
  }) async =>
      await authUseCases.loginApi(
        mobile: mobile,
        password: password,
        fcm: fcm,
        isLoading: isLoading,
      );

  Future<ForgotPassModel?> forgotPass({
    bool isLoading = false,
    required String email,
  }) async =>
      await authUseCases.forgotPass(
        email: email,
        isLoading: isLoading,
      );

  Future<RegisterModel?> registerApi({
    bool isLoading = false,
    required String city,
    required String countryCode,
    required String mobile,
    required String password,
    required String name,
    required String email,
    required String companyname,
    required List<String> images,
  }) async =>
      await authUseCases.registerApi(
        city: city,
        countryCode: countryCode,
        mobile: mobile,
        password: password,
        name: name,
        email: email,
        companyname: companyname,
        images: images,
        isLoading: isLoading,
      );

  Future<UploadImage?> uploadImage({
    bool isLoading = false,
    required String filePath,
  }) async =>
      await authUseCases.uploadImage(
        filePath: filePath,
        isLoading: isLoading,
      );
}
