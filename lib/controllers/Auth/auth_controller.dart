import 'package:agora_shop/models/Auth/login_model.dart';
import 'package:agora_shop/models/Auth/register_model.dart';
import 'package:agora_shop/models/Auth/user_data_model.dart';
import 'package:agora_shop/providers/Auth_providers.dart/login_provider.dart';
import 'package:agora_shop/providers/Auth_providers.dart/register_provider.dart';
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

  // void errorHandling(Failure failure) {
  //   switch (failure.runtimeType) {
  //     case WrongDataFailure:
  //       hideCircleIndicator();
  //       SnackBarWidgets.showFailureSnackBar(
  //           'Wrong Data', wrongDataFailureMessage);
  //       break;
  //     case ServerFailure:
  //       hideCircleIndicator();
  //       SnackBarWidgets.showFailureSnackBar(
  //           'Server Error', serverFailureMessage);
  //       break;
  //     case OfflineFailure:
  //       hideCircleIndicator();
  //       SnackBarWidgets.showFailureSnackBar(
  //           'No Connection', offlineFailureMessage);
  //       break;
  //     default:
  //       hideCircleIndicator();
  //       SnackBarWidgets.showFailureSnackBar(
  //           'Unexpected error', " Please try again later.");
  //       break;
  //   }
  // }

  Future<void> login({required LoginModel loginModel}) async {
    showCircleIndicator();
    final failureOrLogin = await loginProvider.call(loginModel);
    failureOrLogin.fold((failure) {
      HandlingErrors.networkErrorrHandling(
          failure: failure,
          hideCircleIndicator: hideCircleIndicator,
          showNoInternetPage: () {});
    }, (getUserData) {
      userData = getUserData;
      tokenBox.write('token', userData.token);
      isLogin = true;
      authBox.write('isLogin', isLogin);
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
    }, (getUserData) {
      userData = getUserData;
      tokenBox.write('token', userData.token);
      isLogin = true;
      authBox.write('isLogin', isLogin);
      hideCircleIndicator();
      Get.offAllNamed(Routes.mainPage);
      SnackBarWidgets.showSuccessSnackBar('SignUp Succeeded', '');
    });
  }

  //////////////////
  Future<void> logOut() async {
    await tokenBox.remove('token').then((value) async {
      isLogin = false;
      await authBox.write('isLogin', isLogin).then((value) {
        Get.offAllNamed(Routes.welcomePage);
      });
    });
  }
}
