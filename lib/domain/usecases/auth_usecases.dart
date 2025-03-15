import 'package:ga_final/domain/domain.dart';
import 'package:ga_final/domain/models/upload_image_model.dart';

/// Use case for getting the data from the API
class AuthUseCases {
  AuthUseCases(this.repository);

  final Repository repository;

  Future<LoginModel?> loginApi({
    bool isLoading = false,
    required String mobile,
    required String password,
    required String fcm,
  }) async =>
      await repository.loginApi(
        mobile: mobile,
        password: password,
        fcm: fcm,
        isLoading: isLoading,
      );

  Future<ForgotPassModel?> forgotPass({
    bool isLoading = false,
    required String email,
  }) async =>
      await repository.forgotPass(
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
      await repository.registerApi(
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
      await repository.uploadImage(
        filePath: filePath,
        isLoading: isLoading,
      );
}
