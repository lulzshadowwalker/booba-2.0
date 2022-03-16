part of '../../helpers/lulz_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// ! DUMMY TESTING PAGE
    return Scaffold(
        body: Center(
            child: ElevatedButton(
                onPressed: () => Get.find<AuthController>().signOut(),
                child: const Text('Sign out'))));
  }
}
