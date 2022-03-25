import 'package:booba2/helpers/lulz_imports.dart';
import 'package:booba2/services/auth/auth_controller.dart';
import 'package:booba2/views/shared/lulz_elevatedbutton.dart/lulz_elevatedbutton.dart';
import 'package:booba2/views/shared/lulz_formfield/lulz_formfield.dart';
import 'package:booba2/views/shared/lulz_outlinedbutton.dart/lulz_outlinedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../signup/d_signup.dart';

class DSignInForm extends StatelessWidget {
  DSignInForm({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final double _leadingIconSize = 28.0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sign in/up buttons
          Row(
            children: [
              /// Sign in button
              Expanded(
                flex: 2,
                child: LulzElevatedButton(
                  text: 'Sign in',
                  textColor: LulzColors.backgroundDark,
                  textWidth: 349.w,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Get.find<AuthController>().signIn(
                          _emailController.text.trim(),
                          _passwordController.text);
                    }

                    _emailController.clear();
                    _passwordController.clear();
                  },
                ),
              ), // 1
              14.4.horizontalSpace, // 2

              /// Sign up button
              Expanded(
                child: LulzOutlinedButton(
                  text: 'Sign up ?',
                  onPressed: () => Get.to(() => const DSignUp()),
                ),
              ) // 3
            ],
          ), // 8
          24.verticalSpace, // 7

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
          24.verticalSpace, // 5

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
          7.verticalSpace, // 3

          Text('SIGN IN', style: LulzTextStyle.xl3), // 2
          60.verticalSpace, // 1
        ],
      ),
    );
  }
}
