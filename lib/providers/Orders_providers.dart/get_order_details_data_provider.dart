import 'package:agora_shop/models/Orders/order_details_model.dart';
import 'package:agora_shop/repositories/order_repository.dart';
import 'package:dartz/dartz.dart';
import '../../shared/errors/failures.dart';

class GetOrderDetailsDataProvider {
  final OrdersRepository ordersRepository;

  GetOrderDetailsDataProvider(this.ordersRepository);

  Future<Either<Failure, GetOrderDetailsModel>> call(
      {required String token,
      required String lang,
      required int orderId}) async {
    return await ordersRepository.getOrderDetailsData(token, lang, orderId);
  }
}
