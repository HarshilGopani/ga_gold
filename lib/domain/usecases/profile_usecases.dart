import 'package:ga_final/domain/domain.dart';

class ProfileUseCases {
  ProfileUseCases(this.repository);

  final Repository repository;

  Future<GetProfileModel?> getProfile({
    bool isLoading = false,
  }) async =>
      await repository.getProfile(
        isLoading: isLoading,
      );

  Future<String?> postUploadProfile({
    bool isLoading = false,
    required String filePath,
  }) async =>
      await repository.postUploadProfile(
        filePath: filePath,
        isLoading: isLoading,
      );

}
