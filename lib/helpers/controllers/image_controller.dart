import 'dart:typed_data';

import 'package:get/get.dart';

class ImageController extends GetxController {
  Uint8List? _image;

  Uint8List? get getImage => _image;

  set setImage(Uint8List? image) {
    assert(image != null);
    _image = image;

    /// just like [notifyListeners]
    update();
  }
}
