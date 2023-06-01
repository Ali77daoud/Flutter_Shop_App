import 'package:agora_shop/services/networking/home_api_service.dart';
import 'package:dartz/dartz.dart';
import '../models/HomeData/home_data_model.dart';
import '../shared/errors/exceptions.dart';
import '../shared/errors/failures.dart';
import '../shared/network_info/network_info.dart';

class HomeRepository {
  final HomeApiService homeApiService;
  final NetworkInfo networkInfo;

  HomeRepository({required this.homeApiService, required this.networkInfo});

  Future<Either<Failure, HomeDataModel>> getHomeData(
      String token, String lang) async {
    if (await networkInfo.isConnected) {
      try {
        final homeDataResponse =
            await homeApiService.getHomeDataApi(token, lang);
        return Right(homeDataResponse);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}