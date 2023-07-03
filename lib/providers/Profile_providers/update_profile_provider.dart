import 'package:agora_shop/models/Auth/update_profile_model.dart';
import 'package:agora_shop/models/Auth/user_data_model.dart';
import 'package:agora_shop/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import '../../shared/errors/failures.dart';

class UpdateProfileProvider {
  final ProfileRepository profileRepository;

  UpdateProfileProvider(this.profileRepository);

  Future<Either<Failure, UserModel>> call(
      {required UpdateProfileModel updateProfileModel,
      required String token,
      required String lang}) async {
    return await profileRepository.updateProfile(
        updateProfileModel, token, lang);
  }
}
