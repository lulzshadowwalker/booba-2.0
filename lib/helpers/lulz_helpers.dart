part of './lulz_imports.dart';

class LulzHelpers {
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

  static int randomNumberInRange({int? min, required int max}) {
    /// I don't like setting default values, in Dart at least 🙃
    min ??= 0;
    return math.Random().nextInt(max + 1) + min;
  }
}
