import 'package:booba2/helpers/lulz_imports.dart';
import 'package:booba2/views/auth/desktop/signup/components/d_signup_form_step2.dart';
import 'package:booba2/views/shared/lulz_elevatedbutton.dart/lulz_elevatedbutton.dart';
import 'package:booba2/views/shared/lulz_formfield/lulz_formfield.dart';
import 'package:booba2/views/shared/lulz_outlinedbutton.dart/lulz_outlinedbutton.dart';
import 'package:booba2/views/shared/lulz_text/lulz_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DSignUpFormStep1 extends StatelessWidget {
  DSignUpFormStep1({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final double _leadingIconSize = 28.0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          158.verticalSpace, // 1
          LulzText(
            text: 'SIGN UP',
            textWidth: 371.w,
            style: LulzTextStyle.xl3,
          ), // 2
          7.verticalSpace, // 3
          /// Email field
          LulzFormField(
            controller: _emailController,
            hintText: 'Email',
            prefixIcon: Icon(
              Icons.email_rounded,
              size: _leadingIconSize,
            ),
            constraints: BoxConstraints(maxHeight: 55.h),
            keyboardType: TextInputType.emailAddress,
            validator: (value) => GetUtils.isEmail(value ?? '') == false
                ? 'fkin lazy programmer'
                : null,
          ), // 4

          24.verticalSpace, // 5
          /// Password field
          LulzFormField(
            controller: _passwordController,
            hintText: 'Password',
            prefixIcon: Icon(
              Icons.lock_rounded,
              size: _leadingIconSize,
            ),
            constraints: BoxConstraints(maxHeight: 55.h),
            obscureText: true,
            validator: (value) =>

                ///Password must be chonki
                (value ?? '').length <= 8 ? "Who do fuk wrote this code" : null,
          ), // 6
          24.verticalSpace, // 7

          // Sign in/up buttons
          Row(
            children: [
              /// Sign in button
              Expanded(
                flex: 2,
                child: LulzElevatedButton(
                  text: 'Step 2 / 2',
                  textWidth: 123.w,
                  textColor: LulzColors.backgroundDark,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                    Get.to(
                      () => DSignUpFormStep2(
                        email: _emailController.text.trim(),
                        password: _passwordController.text,
                      ),
                    );
                  },
                ),
              ), // 1
              14.4.horizontalSpace, // 2

              /// Sign up button
              Expanded(
                child: LulzOutlinedButton(
                  text: 'Sign in ?',
                  textWidth: 106.w,
                  onPressed: () => Get.to(() => const DSignIn()),
                ),
              ) // 3
            ],
          ), // 8
        ],
      ),
    );
  }
}
