import 'package:booba2/helpers/lulz_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({required int length, required int activeIndex, Key? key})
      : _pagesLength = length,
        _activeIndex = activeIndex,
        super(key: key);

  final int _pagesLength;
  final int _activeIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _pagesLength,
        (index) {
          bool isActiveIndex = index == _activeIndex;

          return Container(
            margin: EdgeInsets.only(right: 10.w),
            height: 10.h,
            width: isActiveIndex ? 20.w : 10.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: isActiveIndex ? null : LulzColors.accent4,
              gradient: isActiveIndex ? LulzColors.gradient1 : null,
            ),
          );
        },
      ),
    );
  }
}
