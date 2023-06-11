import 'package:agora_shop/repositories/cart_repository.dart';
import 'package:agora_shop/shared/errors/failures.dart';
import 'package:dartz/dartz.dart';

class AddOrRemoveCartProvider {
  final CartRepository cartRepository;

  AddOrRemoveCartProvider(this.cartRepository);

  Future<Either<Failure, String>> call(
      {required String token, required String lang, required int id}) async {
    return cartRepository.addOrRemoveCart(token, lang, id);
  }
}
