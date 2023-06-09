import 'package:agora_shop/models/Address/addresses_data_model.dart';
import 'package:agora_shop/repositories/checkout_repository.dart';
import 'package:dartz/dartz.dart';
import '../../shared/errors/failures.dart';

class GetAddressDataProvider {
  final CheckOutRepository addressRepository;

  GetAddressDataProvider(this.addressRepository);

  Future<Either<Failure, AddressesDataModel>> call(
      {required String token, required String lang}) async {
    return await addressRepository.getAddressData(token, lang);
  }
}
