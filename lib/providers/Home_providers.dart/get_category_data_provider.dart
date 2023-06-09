import 'package:agora_shop/models/HomeData/category_data_model.dart';
import 'package:agora_shop/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import '../../shared/errors/failures.dart';

class GetCategoryDataProvider {
  final HomeRepository homeRepository;

  GetCategoryDataProvider(this.homeRepository);

  Future<Either<Failure, CategoryDataModel>> call(
      {required String token, required String lang}) async {
    return homeRepository.getCategoryData(token, lang);
  }
}
