import 'package:agora_shop/models/Favourite/fav_data_model.dart';
import 'package:agora_shop/repositories/fav_repository.dart';
import 'package:agora_shop/shared/errors/failures.dart';
import 'package:dartz/dartz.dart';

class GetFavDataProvider {
  final FavRepository favRepository;

  GetFavDataProvider(this.favRepository);

  Future<Either<Failure, FavDataModel>> call(
      {required String token, required String lang}) async {
    return favRepository.getFavData(token, lang);
  }
}
