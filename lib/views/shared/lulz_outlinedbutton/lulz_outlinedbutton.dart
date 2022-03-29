import 'package:booba2/views/shared/lulz_text/lulz_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LulzOutlinedButton extends StatelessWidget {
  const LulzOutlinedButton({
    Key? key,
    required String text,
    Color? textColor,
    Size? maxSize,
    required textWidth,
    required VoidCallback onPressed,
  })  : _text = text,
        _onPressed = onPressed,
        _textWidth = textWidth,
        super(key: key);
  final String _text;
  final VoidCallback _onPressed;
  final double _textWidth;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: _onPressed,
      child: LulzText(
        text: _text,
        textWidth: _textWidth,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      style: OutlinedButton.styleFrom(fixedSize: Size.fromHeight(41.h)),
    );
  }
}
