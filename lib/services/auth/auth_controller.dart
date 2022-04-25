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
  void onInit() {
    /// [onReady] happens one frame after allocating the object in the memory aka [onInit]
    super.onInit();

    /// Wrapper
    _firebaseUser.bindStream(_auth.authStateChanges());

    /// Show suitable screen depending on the auth status
    ever(_firebaseUser, _setScreen);
  }

  /// auth/home screen depending on auth state
  /// function callback in the [ever] worker or event
  _setScreen(User? currentUser) {
    currentUser == null
        ? Get.offAll(() => const MSignIn())
        : Get.offAll(() => const MHome());
  }

  /// State management, instead of passing parameters all over the place
  ///  ! make sure to reset those whenever navigating to other routes
  LulzUser userData = LulzUser.empty();
  set userEmail(String email) => userData.email = email;
  set userPassword(String password) => userData.password = password;
  set userUsername(String username) => userData.username = username;
  set userProfilePicture(Uint8List profilePictureData) =>
      userData.profilePictureData = profilePictureData;
  void resetUserData() => userData = LulzUser.empty();

  void signIn() async {
    /// [catchError] instead of a [try-catch] block, a little cleaner
    _auth
        .signInWithEmailAndPassword(
          /// this is handled in the sign in form so I can use `!`, even if not
          ///  I'd want to through an exception ofc
          email: userData.email!,
          password: userData.password!,
        )
        .then((_) => Get.snackbar('Sign in successful!', ''))
        .catchError((error) {
      LulzHelpers.handleError(
          snackbarTitle: 'Error signing up', error: error, name: _className);
    });
  }

  void signUp() async {
    _auth
        .createUserWithEmailAndPassword(
      /// this is anyway being handled in the sign up form
      email: userData.email ?? '',
      password: userData.password ?? '',
    )
        .then((result) async {
      String? userId = result.user?.uid;
      if (userId == null) {
        /// it will probably automatically throw an exception is [uid] is null
        /// but just in case
        throw Exception('userId is null');
      }

      await _database.registerNewUser(
        userId: userId,

        /// I dont wanna save anything if the value was null, even though is handled in
        ///  the sign up form
        email: userData.email!,
        password: userData.password!,
        username: userData.password!,
        profilePicture: userData.profilePictureData!,
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

  User? get getUser => _auth.currentUser;
  static User? get currentUser => _auth.currentUser;

  

  ///  END AUTH_CONTROLLER
}
