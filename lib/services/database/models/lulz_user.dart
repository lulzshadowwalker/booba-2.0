part of '../../../helpers/lulz_imports.dart';

class LulzUser {
  String? email;
  Map<String, String>? posts;
  String? profilePicture;
  String? status;
  String? username;
  String? userId;

  /// [password] and [profilePictureData] is not to be stored in firestore, those are for statemanagement
  String? password;
  Uint8List? profilePictureData;

  // datetime

  /// TODO make all string constants centralized
  LulzUser.empty();

  LulzUser({
    required this.email,
    required this.posts,
    required this.profilePicture,
    required this.status,
    required this.username,
    required this.userId,
  });

  LulzUser.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    email = snapshot['email'];
    posts = snapshot['posts'];
    profilePicture = snapshot['profilePicture'];
    status = snapshot['status'];
    username = snapshot['username'];
    userId = snapshot['userId'];
  }

  void test() {}
}
