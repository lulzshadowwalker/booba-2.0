import 'package:booba2/helpers/lulz_imports.dart';
import 'package:booba2/services/auth/auth_controller.dart';
import 'package:booba2/views/auth/mobile/signin/components/m_signin_form.dart';
import 'package:booba2/views/auth/mobile/signup/components/m_signup_form_step1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MSignUp extends StatelessWidget {
  const MSignUp({Key? key}) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              62.verticalSpace,

              /// Sign in Form
              const MSignUpFormStep1(),

              /// Kitties section
              Expanded(
                child: SizedBox(
                  width: 1.sw,
                  child: Image.asset(LulzImages.catDraw,
                      // width: 340.w,
                      // height: 405.17.h,
                      fit: BoxFit.cover,
                      alignment: Alignment.centerRight),
                ),
              ),
            ],
          )),
    );
  }
}
