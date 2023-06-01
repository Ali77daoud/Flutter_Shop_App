import 'package:agora_shop/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

import '../../models/HomeData/home_data_model.dart';
import '../../shared/errors/failures.dart';

class GetHomeDataProvider {
  final HomeRepository homeRepository;

  GetHomeDataProvider(this.homeRepository);

  Future<Either<Failure, HomeDataModel>> call(
      {required String token, required String lang}) async {
    return homeRepository.getHomeData(token, lang);
  }
}
