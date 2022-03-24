import 'package:booba2/helpers/lulz_imports.dart';
import 'package:booba2/views/shared/lulz_elevatedbutton.dart/lulz_elevatedbutton.dart';
import 'package:booba2/views/shared/lulz_formfield/lulz_formfield.dart';
import 'package:booba2/views/shared/lulz_outlinedbutton.dart/lulz_outlinedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DSignInForm extends StatelessWidget {
  DSignInForm({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              Expanded(
                flex: 2,
                child: LulzElevatedButton(
                  text: 'Sign in',
                  textColor: LulzColors.backgroundDark,
                  onPressed: () {},
                ),
              ), // 1
              14.4.horizontalSpace, // 2
              Expanded(
                child: LulzOutlinedButton(
                  text: 'Sign up ?',
                  onPressed: () {},
                ),
              ) // 3
            ],
          ), // 8
          24.verticalSpace, // 7
          LulzFormField(
            controller: _passwordController,
            hintText: 'Password',
            prefixIcon: const Icon(Icons.lock_rounded),
            constraints: BoxConstraints(maxHeight: 55.h),
            obscureText: true,
          ), // 6
          24.verticalSpace, // 5
          LulzFormField(
            controller: _emailController,
            hintText: 'Email',
            prefixIcon: const Icon(Icons.email_rounded),
            constraints: BoxConstraints(maxHeight: 55.h),
            keyboardType: TextInputType.emailAddress,
          ), // 4
          7.verticalSpace, // 3

          Text('SIGN IN', style: LulzTextStyle.xl3), // 2
          60.verticalSpace, // 1
        ],
      ),
    );
  }
}
