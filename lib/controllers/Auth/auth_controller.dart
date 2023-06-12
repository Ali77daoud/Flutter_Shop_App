import 'package:agora_shop/models/Auth/login_model.dart';
import 'package:agora_shop/models/Auth/register_model.dart';
import 'package:agora_shop/models/Auth/user_data_model.dart';
import 'package:agora_shop/providers/Auth_providers/login_provider.dart';
import 'package:agora_shop/providers/Auth_providers/register_provider.dart';
import 'package:agora_shop/shared/handling_errors.dart/handling_errors.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../routes/routes.dart';
import '../../shared/widgets/snackbar_widgets.dart';

class AuthController extends GetxController {
  bool isCircleShown = false;
  bool isLogin = false;

  GetStorage tokenBox = GetStorage();
  GetStorage authBox = GetStorage();
  GetStorage nameBox = GetStorage();
  GetStorage emailBox = GetStorage();

  late LoginProvider loginProvider = Get.find();
  late RegisterProvider registerProvider = Get.find();
  late UserDataModel userData;

/////////////////////////
  void showCircleIndicator() {
    isCircleShown = true;
    update();
  }

////////////////////////////
  void hideCircleIndicator() {
    isCircleShown = false;
    update();
  }

  Future<void> login({required LoginModel loginModel}) async {
    showCircleIndicator();
    final failureOrLogin = await loginProvider.call(loginModel);
    failureOrLogin.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideCircleIndicator,
          showNoInternetPage: () {});
    }, (getUserData) async {
      userData = getUserData;
      isLogin = true;
      Future.wait([
        tokenBox.write('token', userData.token),
        authBox.write('isLogin', isLogin),
        nameBox.write('name', userData.name),
        nameBox.write('email', userData.email),
      ]);
      hideCircleIndicator();
      Get.offAllNamed(Routes.mainPage);
      SnackBarWidgets.showSuccessSnackBar('Login Succeeded', '');
    });
  }

  ///////////////////
  Future<void> register({required RegisterModel registerModel}) async {
    showCircleIndicator();
    final failureOrLogin = await registerProvider.call(registerModel);
    failureOrLogin.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideCircleIndicator,
          showNoInternetPage: () {});
    }, (getUserData) async {
      userData = getUserData;
      isLogin = true;
      Future.wait([
        tokenBox.write('token', userData.token),
        authBox.write('isLogin', isLogin),
        nameBox.write('name', userData.name),
        nameBox.write('email', userData.email),
      ]);
      hideCircleIndicator();
      Get.offAllNamed(Routes.mainPage);
      SnackBarWidgets.showSuccessSnackBar('SignUp Succeeded', '');
    });
  }

  //////////////////
  Future<void> logOut() async {
    isLogin = false;
    Future.wait([tokenBox.remove('token'), authBox.write('isLogin', isLogin)]);
    Get.offAllNamed(Routes.welcomePage);
  }
}
