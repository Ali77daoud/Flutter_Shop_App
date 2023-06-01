import 'package:agora_shop/models/products/ProductModel.dart';
import 'package:agora_shop/services/networking/product_api_service.dart';
import 'package:agora_shop/shared/errors/exceptions.dart';
import 'package:dartz/dartz.dart';
import '../shared/errors/failures.dart';
import '../shared/network_info/network_info.dart';

class ProductRepository {
  final ProductApiService productApiService;
  final NetworkInfo networkInfo;

  ProductRepository(
      {required this.productApiService, required this.networkInfo});

  Future<Either<Failure, List<ProductModel>>> getProducts(
      {required String token}) async {
    if (await networkInfo.isConnected) {
      try {
        final products = await productApiService.getProductsApi(token);
        return Right(products);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
