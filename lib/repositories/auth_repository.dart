import 'package:agora_shop/models/Auth/register_model.dart';
import 'package:agora_shop/models/Auth/user_data_model.dart';
import 'package:agora_shop/shared/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../models/Auth/login_model.dart';
import '../services/networking/auth_api_service.dart';
import '../shared/errors/exceptions.dart';
import '../shared/network_info/network_info.dart';

class AuthRepository {
  final AuthApiService authApiService;
  final NetworkInfo networkInfo;

  AuthRepository({required this.authApiService, required this.networkInfo});

  Future<Either<Failure, UserDataModel>> postLogin(
      LoginModel loginModel) async {
    if (await networkInfo.isConnected) {
      try {
        final authResponse = await authApiService.postLoginApi(loginModel);
        return Right(authResponse);
      } on WrongDataException {
        return left(WrongDataFailure());
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  /////////////////////////////////
  Future<Either<Failure, UserDataModel>> postRegister(
      RegisterModel registerModel) async {
    if (await networkInfo.isConnected) {
      try {
        final authResponse =
            await authApiService.postRegisterApi(registerModel);
        return Right(authResponse);
      } on WrongDataException {
        return left(WrongDataFailure());
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
