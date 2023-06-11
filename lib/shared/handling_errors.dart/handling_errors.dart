import 'package:agora_shop/shared/errors/failures.dart';
import 'package:flutter/cupertino.dart';
import '../constants/failure_messages.dart';
import '../widgets/circle_indecator_widget.dart';
import '../widgets/no_connection_widget.dart';
import '../widgets/snackbar_widgets.dart';

class HandlingErrors {
  static void networkErrorrHandling(
      {required Failure failure,
      required Function() hideCircleIndicator,
      required Function() showNoInternetPage}) {
    switch (failure.runtimeType) {
      case ServerFailure:
        hideCircleIndicator();
        showNoInternetPage();
        SnackBarWidgets.showFailureSnackBar(
            'Server Error', serverFailureMessage);
        break;
      case OfflineFailure:
        hideCircleIndicator();
        showNoInternetPage();
        SnackBarWidgets.showFailureSnackBar(
            'No Connection', offlineFailureMessage);
        break;
      case WrongDataFailure:
        hideCircleIndicator();
        showNoInternetPage();
        SnackBarWidgets.showFailureSnackBar(
            'Wrong Data', wrongDataFailureMessage);
        break;
      default:
        hideCircleIndicator();
        showNoInternetPage();
        SnackBarWidgets.showFailureSnackBar(
            'Unexpected error', unExpectedFailureMessage);
        break;
    }
  }

  ////////////////////////
  static Widget pageErrorHandling({
    required bool isCircleShown,
    required bool isNoInternetConnection,
    required Widget page,
    required dynamic Function() onTapTry,
  }) {
    return isCircleShown
        ? const CircleIndicatorWidget(
            isBgWhite: true,
          )
        : isNoInternetConnection
            ? NoConnectionWidget(onTap: onTapTry)
            : page;
  }
}
