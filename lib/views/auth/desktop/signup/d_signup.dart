import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../helpers/lulz_imports.dart';

class DSignUp extends StatelessWidget {
  const DSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: LulzConst.dSize,
      builder: () => Scaffold(
        body: Column(
          children: [
            /// body
            const Expanded(flex: 7, child: DSignUpBody()),
            
            /// footer
            Expanded(flex: 3, child: Container(color: LulzColors.whiteCatDraw)),

          ],
        ),
      ),
    );
  }
}
