import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LulzImageCard extends StatelessWidget {
  const LulzImageCard({required ImageProvider<Object> image, Key? key})
      : _image = image,
        super(key: key);

  final ImageProvider<Object> _image;
  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 4,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.r)),
        child: Container(
          height: 343.h,
          width: 294.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: _image,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
        ));
  }
}
