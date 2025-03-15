import 'package:ga_final/domain/domain.dart';

class CategoryUseCases {
  CategoryUseCases(this.repository);

  final Repository repository;

  Future<GetCategoriesModel?> getAllCategories({
    bool isLoading = false,
  }) async =>
      await repository.getAllCategories(
        isLoading: isLoading,
      );
}
