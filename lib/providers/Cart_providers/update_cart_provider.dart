import 'package:agora_shop/repositories/cart_repository.dart';
import 'package:agora_shop/shared/errors/failures.dart';
import 'package:dartz/dartz.dart';

class UpdateCartProvider {
  final CartRepository cartRepository;

  UpdateCartProvider(this.cartRepository);

  Future<Either<Failure, String>> call(
      {required String token,
      required String lang,
      required int id,
      required int quantity}) async {
    return cartRepository.updateCart(token, lang, id, quantity);
  }
}
