import 'package:agora_shop/repositories/checkout_repository.dart';

import 'package:agora_shop/shared/errors/failures.dart';
import 'package:dartz/dartz.dart';

class AddOrderProvider {
  final CheckOutRepository addressRepository;

  AddOrderProvider(this.addressRepository);

  Future<Either<Failure, String>> call(
      {required String token,
      required String lang,
      required int addressId}) async {
    return await addressRepository.addOrder(token, lang, addressId);
  }
}
