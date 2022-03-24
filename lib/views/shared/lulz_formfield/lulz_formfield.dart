import 'package:booba2/helpers/lulz_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LulzFormField extends StatelessWidget {
  const LulzFormField({
    Key? key,
    required TextEditingController controller,
    required String hintText,
    required Icon prefixIcon,
    BoxConstraints? constraints,
    TextInputType? keyboardType,
    bool? obscureText,
  })  : _controller = controller,
        _hintText = hintText,
        _prefixIcon = prefixIcon,
        _constraints = constraints,
        _keyboardType = keyboardType,
        _obscureText = obscureText,
        super(key: key);

  final TextEditingController _controller;
  final String _hintText;
  final Icon _prefixIcon;
  final BoxConstraints? _constraints;
  final TextInputType? _keyboardType;
  final bool? _obscureText;

  /// TODO add a callback to tell the parent widget about the validation evaluation
  /// TODO add a shadow effect, psimple ( https://stackoverflow.com/questions/62066259/adding-shadow-to-inside-of-text-field-flutter )
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorWidth: 5,
      cursorColor: LulzColors.accent3,
      textAlign: TextAlign.start,
      style: LulzTextStyle.button?.copyWith(color: LulzColors.backgroundDark),
      controller: _controller,
      keyboardType: _keyboardType,
      obscureText: _obscureText ?? false,
      decoration: InputDecoration(
        constraints: _constraints,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0.r)),
        contentPadding: const EdgeInsets.only(top: 10),
        hintText: _hintText,
        prefixIcon: _prefixIcon,
        focusColor: Colors.red,
      ),
    );
  }
}
