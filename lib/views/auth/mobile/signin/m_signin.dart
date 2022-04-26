import '../../../../helpers/lulz_imports.dart';
import 'components/m_signin_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MSignIn extends StatelessWidget {
  const MSignIn({Key? key}) : super(key: key);
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
                    fit: BoxFit.fitHeight,
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
