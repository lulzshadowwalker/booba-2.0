import 'package:booba2/services/database/controllers/posts_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestFeed extends StatelessWidget {
  TestFeed({Key? key}) : super(key: key);

  int length = -1;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: GetX(
            init: Get.put(PostsController()),
            builder: (PostsController _) {
              return PageView.builder(
                itemCount: _.getPosts.length,
                itemBuilder: (context, index) => Container(
                    height: 150,
                    width: 100,
                    child: CachedNetworkImage(
                        imageUrl: _.getPosts[index]?.downloadUrl ??
                            'https://images.unsplash.com/photo-1594322436404-5a0526db4d13?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=829&q=80')),
              );
            }));
  }
}
