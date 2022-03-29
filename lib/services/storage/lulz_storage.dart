import 'dart:typed_data';

import 'package:booba2/helpers/lulz_imports.dart';
import 'package:booba2/services/auth/auth_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';

class LulzStorage {
  static final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  static const String _className = 'LulzStorage';

  static Future<String> upload(
      {required String childName, required Uint8List file}) async {
    try {
      String? userId = AuthController.currentUser?.uid;

      Reference reference = _firebaseStorage.ref().child(childName).child(userId!);

      TaskSnapshot snapshot = await reference.putData(file);
      return snapshot.ref.getDownloadURL();
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
