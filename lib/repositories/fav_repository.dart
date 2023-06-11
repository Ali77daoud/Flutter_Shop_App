import 'package:agora_shop/services/networking/fav_api_service.dart';
import 'package:agora_shop/shared/errors/exceptions.dart';
import 'package:agora_shop/shared/network_info/network_info.dart';
import 'package:dartz/dartz.dart';
import '../models/Favourite/fav_data_model.dart';
import '../shared/errors/failures.dart';

class FavRepository {
  final FavApiService favApiService;
  final NetworkInfo networkInfo;

  FavRepository({required this.favApiService, required this.networkInfo});

  Future<Either<Failure, FavDataModel>> getFavData(
      String token, String lang) async {
    if (await networkInfo.isConnected) {
      try {
        final favDataResponse = await favApiService.getFavDataApi(token, lang);
        return Right(favDataResponse);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, String>> addOrDeleteFav(String token, int id) async {
    if (await networkInfo.isConnected) {
      try {
        final addOrDeleteFavResponse =
            await favApiService.addOrDeleteFavApi(token, id);
        return Right(addOrDeleteFavResponse);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
