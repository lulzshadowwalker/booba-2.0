import 'package:booba2/helpers/lulz_imports.dart';
import 'package:booba2/services/auth/auth_controller.dart';
import 'package:booba2/views/auth/mobile/signin/m_signin.dart';
import 'package:booba2/views/auth/mobile/signup/components/m_signup_form_step2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../shared/lulz_shared.dart';

class MSignUpFormStep1 extends StatefulWidget {
  const MSignUpFormStep1({
    Key? key,
  }) : super(key: key);

  @override
  State<MSignUpFormStep1> createState() => _MSignUpForm();
}

class _MSignUpForm extends State<MSignUpFormStep1> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final BoxConstraints _formFieldConstraints = BoxConstraints(
      maxHeight: LulzConst.mFormFieldMaxHeight,
      maxWidth: LulzConst.mFormFieldMaxWidth);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 35.w),
      child: Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              /// Header text
              LulzText(
                text: 'SIGN UP',
                textWidth: 233.w,
                style: LulzTextStyle.xl2,
              ),
              2.verticalSpace,

              /// Email
              LulzFormField(
                controller: _emailController,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(
                  Icons.email_rounded,
                ),
                constraints: _formFieldConstraints,
                validator: (value) {
                  value ??= '';
                  return !GetUtils.isEmail(value)
                      ? 'Provide a valid email dumbass'
                      : null;
                },
              ),
              12.verticalSpace,

              /// Password
              LulzFormField(
                controller: _passwordController,
                hintText: 'Password',
                prefixIcon: const Icon(Icons.lock),
                obscureText: true,
                constraints: _formFieldConstraints,
                validator: (value) => GetUtils.isLengthLessThan(value, 8)
                    ? 'Password length must be at least 8!'
                    : null,
              ),
              69.verticalSpace,

              /// Sign in button
              LulzElevatedButton(
                  text: 'Step 2 / 2', onPressed: _step2, textWidth: 82.w),
              12.verticalSpace,

              /// Go to sign up page button
              LulzOutlinedButton(
                  text: 'Sign in ?',
                  textWidth: 75.w,
                  onPressed: () {
                    Get.find<AuthController>().resetUserData();
                    Get.off(() => const MSignIn());
                  })
            ]),
      ),
    );
  }

  void _step2() {
    if (_formKey.currentState!.validate()) {
      AuthController _authController = Get.find<AuthController>();
      _authController.userEmail = _emailController.text.trim();

      /// TODO: Better to use as-you-type textformatting instead of trimming
      _authController.userPassword = _passwordController.text.trim();
      Get.to(() => MSignUpFormStep2());
    }
  }
}
