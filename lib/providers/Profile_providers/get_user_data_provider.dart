import 'package:agora_shop/models/Auth/user_data_model.dart';
import 'package:agora_shop/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import '../../shared/errors/failures.dart';

class GetUserDataProvider {
  final ProfileRepository profileRepository;

  GetUserDataProvider(this.profileRepository);

  Future<Either<Failure, UserDataModel>> call(
      {required String token, required String lang}) async {
    return profileRepository.getUserData(token, lang);
  }
}
