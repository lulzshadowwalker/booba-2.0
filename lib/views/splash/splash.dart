part of '../../helpers/lulz_imports.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 1500),
      () {
        GetStorage storage = GetStorage();

        /// we only set it to false when navigating to [MLandingPage] otherwise it's null
        /// it's never set to false
        bool? isFirstLaunch = storage.read<bool>(LulzConst.isFirstLaunch);

        /// Check [isFirstLaunch] and show either Login(Login/Home technically) or landing page
        isFirstLaunch == null
            ? Get.off(() => MLandingPage())
            : Get.put(AuthController(), permanent: true);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LulzColors.whiteText,

      /// I can use a [Positioned] widget here, but no I like this
      body: Center(
        child: Column(children: [
          const Spacer(),
          Image.asset(LulzImages.bongoTap),
          const Spacer(),
        ]),
      ),
    );
  }
}
