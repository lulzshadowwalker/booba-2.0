part of './helpers/lulz_imports.dart';

class Booba extends StatelessWidget {
  const Booba({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'BOOBA-v2',
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}
