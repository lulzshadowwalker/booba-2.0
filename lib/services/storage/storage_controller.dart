import 'dart:typed_data';

import 'package:booba2/helpers/lulz_imports.dart';
import 'package:booba2/services/auth/auth_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class StorageController {
  static final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  static const String _className = 'LulzStorage';

  static Future<String> upload({
    required String childName,
    required Uint8List file,
  }) async {
    try {
      String? userId = AuthController.currentUser?.uid;

      final String fileId = const Uuid().v4();

      // Reference reference =
      //     _firebaseStorage.ref().child(userId!).child(childName).child(fileId);

      /// ! REMOVE THIS, TESTING PURPOSES
      Reference reference = _firebaseStorage
          .ref()
          .child('asldkadkas')
          .child(childName)
          .child(fileId);

      TaskSnapshot snapshot = await reference.putData(file);

      /// TODO add this post to firestore users/posts collections
      ///  return [downloadUrl] and [postId]
      final String downloadUrl = await snapshot.ref.getDownloadURL();
      Get.snackbar('Upload successful!', '');
      return downloadUrl;
    } catch (e) {
      LulzHelpers.handleError(
          snackbarTitle: 'Unable to upload to storage',
          error: e.toString(),
          name: _className);

      /// this is only for the developers so it should be fine, maybe even better
      return e.toString();
    }
  }
}
