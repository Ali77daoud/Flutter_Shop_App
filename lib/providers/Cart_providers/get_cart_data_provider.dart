import 'package:agora_shop/models/Cart/cart_data_model.dart';
import 'package:agora_shop/repositories/cart_repository.dart';
import 'package:agora_shop/shared/errors/failures.dart';
import 'package:dartz/dartz.dart';

class GetCartDataProvider {
  final CartRepository cartRepository;

  GetCartDataProvider(this.cartRepository);

  Future<Either<Failure, CartDataModel>> call(
      {required String token, required String lang}) async {
    return await cartRepository.getCartData(token, lang);
  }
}
