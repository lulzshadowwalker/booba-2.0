import 'package:booba2/helpers/lulz_imports.dart';
import 'package:booba2/services/auth/auth_controller.dart';
import 'package:booba2/views/auth/mobile/signin/components/m_signin_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MSignIn extends StatelessWidget {
  MSignIn({Key? key}) : super(key: key);

  /// TODO use Get put lazy instead ?
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: 1.sw,
          height: 1.sh,

          /// Background pattern
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(LulzImages.patternBase),
                  repeat: ImageRepeat.repeat)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Kitties section
              Expanded(
                child: RotatedBox(
                  quarterTurns: 2,
                  child: Image.asset(
                    LulzImages.catDraw,
                    // width: 340.w,
                    // height: 405.17.h,
                    fit: BoxFit.cover,
                    alignment: Alignment.centerRight,
                  ),
                ),
              ),

              /// Sign in Form
              const MSignInForm(),
              94.verticalSpace
            ],
          )),
    );
  }
}
