import 'package:agora_shop/models/Orders/order_details_model.dart';
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
        final orderDataResponse =
            await ordersApiService.getOrdersDataApi(token, lang);
        return Right(orderDataResponse);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, GetOrderDetailsModel>> getOrderDetailsData(
      String token, String lang, int orderId) async {
    if (await networkInfo.isConnected) {
      try {
        final orderDetailsDataResponse =
            await ordersApiService.getOrderDetailsDataApi(token, lang, orderId);
        return Right(orderDetailsDataResponse);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, String>> cancelOrder(
      String token, String lang, int orderId) async {
    if (await networkInfo.isConnected) {
      try {
        final cancelOrderResponse =
            await ordersApiService.cancelOrderApi(token, lang, orderId);
        return Right(cancelOrderResponse);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
