part of './lulz_imports.dart';

class LulzHelpers {
  /// for logging purposes
  static const String _className = 'Lulz Helpers';

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
    return math.Random().nextInt(max - min) + min;
  }

  static Future<Uint8List?> selectImage(ImageSource source) async {
    try {
      /// TODO (maybe) specifiy a lower [imageQuality] to compress the images before uploading to the cloud
      late ImageSource imageSource;
      await Get.bottomSheet(MImageSourceBottomSheet(
        onItemSelected: (source) => imageSource = source,
      ));
      XFile? image = await ImagePicker().pickImage(source: imageSource);
      const String errorMessage = 'No image selected';
      if (image == null) {
        handleError(
            snackbarTitle: errorMessage, error: errorMessage, name: _className);
        return null;
      }
      return image.readAsBytes();
    } catch (e) {
      handleError(
          snackbarTitle: 'Error selecting image',
          error: e.toString(),
          name: _className);
      return null;
    }
  }

  static double degToRad(double deg) {
    return deg * math.pi / 180;
  }
}
