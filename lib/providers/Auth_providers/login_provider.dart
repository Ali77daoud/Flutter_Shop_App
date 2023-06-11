import 'package:agora_shop/models/Auth/login_model.dart';
import 'package:agora_shop/models/Auth/user_data_model.dart';
import 'package:agora_shop/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import '../../shared/errors/failures.dart';

class LoginProvider {
  final AuthRepository authRepository;

  LoginProvider(this.authRepository);

  Future<Either<Failure, UserDataModel>> call(LoginModel loginModel) async {
    return authRepository.postLogin(loginModel);
  }
}
