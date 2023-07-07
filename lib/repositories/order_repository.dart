import 'package:agora_shop/services/networking/order_api_service.dart';
import 'package:agora_shop/shared/errors/exceptions.dart';
import 'package:agora_shop/shared/errors/failures.dart';
import 'package:agora_shop/shared/network_info/network_info.dart';
import 'package:dartz/dartz.dart';
import '../models/Orders/get_order_model.dart';

class OrdersRepository {
  final OrdersApiService ordersApiService;
  final NetworkInfo networkInfo;

  OrdersRepository({required this.ordersApiService, required this.networkInfo});

  Future<Either<Failure, OrderModel>> getOrdersData(
      String token, String lang) async {
    if (await networkInfo.isConnected) {
      try {
        final addressDataResponse =
            await ordersApiService.getOrdersDataApi(token, lang);
        return Right(addressDataResponse);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
