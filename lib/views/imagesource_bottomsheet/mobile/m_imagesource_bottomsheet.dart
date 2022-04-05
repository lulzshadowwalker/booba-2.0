import 'package:booba2/views/imagesource_bottomsheet/components/lulz_listtile.dart';
import 'package:booba2/helpers/lulz_imports.dart';
import 'package:booba2/views/shared/lulz_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';

class MImageSourceBottomSheet extends StatelessWidget {
  MImageSourceBottomSheet(
      {required Function(ImageSource) onItemSelected, Key? key})
      : _onItemSelected = onItemSelected,
        super(key: key);

  final TextStyle? _optionStyle = LulzTextStyle.md?.copyWith(
    color: LulzColors.backgroundDark,
    fontWeight: FontWeight.w400,
  );

  final Function(ImageSource) _onItemSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 25.0),

      /// decoration
      decoration: BoxDecoration(
        color: LulzColors.whiteText,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
      ),

      /// content
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// * Header text
          LulzText(
              text: 'Upload Image',
              textWidth: 186,
              style: LulzTextStyle.l?.copyWith(
                  fontWeight: FontWeight.bold,

                  /// same color for dark/light mode
                  color: LulzColors.backgroundDark)),
          30.verticalSpace,

          /// * Gallery option
          LulzListTile(
              onTap: () => _onTap(ImageSource.gallery),
              leading: Icon(
                LineIcons.image,
                color: LulzColors.backgroundDark,
              ),
              title: LulzText(
                text: 'Gallery',
                textWidth: 59.w,
                style: _optionStyle,
              )),
          20.verticalSpace,

          /// * Camera option
          LulzListTile(
              onTap: () => _onTap(ImageSource.camera),
              leading: Icon(
                LineIcons.camera,
                color: LulzColors.backgroundDark,
              ),
              title: LulzText(
                text: 'Camera',
                textWidth: 66.w,
                style: _optionStyle,
              ))
        ],
      ),
    );
  }

  void _onTap(ImageSource imageSource) {
    /// TODO There is probably a better way utilizing GetX rather than passing stuff around
    _onItemSelected(imageSource);

    /// through testing, [Get.back()] does nothing if there is no previous page in the stack
    Get.back();
  }
}
