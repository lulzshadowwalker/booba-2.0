import '../../../helpers/lulz_imports.dart';
import '../lulz_text/lulz_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LulzElevatedButton extends StatelessWidget {
  const LulzElevatedButton({
    Key? key,
    required String text,
    Color? textColor,
    Color? backgroundColor,
    Size? maxSize,
    required VoidCallback onPressed,
    required double textWidth,
  })  : _text = text,
        _onPressed = onPressed,
        _textColor = textColor,
        _textWidth = textWidth,
        _backgroundColor = backgroundColor,
        _maxSize = maxSize,
        super(key: key);

  final String _text;
  final VoidCallback _onPressed;
  final Color? _textColor;
  final Color? _backgroundColor;
  final double _textWidth;
  final Size? _maxSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed,
      child: LulzText(
        text: _text,
        textWidth: _textWidth,
        style: Get.textTheme.button?.copyWith(
          color: _textColor ?? LulzColors.backgroundDark,
          fontSize: LulzTextStyle().getL,
          fontWeight: FontWeight.w900,
        ),
      ),
      style: ElevatedButton.styleFrom(
        /// why doesnt this fucking thing just work fucking hell, (im 100% sure it's not my fault 🙄 Kappa  )
        fixedSize: _maxSize ?? Size.fromHeight(41.h),
        primary: _backgroundColor,
      ),
    );
  }
}
