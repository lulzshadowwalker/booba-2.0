import 'dart:typed_data';

import 'package:booba2/helpers/lulz_imports.dart';
import 'package:booba2/services/storage/storage_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DatabaseController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// * String constants
  static const String _usersCollection = 'users';
  static const String _email = 'email';
  static const String _password = 'password';
  static const String _username = 'username';
  static const String _status = 'status';
  static const String _profilePicture = 'profilePicture';
  static const String _className = 'DatabaseController';
  static const String _posts = 'posts';

  ///  add new user data on sign up [void] is cool
  Future<void> registerNewUser({
    required String userId,
    required String email,
    required String password,
    required String username,
    String? status,
    required Uint8List profilePicture,
  }) async {
    /// handling null values
    /// I don't like setting default values in the parameters :D
    status ??= '';

    try {
      String profilePictureDownloadUrl = await StorageController.upload(
          childName: _profilePicture, file: profilePicture);

      await _firestore.collection(_usersCollection).doc(userId).set({
        _email: email,
        _password: password,
        _username: username,
        _status: status,
        _profilePicture: profilePictureDownloadUrl
      });

      Get.snackbar('Upload successful!', '');
    } catch (e) {
      LulzHelpers.handleError(
          snackbarTitle: 'error uploading image',
          error: e.toString(),
          name: _className);
    }
  }
}
