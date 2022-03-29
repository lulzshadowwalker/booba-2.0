part of '../../helpers/lulz_imports.dart';

class ResponsiveHome extends StatelessWidget {
  const ResponsiveHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) =>
          constraints.maxWidth >= LulzConst.dBreakPoint
              ? const DHome()
              : const MHome(),
    );
  }
}
