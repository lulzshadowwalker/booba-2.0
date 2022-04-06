import 'package:booba2/helpers/lulz_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LulzFormField extends StatelessWidget {
  LulzFormField({
    Key? key,
    required TextEditingController controller,
    required String hintText,
    Icon? prefixIcon,
    BoxConstraints? constraints,
    TextInputType? keyboardType,
    bool? obscureText,
    GlobalKey? formFieldKey,
    String? Function(String? input)? validator,
    Function(String value)? onChanged,
    int? maxLines,
    Color? color,
  })  : _controller = controller,
        _hintText = hintText,
        _prefixIcon = prefixIcon,
        _constraints = constraints,
        _keyboardType = keyboardType,
        _obscureText = obscureText,
        _validator = validator,
        _formFieldKey = formFieldKey,
        _onChanged = onChanged,
        _maxLines = maxLines,
        _color = color ?? LulzColors.accent3,
        super(key: key);

  final TextEditingController _controller;
  final String _hintText;
  final Icon? _prefixIcon;
  final BoxConstraints? _constraints;
  final TextInputType? _keyboardType;
  final bool? _obscureText;
  final String? Function(String? input)? _validator;
  final GlobalKey? _formFieldKey;
  final Function(String value)? _onChanged;
  final int? _maxLines;
  final Color _color;

  /// TODO add a shadow effect, psimple ( https://stackoverflow.com/questions/62066259/adding-shadow-to-inside-of-text-field-flutter )
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.bottom,
      maxLines: _maxLines == null ? 1 : _maxLines,
      key: _formFieldKey,
      validator: _validator,
      cursorWidth: 5,
      cursorColor: _color,
      style: LulzTextStyle.button?.copyWith(
          color: LulzColors.backgroundDark,
          fontSize: LulzTextStyle().getMd,
          overflow: TextOverflow.ellipsis),
      controller: _controller,
      keyboardType: _keyboardType,
      obscureText: _obscureText ?? false,
      onChanged: _onChanged,

      /// decoration
      decoration: InputDecoration(
        constraints: _constraints,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0.r)),
        // contentPadding: const EdgeInsets.all(0),
        hintText: _hintText,
        hintStyle: LulzTextStyle.button?.copyWith(
            color: LulzColors.accent3, fontSize: LulzTextStyle().getMd),
        prefixIcon: Padding(
            padding: _prefixIcon == null
                ? const EdgeInsets.symmetric(horizontal: 10)
                : const EdgeInsets.only(left: 20, right: 10),
            child: _prefixIcon),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0.r),
          borderSide: BorderSide(
            color: _color,
          ),
        ),
      ),
    );
  }
}
