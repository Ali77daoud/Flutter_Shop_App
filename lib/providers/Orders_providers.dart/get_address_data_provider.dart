import 'package:agora_shop/models/Orders/get_order_model.dart';
import 'package:agora_shop/repositories/order_repository.dart';
import 'package:dartz/dartz.dart';
import '../../shared/errors/failures.dart';

class GetOrdersDataProvider {
  final OrdersRepository ordersRepository;

  GetOrdersDataProvider(this.ordersRepository);

  Future<Either<Failure, OrderModel>> call(
      {required String token, required String lang}) async {
    return await ordersRepository.getOrdersData(token, lang);
  }
}
