import 'package:dartz/dartz.dart';
import '../../models/categories/CategoryModel.dart';
import '../../repositories/category_repository.dart';
import '../../shared/errors/failures.dart';

class GetCategoriesProvider {
  final CategoryRepository categoryRepository;

  GetCategoriesProvider(this.categoryRepository);

  Future<Either<Failure, List<CategoryModel>>> call(
      {required String token}) async {
    return categoryRepository.getCategories(token: token);
  }
}
