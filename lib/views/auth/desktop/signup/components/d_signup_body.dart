part of '../../../../../../helpers/lulz_imports.dart';

class DSignUpBody extends StatelessWidget {
  const DSignUpBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      /// background pattern
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(LulzImages.patternBase),
              repeat: ImageRepeat.repeat)),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          /// Sign in form
          Container(
              margin: EdgeInsets.symmetric(horizontal: 104.w),
              width: 820.w,
              child: DSignUpFormStep1()),
          const Spacer(),

          /// Kitties section
          Image.asset(LulzImages.catDraw,
              height: 670, width: 562, alignment: Alignment.topCenter),
        ],
      ),
    );
  }
}
