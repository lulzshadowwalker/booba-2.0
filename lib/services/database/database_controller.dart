import 'dart:developer' as dev;
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

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

  ///  add new user data on sign up [void] is cool
  Future<void> registerNewUser({
    required String userId,
    required String email,
    required String password,
    required String username,
    String? status,
    Uint8List? profilePicture,
  }) async {
    /// handling null values
    ///- I don't like setting default values in the parameters :D
    status ??= '';

    try {
      await _firestore.collection(_usersCollection).doc(userId).set({
        _email: email,
        _password: password,
        _username: username,
        _status: status,
        _profilePicture:
            '404' // TODO Link to StorageController and get the download link and handle check for null
      });
    } catch (e) {
      dev.log(
        'error adding user to Firestore',
        name: _className,
        error: e.toString(),
      );
    }
  }
}
