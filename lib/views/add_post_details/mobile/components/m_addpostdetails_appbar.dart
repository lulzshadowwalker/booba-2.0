import 'package:booba2/views/shared/lulz_shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class AddPostDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const AddPostDetailsAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () => Get.back(), icon: const Icon(LineIcons.angleLeft)),
      centerTitle: false,

      /// TODO change textwidth base on the design file
      title: const LulzText(text: 'New post', textWidth: 80),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
