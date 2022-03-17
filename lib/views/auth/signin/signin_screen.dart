import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/lulz_imports.dart';
import '../../../services/auth/auth_controller.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    /// ! DUMMY TESTING PAGE
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
              controller: _email,
              decoration: const InputDecoration(
                  hintText: 'Email', prefixIcon: Icon(Icons.mail))),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            cursorWidth: 5,
            cursorColor: LulzColors.accent3,
            
            style: LulzTextStyle.button
                ?.copyWith(color: LulzColors.backgroundDark),
            controller: _password,
            decoration: const InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock),
                focusColor: Colors.red),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () => _authController.signUp(
                  email: _email.text.trim(),
                  password: _password.text,
                  username: 'username'),
              child: const Text('Sign up')),
        ],
      )),
    ));
  }
}
