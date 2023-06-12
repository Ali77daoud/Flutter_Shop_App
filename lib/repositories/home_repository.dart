import 'package:agora_shop/models/HomeData/category_data_model.dart';
import 'package:agora_shop/models/HomeData/product_details_model.dart';
import 'package:agora_shop/services/networking/home_api_service.dart';
import 'package:dartz/dartz.dart';
import '../models/HomeData/home_data_model.dart';
import '../models/HomeData/search_product_data_model.dart';
import '../shared/errors/exceptions.dart';
import '../shared/errors/failures.dart';
import '../shared/network_info/network_info.dart';

class HomeRepository {
  final HomeApiService homeApiService;
  final NetworkInfo networkInfo;

  HomeRepository({required this.homeApiService, required this.networkInfo});

  Future<Either<Failure, HomeDataModel>> getHomeData(
      String token, String lang) async {
    if (await networkInfo.isConnected) {
      try {
        final homeDataResponse =
            await homeApiService.getHomeDataApi(token, lang);
        return Right(homeDataResponse);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, CategoryDataModel>> getCategoryData(
      String token, String lang) async {
    if (await networkInfo.isConnected) {
      try {
        final categoryDataResponse =
            await homeApiService.getCategoryDataApi(token, lang);
        return Right(categoryDataResponse);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, ProductDetailsModel>> getProductDetails(
      String token, String lang, int id) async {
    if (await networkInfo.isConnected) {
      try {
        final productDetailsResponse =
            await homeApiService.getProductDetailsApi(token, lang, id);
        return Right(productDetailsResponse);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, SearchProductDataModel>> searchProduct(
      String token, String lang, String text) async {
    if (await networkInfo.isConnected) {
      try {
        final searchProductResponse =
            await homeApiService.searchProductApi(token, lang, text);
        return Right(searchProductResponse);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
