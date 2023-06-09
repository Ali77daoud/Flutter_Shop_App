import 'package:agora_shop/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import '../../models/HomeData/product_details_model.dart';
import '../../shared/errors/failures.dart';

class GetProductDetailsProvider {
  final HomeRepository homeRepository;

  GetProductDetailsProvider(this.homeRepository);

  Future<Either<Failure, ProductDetailsModel>> call(
      {required String token, required String lang, required int id}) async {
    return homeRepository.getProductDetails(token, lang, id);
  }
}
