import 'package:agora_shop/models/products/ProductModel.dart';
import 'package:agora_shop/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';
import '../../shared/errors/failures.dart';

class GetProductsProvider {
  final ProductRepository productRepository;

  GetProductsProvider(this.productRepository);

  Future<Either<Failure, List<ProductModel>>> call(
      {required String token}) async {
    return productRepository.getProducts(token: token);
  }
}
