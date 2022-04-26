import 'package:flutter/material.dart';

import '../../../helpers/lulz_imports.dart';

class LulzTag extends StatelessWidget {
  const LulzTag({
    required Color? color,
    required String text,
    Key? key,
  })  : _color = color,
        _text = text,
        super(key: key);

  /// TODO handle null value and use a random color
  ///  and allow colors within only withing a certain range
  final Color? _color;
  final String _text;

  String get getText => _text;
  @override
  Widget build(BuildContext context) {
    return Container(

        /// decoration
        decoration: BoxDecoration(
          color: _color?.withOpacity(0.3),
          borderRadius: BorderRadius.circular(25),
        ),

        /// content
        child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
            child: Text(_text.toLowerCase(),
                style: LulzTextStyle.md?.copyWith(color: _color))));
  }
}
