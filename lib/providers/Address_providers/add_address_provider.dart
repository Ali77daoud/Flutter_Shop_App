import 'package:agora_shop/models/Address/add_address_model.dart';
import 'package:agora_shop/repositories/address_repository.dart';
import 'package:dartz/dartz.dart';
import '../../shared/errors/failures.dart';

class AddAddressProvider {
  final AddressRepository addressRepository;

  AddAddressProvider(this.addressRepository);

  Future<Either<Failure, AddAddressModel>> call(
      {required AddAddress addAddress,
      required String token,
      required String lang}) async {
    return await addressRepository.addAddress(addAddress, token, lang);
  }
}
