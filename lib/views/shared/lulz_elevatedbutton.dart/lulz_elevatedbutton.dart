import 'package:booba2/helpers/lulz_imports.dart';
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
  })  : _text = text,
        _onPressed = onPressed,
        _textColor = textColor,
        super(key: key);

  final String _text;
  final VoidCallback _onPressed;
  final Color? _textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed,
      child: Text(
        _text,
        style: Get.textTheme.button?.copyWith(
          color: _textColor ?? LulzColors.whiteText,
          fontSize: LulzTextStyle().getL,
          fontWeight: FontWeight.w900,
        ),
      ),
      style: ElevatedButton.styleFrom(

          fixedSize: Size.fromHeight(55.h)),
    );
  }
}
