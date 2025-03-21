import 'package:Ga_Gold/domain/domain.dart';

class CategoryPresenter {
  CategoryPresenter(this.categoryUseCases);

  final CategoryUseCases categoryUseCases;

  Future<GetCategoriesModel?> getAllCategories({
    bool isLoading = false,
  }) async =>
      await categoryUseCases.getAllCategories(
        isLoading: isLoading,
      );
}
