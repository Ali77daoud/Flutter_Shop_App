import 'package:agora_shop/models/Address/addresses_data_model.dart';
import 'package:agora_shop/services/networking/address_api_service.dart';
import 'package:agora_shop/shared/errors/exceptions.dart';
import 'package:dartz/dartz.dart';

import '../models/Address/add_address_model.dart';
import '../shared/errors/failures.dart';
import '../shared/network_info/network_info.dart';

class AddressRepository {
  final AddressApiService addressApiService;
  final NetworkInfo networkInfo;

  AddressRepository(
      {required this.addressApiService, required this.networkInfo});

  Future<Either<Failure, AddressesDataModel>> getAddressData(
      String token, String lang) async {
    if (await networkInfo.isConnected) {
      try {
        final addressDataResponse =
            await addressApiService.getAddressDataApi(token, lang);
        return Right(addressDataResponse);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, AddAddressModel>> addAddress(
      AddAddress addAddress, String token, String lang) async {
    if (await networkInfo.isConnected) {
      try {
        final addAddressResponse =
            await addressApiService.addAddressApi(addAddress, token, lang);
        return Right(addAddressResponse);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, String>> deleteAddress(
      int id, String token, String lang) async {
    if (await networkInfo.isConnected) {
      try {
        final deleteAddressResponse =
            await addressApiService.deleteAddressApi(id, token, lang);
        return Right(deleteAddressResponse);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
