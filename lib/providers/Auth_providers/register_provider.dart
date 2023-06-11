import 'package:agora_shop/models/Auth/register_model.dart';
import 'package:agora_shop/models/Auth/user_data_model.dart';
import 'package:agora_shop/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import '../../shared/errors/failures.dart';

class RegisterProvider {
  final AuthRepository authRepository;

  RegisterProvider(this.authRepository);

  Future<Either<Failure, UserDataModel>> call(
      RegisterModel registerModel) async {
    return authRepository.postRegister(registerModel);
  }
}
