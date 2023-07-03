import 'package:agora_shop/models/CategoryProduct/category_product_model.dart';
import 'package:agora_shop/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import '../../shared/errors/failures.dart';

class GetCategoryProductProvider {
  final HomeRepository homeRepository;

  GetCategoryProductProvider(this.homeRepository);

  Future<Either<Failure, CategoryProductModel>> call(
      {required String token,
      required String lang,
      required int categoryId}) async {
    return await homeRepository.getCategoryProduct(token, lang, categoryId);
  }
}
