import 'dart:typed_data';

import 'package:booba2/helpers/lulz_imports.dart';
import 'package:booba2/services/auth/auth_controller.dart';
import 'package:booba2/services/database/database_controller.dart';
import 'package:booba2/services/storage/storage_controller.dart';
import 'package:booba2/views/add_post_details/components/lulz_tag.dart';
import 'package:booba2/views/add_post_details/mobile/components/m_addpostdetails_appbar.dart';
import 'package:booba2/views/add_post_details/mobile/controllers/tags_controller.dart';
import 'package:booba2/views/feed/mobile/m_feed.dart';
import 'package:booba2/views/home/mobile/m_home.dart';
import 'package:booba2/views/shared/lulz_elevatedbutton/lulz_elevatedbutton.dart';
import 'package:booba2/views/shared/lulz_formfield/lulz_formfield.dart';
import 'package:booba2/views/shared/lulz_imagecard.dart/lulz_imagecard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MAddPostDetails extends StatefulWidget {
  const MAddPostDetails({required Uint8List file, Key? key})
      : _file = file,
        super(key: key);

  final Uint8List _file;
  final String _className = 'MAddPostDetails';

  @override
  State<MAddPostDetails> createState() => _MAddPostDetailsState();
}

class _MAddPostDetailsState extends State<MAddPostDetails> {
  final TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  final String _posts = 'posts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AddPostDetailsAppBar(),
      body: SingleChildScrollView(
          child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(35.w, 15.h, 25.w, 50.h),
        child: Column(
          children: [
            25.verticalSpace,

            /// * Image card
            LulzImageCard(image: MemoryImage(widget._file)),
            30.verticalSpace,

            /// * Post Title
            LulzFormField(
              controller: _titleController,
              hintText: 'Tell us more..',
              onEditingComplete: _onEditingComplete,
              maxLines: 2,
              color: LulzColors.accent2,
            ),
            15.verticalSpace,

            /// * Tags
            GetX(
                init: TagsController(),
                builder: (TagsController _) => Wrap(
                    spacing: 15.w,
                    runSpacing: 15.w,
                    runAlignment: WrapAlignment.spaceEvenly,
                    alignment: WrapAlignment.spaceBetween,
                    children: _.tags
                        .map((e) => LulzTag(color: LulzColors.accent3, text: e))
                        .toList())),
            43.verticalSpace,

            /// * Publish button
            LulzElevatedButton(
              text: 'Publish',
              onPressed: () async => await _publish(),
              textWidth: 67.w,
              textColor: LulzColors.accent2,
              backgroundColor: LulzColors.accent2Transparent,
            )
          ],
        ),
      )),
    );
  }

  void _onEditingComplete() {
    /// TODO replace this with RegEx 🙃
    final String text = _titleController.text;
    String tag;
    int startIndex = 0, endIndex = 0;

    do {
      startIndex = text.indexOf('#', startIndex);
      if (startIndex == -1) {
        break;
      }
      endIndex = text.indexOf(' ', startIndex);
      if (endIndex == -1) {
        endIndex = text.length;
      }

      tag = text.substring(startIndex, endIndex).trim();
      Get.find<TagsController>().addTag(text: tag);

      startIndex = endIndex;
    } while (startIndex != 0);
  }

  Future<void> _publish() async {
    try {
      await DatabaseController().addPost(
        title: _titleController.text.trim(),
        file: widget._file,
      );

      /// if anything goes wrong, it's not gonna pop
      // [Get.back()] sometimes works and sometimes doesn't, found similar issues online but can't find a solouting ( same thing if I use [Navigator])
      Get.off(() => const MHome());
    } catch (e) {
      LulzHelpers.handleError(
          snackbarTitle: 'error uploading post!',
          error: e.toString(),
          name: widget._className);
    }
  }
}
