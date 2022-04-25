import 'dart:typed_data';

import 'package:booba2/helpers/lulz_imports.dart';
import 'package:booba2/services/auth/auth_controller.dart';
import 'package:booba2/services/storage/storage_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

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
  static const String _dataCreated = 'dateCreated';
  static const String _datePublished = 'datePublished';
  static const String _title = 'title';
  static const String _postId = 'postId';
  static const String _likes = 'likes';
  static const String _ownerId = 'ownerId';
  static const String _posts = 'posts';
  static const String _downloadUrl = 'downloadUrl';

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
        _profilePicture: profilePictureDownloadUrl,
        _dataCreated: DateTime.now(),
        _posts: [],
      });

      Get.snackbar('Upload successful!', '');
    } catch (e) {
      LulzHelpers.handleError(
          snackbarTitle: 'error signing up',
          error: e.toString(),
          name: _className);
    }
  }

  Future<void> updateUserData({
    required String? userId,
    required Map<String, Object?> data,
  }) async =>
      await _firestore.collection(_usersCollection).doc(userId).update(data);

  /// you have to provide the title even if it ends up being null
  Future<void> addPost({
    required String? title,
    required Uint8List file,
  }) async {
    try {
      String downloadUrl =
          await StorageController.upload(childName: _posts, file: file);
      final String postId = const Uuid().v4();

      final String? ownerId = Get.find<AuthController>().getUser?.uid;

      /// leaving the [doc]'s [path] argument null, would auto generate a random id but I want to keep track of it
      await _firestore.collection(_posts).doc(postId).set({
        _datePublished: DateTime.now(),
        _title: title,
        _likes: [],
        _postId: postId,
        _ownerId: ownerId,
        _downloadUrl: downloadUrl,
      });

      await DatabaseController().updateUserData(userId: ownerId, data: {
        'posts': FieldValue.arrayUnion([
          {postId: downloadUrl}
        ]),
      });
    } catch (e) {
      LulzHelpers.handleError(
          snackbarTitle: 'error uploading image',
          error: e.toString(),
          name: _className);
    }
  }

  Stream<List<LulzPost>> getPosts() {
    return _firestore.collection(_posts).snapshots().map((querySnapshot) {
      List<LulzPost> postsList = [];
      querySnapshot.docs.forEach((e) {
        postsList.add(LulzPost.fromDocumentSnapshot(e));
      });
      return postsList;
    });
  }

  Stream<LulzUser> getCurrentUserData() {
    String? userId = Get.find<AuthController>().getUser?.uid;

    return _firestore
        .collection(_usersCollection)
        .doc(userId)
        .snapshots()
        .map(LulzUser.fromDocumentSnapshot);
  }
}
