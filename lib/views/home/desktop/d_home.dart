part of '../../../helpers/lulz_imports.dart';

class DHome extends StatelessWidget {
  const DHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// ! DUMMY TESTING PAGE
    return Scaffold(
        body: Center(
            child: ElevatedButton(
                onPressed: () => Get.find<AuthController>().signOut(),
                child: const Text('[Desktop Home] SIGN OUT'))));
  }
}
