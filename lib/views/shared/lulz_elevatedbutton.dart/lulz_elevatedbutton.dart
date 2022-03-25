import 'package:booba2/helpers/lulz_imports.dart';
import 'package:booba2/views/shared/lulz_text/lulz_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LulzElevatedButton extends StatelessWidget {
  const LulzElevatedButton({
    Key? key,
    required String text,
    Color? textColor,
    Size? maxSize,
    required VoidCallback onPressed,
    required double textWidth,
  })  : _text = text,
        _onPressed = onPressed,
        _textColor = textColor,
        _textWidth = textWidth,
        super(key: key);

  final String _text;
  final VoidCallback _onPressed;
  final Color? _textColor;
  final double _textWidth;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed,
      child: LulzText(
        text: _text,
        textWidth: _textWidth,
        style: Get.textTheme.button?.copyWith(
          color: _textColor ?? LulzColors.whiteText,
          fontSize: LulzTextStyle().getL,
          fontWeight: FontWeight.w900,
        ),
      ),
      style: ElevatedButton.styleFrom(fixedSize: Size.fromHeight(55.h)),
    );
  }
}
