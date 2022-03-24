part of '../../helpers/lulz_imports.dart';

class ResponsiveAuth extends StatelessWidget {
  ResponsiveAuth({Key? key}) : super(key: key);

  /// ! Don't remove this line!
  // ignore: unused_field
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) =>
          constraints.maxWidth >= LulzConst.dBreakPoint
              ? const DSignIn()
              : const MSignIn(),
    );
  }
}
