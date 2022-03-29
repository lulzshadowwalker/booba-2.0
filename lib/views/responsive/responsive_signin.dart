part of '../../helpers/lulz_imports.dart';

class ResponsiveSignIn extends StatelessWidget {
  const ResponsiveSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) =>
          constraints.maxWidth > 1224 ? const DSignIn() :  MSignIn(),
    );
  }
}
