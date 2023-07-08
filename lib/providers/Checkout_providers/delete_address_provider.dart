import 'package:agora_shop/repositories/checkout_repository.dart';
import 'package:dartz/dartz.dart';
import '../../shared/errors/failures.dart';

class DeleteAddressProvider {
  final CheckOutRepository addressRepository;

  DeleteAddressProvider(this.addressRepository);

  Future<Either<Failure, String>> call(
      {required int id, required String token, required String lang}) async {
    return await addressRepository.deleteAddress(id, token, lang);
  }
}
