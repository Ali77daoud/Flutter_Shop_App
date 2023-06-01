import 'package:agora_shop/shared/errors/exceptions.dart';
import 'package:dartz/dartz.dart';
import '../models/categories/CategoryModel.dart';
import '../services/networking/category_api_service.dart';
import '../shared/errors/failures.dart';
import '../shared/network_info/network_info.dart';

class CategoryRepository {
  final CategoryApiService categoryApiService;
  final NetworkInfo networkInfo;

  CategoryRepository(
      {required this.categoryApiService, required this.networkInfo});

  Future<Either<Failure, List<CategoryModel>>> getCategories(
      {required String token}) async {
    if (await networkInfo.isConnected) {
      try {
        final categories = await categoryApiService.getCategoriesApi(token);
        return Right(categories);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
