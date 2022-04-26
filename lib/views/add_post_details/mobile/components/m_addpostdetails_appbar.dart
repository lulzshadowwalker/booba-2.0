import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../../shared/lulz_shared.dart';

class AddPostDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const AddPostDetailsAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// I don't want a generic purposes custom app bar
    return AppBar(
      leading: IconButton(
          onPressed: () => Get.back(), icon: const Icon(LineIcons.angleLeft)),
      centerTitle: false,
      title: LulzText(text: 'Upload post', textWidth: 102.w),
      elevation: 8,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
