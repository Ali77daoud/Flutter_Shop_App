import 'package:agora_shop/models/Cart/cart_data_model.dart';
import 'package:agora_shop/services/networking/cart_api_service.dart';
import 'package:agora_shop/shared/errors/exceptions.dart';
import 'package:agora_shop/shared/network_info/network_info.dart';
import 'package:dartz/dartz.dart';
import '../shared/errors/failures.dart';

class CartRepository {
  final CartApiService cartApiService;
  final NetworkInfo networkInfo;

  CartRepository({required this.cartApiService, required this.networkInfo});

  Future<Either<Failure, CartDataModel>> getCartData(
      String token, String lang) async {
    if (await networkInfo.isConnected) {
      try {
        final cartDataResponse =
            await cartApiService.getCartDataApi(token, lang);
        return Right(cartDataResponse);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, String>> addOrRemoveCart(
      String token, String lang, int id) async {
    if (await networkInfo.isConnected) {
      try {
        final addOrRemoveCartResponse =
            await cartApiService.addOrRemoveCartApi(token, lang, id);
        return Right(addOrRemoveCartResponse);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, String>> updateCart(
      String token, String lang, int id, int quantity) async {
    if (await networkInfo.isConnected) {
      try {
        final updateCartResponse =
            await cartApiService.updateCartApi(token, lang, id, quantity);
        return Right(updateCartResponse);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, String>> deleteCart(
      String token, String lang, int id) async {
    if (await networkInfo.isConnected) {
      try {
        final deleteCartResponse =
            await cartApiService.deleteCartApi(token, lang, id);
        return Right(deleteCartResponse);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
