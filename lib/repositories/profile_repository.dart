import 'package:agora_shop/models/Auth/update_profile_model.dart';
import 'package:agora_shop/models/Auth/user_data_model.dart';
import 'package:agora_shop/services/networking/profile_api_service.dart';
import 'package:agora_shop/shared/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../shared/errors/exceptions.dart';
import '../shared/network_info/network_info.dart';

class ProfileRepository {
  final ProfileApiService profileApiService;
  final NetworkInfo networkInfo;

  ProfileRepository(
      {required this.profileApiService, required this.networkInfo});

  Future<Either<Failure, UserModel>> updateProfile(
      UpdateProfileModel updateProfileModel, String token, String lang) async {
    if (await networkInfo.isConnected) {
      try {
        final updateProfileResponse = await profileApiService.updateProfileApi(
            updateProfileModel, token, lang);
        return Right(updateProfileResponse);
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
  Future<Either<Failure, UserDataModel>> getUserData(
      String token, String lang) async {
    if (await networkInfo.isConnected) {
      try {
        final userDataResponse =
            await profileApiService.getUserDataApi(token, lang);
        return Right(userDataResponse);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
