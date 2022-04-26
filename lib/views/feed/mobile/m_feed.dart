import 'dart:typed_data';

import '../../../helpers/lulz_imports.dart';
import '../../add_post_details/mobile/m_addpostdetails.dart';
import 'components/feed_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

import '../../../services/database/controllers/posts_controller.dart';

class MFeed extends StatelessWidget {
  MFeed({Key? key}) : super(key: key);
  Uint8List? _file;
  @override
  Widget build(BuildContext context) {
    /// no need for [Scaffold], it's used within [MHome]
    return Scaffold(
      /// I can and probably should use a [Stack] instead because this page is inside [Home] which is a [Scaffold]
      floatingActionButton: FloatingActionButton(
        onPressed: _uploadPost,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: GetX(
          init: PostsController(),
          builder: (PostsController postsController) {
            List<LulzPost?> posts = postsController.getPosts;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: CustomScrollView(
                slivers: [
                  SliverWaterfallFlow(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Padding(
                            padding:
                                EdgeInsets.only(top: index % 2 == 1 ? 40.h : 0),
                            child: FeedCard(
                                imageUrl: posts[index]?.downloadUrl ??
                                    LulzImages.notFound,
                                title: posts[index]?.title ?? '',
                                profilePicture:
                                    posts[index]?.ownerProfilePicture ??
                                        LulzImages.notFound),
                          );
                        },
                        childCount: posts.length,
                      ),
                      gridDelegate:
                          SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 30.w,
                        mainAxisSpacing: 13.w,
                      ))
                ],
              ),
            );
          },
        ),
      ),
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
