import 'package:Ga_Gold/domain/domain.dart';

class SplashUseCases {
  SplashUseCases(this.repository);

  final Repository repository;

  Future<GetProfileModel?> getProfile({
    bool isLoading = false,
  }) async =>
      await repository.getProfile(
        isLoading: isLoading,
      );
}
