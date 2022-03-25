part of '../../helpers/lulz_imports.dart';

class ResponsiveLayoutAuth extends StatelessWidget {
  const ResponsiveLayoutAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) =>
          constraints.maxWidth > 1224 ? DSignIn() : MSignIn(),
    );
  }
}
