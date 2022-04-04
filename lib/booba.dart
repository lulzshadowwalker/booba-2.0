part of './helpers/lulz_imports.dart';

class Booba extends StatelessWidget {
  const Booba({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: LulzConst.mSize,
      builder: () => GetMaterialApp(
        title: 'BOOBA-v2',
        debugShowCheckedModeBanner: false,
        theme: LulzTheme.dark(),
        home: MSignIn(),
        defaultTransition: Transition.circularReveal,
        transitionDuration: const Duration(milliseconds: 1000),
      ), 
    );
  }
}
