import 'package:Ga_Gold/domain/domain.dart';
import 'package:Ga_Gold/domain/models/uploadProfile_model.dart';

class ProfilePresenter {
  ProfilePresenter(this.profileUseCases);

  final ProfileUseCases profileUseCases;

  Future<GetProfileModel?> getProfile({
    bool isLoading = false,
  }) async =>
      await profileUseCases.getProfile(
        isLoading: isLoading,
      );

  Future<UploadProfileModel?> postUploadProfile({
    bool isLoading = false,
    required String filePath,
  }) async =>
      await profileUseCases.postUploadProfile(
        filePath: filePath,
        isLoading: isLoading,
      );
}
