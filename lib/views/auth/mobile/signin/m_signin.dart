import 'package:booba2/helpers/lulz_imports.dart';
import 'package:booba2/views/shared/lulz_formfield/lulz_formfield.dart';
import 'package:booba2/views/shared/lulz_text/lulz_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MSignIn extends StatefulWidget {
  const MSignIn({Key? key}) : super(key: key);

  @override
  State<MSignIn> createState() => _MSignInState();
}

class _MSignInState extends State<MSignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Kitties section
                Container(
                  color: Colors.red,
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: Image.asset(
                      LulzImages.catDraw,
                      width: 340.w,
                      height: 405.17.h,
                      alignment: Alignment.centerRight,
                    ),
                  ),
                ),

                /// Sign in Form
                Container(
                  margin: EdgeInsets.only(left: 35.w),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LulzText(
                          text: 'SIGN IN',
                          textWidth: 233.w,
                          style: LulzTextStyle.xl2,
                        ),
                        LulzFormField(
                          controller: _emailController,
                          hintText: 'Email',
                          prefixIcon: const Icon(
                            Icons.email_rounded,
                          ),
                          constraints: BoxConstraints(
                              maxHeight: LulzConst.mFormFieldMaxHeight,
                              maxWidth: LulzConst.mFormFieldMaxWidth),
                        )
                      ]),
                )
              ],
            ),
          )),
    );
  }
}
