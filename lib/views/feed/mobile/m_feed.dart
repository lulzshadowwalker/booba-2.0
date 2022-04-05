import 'dart:typed_data';

import 'package:booba2/helpers/lulz_imports.dart';
import 'package:booba2/services/storage/storage_controller.dart';
import 'package:booba2/views/add_post_details/mobile/m_addpostdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MFeed extends StatelessWidget {
  MFeed({Key? key}) : super(key: key);
  Uint8List? _file;
  @override
  Widget build(BuildContext context) {
    /// no need for [Scaffold], it's used within [MHome]
    return FloatingActionButton(
      onPressed: _uploadPost,
      child: const Icon(Icons.add),
      // color /// TODO Different colors
    );
  }

  final String _posts = 'posts';
  Future<void> _uploadPost() async {
    _file = await LulzHelpers.selectImage(ImageSource.gallery);
    await Get.to(() => MAddPostDetails());

    /// I don't want to [assert] or null check because passing a null is handled in the [LulzStorage.upload] function
    /// TODO this should be done in the [MAddPostDetails] 
    await StorageController.upload(childName: _posts, file: _file!);
  }
}
