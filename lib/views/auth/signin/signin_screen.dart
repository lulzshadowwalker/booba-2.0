part of '../../../helpers/lulz_imports.dart';

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
          TextFormField(controller: _email),
          TextFormField(controller: _password),
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
