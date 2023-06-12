import 'package:agora_shop/models/HomeData/search_product_data_model.dart';
import 'package:agora_shop/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import '../../shared/errors/failures.dart';

class SearchProductProvider {
  final HomeRepository homeRepository;

  SearchProductProvider(this.homeRepository);

  Future<Either<Failure, SearchProductDataModel>> call(
      {required String token,
      required String lang,
      required String text}) async {
    return homeRepository.searchProduct(token, lang, text);
  }
}
