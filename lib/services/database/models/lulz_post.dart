part of '../../../helpers/lulz_imports.dart';

class LulzPost {
  // datetime
  String? downloadUrl;
  List<String>? likes;
  String? ownerId;
  String? postId;
  String? title;

  /// TODO make all string constants centralized

  LulzPost({
    required this.downloadUrl,
    required this.likes,
    required this.ownerId,
    required this.postId,
    required this.title,
  });

  LulzPost.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    downloadUrl = snapshot['downloadUrl'];
    likes = snapshot['likes'];
    ownerId = snapshot['ownerId'];
    postId = snapshot['postId'];
    title = snapshot['title'];
  }
}
