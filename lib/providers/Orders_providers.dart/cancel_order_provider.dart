import 'package:agora_shop/repositories/order_repository.dart';
import 'package:agora_shop/shared/errors/failures.dart';
import 'package:dartz/dartz.dart';

class CancelOrderProvider {
  final OrdersRepository ordersRepository;

  CancelOrderProvider(this.ordersRepository);

  Future<Either<Failure, String>> call(
      {required String token,
      required String lang,
      required int orderId}) async {
    return await ordersRepository.cancelOrder(token, lang, orderId);
  }
}
