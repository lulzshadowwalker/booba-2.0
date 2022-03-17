part of './lulz_imports.dart';

class LulzHelpers {
    /// utility function
  static void handleError({
    required String snackbarTitle,
    required dynamic error,
    required String name,
    String? snackbarBody,
  }) {
    snackbarBody ??= 'Try again'; 

    Get.snackbar(
      snackbarTitle, snackbarBody,
      snackPosition: SnackPosition.BOTTOM,

      /// SnackPosition is a little bugged and maybe feels out of place
    );
    dev.log(snackbarTitle, error: error, name: name);
  }
}