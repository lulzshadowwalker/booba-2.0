import 'package:booba2/helpers/lulz_imports.dart';
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
        _maxSize = maxSize,
        _onPressed = onPressed,
        super(key: key);
  final String _text;
  final Size? _maxSize;
  final VoidCallback _onPressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: _onPressed,
      child: Text(_text),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      style: OutlinedButton.styleFrom(
        /// ? [fixedSized]'s width doesn't work properly idk why so this works for now
        minimumSize: _maxSize,
        maximumSize: _maxSize,
      ),
    );
  }
}
