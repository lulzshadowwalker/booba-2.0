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
    GlobalKey? formFieldKey,
    String? Function(String? input)? validator,
  })  : _controller = controller,
        _hintText = hintText,
        _prefixIcon = prefixIcon,
        _constraints = constraints,
        _keyboardType = keyboardType,
        _obscureText = obscureText,
        _validator = validator,
        _formFieldKey = formFieldKey,
        super(key: key);

  final TextEditingController _controller;
  final String _hintText;
  final Icon _prefixIcon;
  final BoxConstraints? _constraints;
  final TextInputType? _keyboardType;
  final bool? _obscureText;
  final String? Function(String? input)? _validator;
  final GlobalKey? _formFieldKey;

  /// TODO add a shadow effect, psimple ( https://stackoverflow.com/questions/62066259/adding-shadow-to-inside-of-text-field-flutter )
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: _formFieldKey,
      validator: _validator,
      cursorWidth: 5,
      cursorColor: LulzColors.accent3,
      textAlign: TextAlign.start,
      style: LulzTextStyle.button?.copyWith(
          color: LulzColors.backgroundDark, fontSize: LulzTextStyle().getMd),
      controller: _controller,
      keyboardType: _keyboardType,
      obscureText: _obscureText ?? false,
      decoration: InputDecoration(
        constraints: _constraints,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0.r)),
        contentPadding: const EdgeInsets.only(top: 10),
        hintText: _hintText,
        hintStyle: LulzTextStyle.button?.copyWith(
            color: LulzColors.accent3, fontSize: LulzTextStyle().getMd),
        prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20, right: 8),
            child: _prefixIcon),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0.r),
          borderSide: BorderSide(
            color: LulzColors.accent3,
          ),
        ),
      ),
    );
  }
}
