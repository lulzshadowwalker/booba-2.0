import 'package:flutter/material.dart';

/// Responsive text
class LulzText extends StatelessWidget {
  const LulzText({
    Key? key,
    required String text,
    required double textWidth,
    TextStyle? style,
    EdgeInsetsGeometry? margin,
  })  : _text = text,
        _textWidth = textWidth,
        _style = style,
        _margin = margin,
        super(key: key);
  final String _text;
  final TextStyle? _style;
  final double _textWidth;
  final EdgeInsetsGeometry? _margin;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: _textWidth,
        margin: _margin,
        child: FittedBox(
            alignment: Alignment.centerLeft,
            child: Text(_text, style: _style)));
  }
}
