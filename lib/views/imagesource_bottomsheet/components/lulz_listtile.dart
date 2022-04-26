import '../../shared/lulz_text/lulz_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LulzListTile extends StatelessWidget {
  const LulzListTile(
      {required Icon leading,
      required LulzText title,
      VoidCallback? onTap,
      Key? key})
      : _leading = leading,
        _title = title,
        _onTap = onTap,
        super(key: key);

  final Icon _leading;
  final LulzText _title;
  final VoidCallback? _onTap;
  @override
  Widget build(BuildContext context) {
    /// Not using the built-in [ListTile] to get finer control
    return InkWell(
      onTap: _onTap,
      child: Row(
        children: [
          _leading,
          10.horizontalSpace,
          _title,
        ],
      ),
    );
  }
}
