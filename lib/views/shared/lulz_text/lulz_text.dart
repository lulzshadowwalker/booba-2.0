import 'package:flutter/material.dart';

/// Responsive text
class LulzText extends StatelessWidget {
  const LulzText({
    Key? key,
    required String text,
    required double textWidth,
    TextStyle? style,
  })  : _text = text,
        _textWidth = textWidth,
        _style = style,
        super(key: key);
  final String _text;
  final TextStyle? _style;
  final double _textWidth;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: _textWidth,
        child: FittedBox(
            alignment: Alignment.centerLeft,
            child: Text(_text, style: _style)));
  }
}
