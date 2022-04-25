import 'dart:typed_data';

import 'package:booba2/helpers/lulz_imports.dart';
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
    return
    //  TestFeed();

    FloatingActionButton(
      onPressed: _uploadPost,
      child: const Icon(Icons.add),
    );
  }

  Future<void> _uploadPost() async {
    _file = await LulzHelpers.selectImage(ImageSource.gallery);
    if (_file == null) {
      return;
    }
    Get.to(() => MAddPostDetails(file: _file!));
  }
}
