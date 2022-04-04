import 'dart:typed_data';

import 'package:booba2/services/database/database_controller.dart';
import 'package:booba2/views/auth/mobile/signin/m_signin.dart';
import 'package:booba2/views/home/mobile/m_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../helpers/lulz_imports.dart';

/// TODO use [try-catch] blocks instead of [then-catchError] as they're a little
///  buggy and the execution stops on exceptions or maybe [onError] as it is
///  "a more precisely typed version of catchError"
///  https://stackoverflow.com/questions/67458952/where-is-the-difference-between-onerror-and-catcherror-in-dart#:~:text=onError%20is%20effectively%20a%20more,just%20a%20Function%20with%20catchError%20.
///  https://stackoverflow.com/questions/56802675/dart-flutter-debugger-stops-on-caught-exceptions
class AuthController extends GetxController {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseController _database = DatabaseController();

  final Rx<User?> _firebaseUser = Rx<User?>(_auth.currentUser);

  /// String constants
  static const String _className = 'AuthController';

  @override
  void onReady() {
    /// [onReady] happens one frame after allocating the object in the memory aka [onInit]
    super.onReady();

    _firebaseUser.bindStream(_auth.authStateChanges());

    /// Show suitable screen depending on the auth status
    ever(_firebaseUser, _setScreen);
  }

  /// auth/home screen depending on auth state
  /// function callback in the [ever] worker or event
  _setScreen(User? currentUser) {
    currentUser == null
        ? Get.offAll(() => MSignIn())
        : Get.offAll(() => const MHome());
  }

  void signIn(String email, String password) async {
    /// [catchError] instead of a [try-catch] block, a little cleaner
    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((_) => Get.snackbar('Sign in successful!', ''))
        .catchError((error) {
      LulzHelpers.handleError(
          snackbarTitle: 'Error signing up', error: error, name: _className);
    });
  }

  void signUp({
    required String email,
    required String password,
    required String username,
    required Uint8List profilePicture,
  }) async {
    _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((result) async {
      String? userId = result.user?.uid;
      if (userId == null) {
        /// it will probably automatically throw an exception is [uid] is null
        /// but just in case
        throw Exception('userId is null');
      }

      await _database.registerNewUser(
        userId: userId,
        email: email,
        password: password,
        username: username,
        profilePicture: profilePicture,
      );

      Get.snackbar('Sign up successful!', '');
    }).catchError((error) {
      LulzHelpers.handleError(
          snackbarTitle: 'Error signing up', error: error, name: _className);
    });
  }

  void signOut() async {
    _auth
        .signOut()
        .then((_) => Get.snackbar('Sign out successful!', ''))
        .catchError((error) {
      LulzHelpers.handleError(
          snackbarTitle: 'Error signing out', error: error, name: _className);
    });
  }

  static User? get currentUser => _auth.currentUser;
}///  END AUTH_CONTROLLER
