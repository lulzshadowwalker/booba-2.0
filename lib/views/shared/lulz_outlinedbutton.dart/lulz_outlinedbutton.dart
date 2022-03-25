import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LulzOutlinedButton extends StatelessWidget {
  const LulzOutlinedButton({
    Key? key,
    required String text,
    Color? textColor,
    Size? maxSize,
    required VoidCallback onPressed,
  })  : _text = text,
        _onPressed = onPressed,
        super(key: key);
  final String _text;
  final VoidCallback _onPressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: _onPressed,
      child: Text(_text),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      style: OutlinedButton.styleFrom(fixedSize: Size.fromHeight(55.h)),
    );
  }
}
