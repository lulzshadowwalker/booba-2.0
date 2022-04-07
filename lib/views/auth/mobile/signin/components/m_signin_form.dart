import 'package:booba2/helpers/lulz_imports.dart';
import 'package:booba2/services/auth/auth_controller.dart';
import 'package:booba2/views/auth/mobile/signup/m_signup.dart';
import 'package:get/get.dart';
import '../../../../shared/lulz_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MSignInForm extends StatefulWidget {
  const MSignInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<MSignInForm> createState() => _MSignInFormState();
}

class _MSignInFormState extends State<MSignInForm> {
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          /// Header text
          LulzText(
            text: 'SIGN IN',
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
              text: 'Sign in', onPressed: _signIn, textWidth: 60.w),
          12.verticalSpace,

          /// Go to sign up page button
          LulzOutlinedButton(
              text: 'Sign up ?',
              textWidth: 75.w,
              onPressed: () => Get.off(() => const MSignUp()))
        ]),
      ),
    );
  }

  void _signIn() {
    if (_formKey.currentState!.validate()) {
      Get.find<AuthController>()
          .signIn(_emailController.text.trim(), _passwordController.text);
    }
  }
}
