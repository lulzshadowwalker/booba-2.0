import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../helpers/lulz_imports.dart';
import '../../../../services/auth/auth_controller.dart';


class DSignIn extends StatelessWidget {
  const DSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: LulzConst.dSize,
      builder: () => Scaffold(
        body: Column(
          children: [
            /// header
            Expanded(flex: 3, child: Container(color: LulzColors.whiteCatDraw)),

            /// body
            const Expanded(
                flex: 7,
                child: DSignInBody()),
          ],
        ),
      ),
    );
  }
}
