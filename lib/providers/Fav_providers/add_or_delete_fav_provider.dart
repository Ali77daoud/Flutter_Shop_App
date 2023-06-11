import 'package:agora_shop/repositories/fav_repository.dart';
import 'package:agora_shop/shared/errors/failures.dart';
import 'package:dartz/dartz.dart';

class AddOrDeleteFavProvider {
  final FavRepository favRepository;

  AddOrDeleteFavProvider(this.favRepository);

  Future<Either<Failure, String>> call(
      {required String token, required int id}) async {
    return favRepository.addOrDeleteFav(token, id);
  }
}
