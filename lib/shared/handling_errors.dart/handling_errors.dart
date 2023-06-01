import 'package:agora_shop/shared/errors/failures.dart';
import '../constants/failure_messages.dart';
import '../widgets/snackbar_widgets.dart';

class HandlingErrors {
  static void networkErrorrHandling(
      {required Failure failure,
      required Function() hideCircleIndicator,
      Function()? showNoInternetPage}) {
    switch (failure.runtimeType) {
      case ServerFailure:
        hideCircleIndicator();
        showNoInternetPage!();
        SnackBarWidgets.showFailureSnackBar(
            'Server Error', serverFailureMessage);
        break;
      case OfflineFailure:
        hideCircleIndicator();
        showNoInternetPage!();
        SnackBarWidgets.showFailureSnackBar(
            'No Connection', offlineFailureMessage);
        break;
      default:
        hideCircleIndicator();
        showNoInternetPage!();
        SnackBarWidgets.showFailureSnackBar(
            'Unexpected error', unExpectedFailureMessage);
        break;
    }
  }
}
