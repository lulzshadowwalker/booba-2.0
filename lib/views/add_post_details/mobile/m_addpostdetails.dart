import 'dart:typed_data';

import 'package:booba2/helpers/lulz_imports.dart';
import 'package:booba2/views/add_post_details/components/lulz_tag.dart';
import 'package:booba2/views/add_post_details/mobile/components/m_addpostdetails_appbar.dart';
import 'package:flutter/material.dart';

class MAddPostDetails extends StatelessWidget {
  MAddPostDetails(
      {

      /// TODO make [file] required
      Uint8List? file,
      Key? key})
      : _file = file,
        super(key: key);

  Uint8List? _file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AddPostDetailsAppBar(),
      body: SingleChildScrollView(
        child: LulzTag(
          text: 'Funny post',
          color: LulzColors.accent4,
        ),
      ),
    );
  }
}
