import 'package:agora_shop/models/Address/add_address_model.dart';
import 'package:dartz/dartz.dart';
import '../../repositories/checkout_repository.dart';
import '../../shared/errors/failures.dart';

class AddAddressProvider {
  final CheckOutRepository addressRepository;

  AddAddressProvider(this.addressRepository);

  Future<Either<Failure, AddAddressModel>> call(
      {required AddAddress addAddress,
      required String token,
      required String lang}) async {
    return await addressRepository.addAddress(addAddress, token, lang);
  }
}
