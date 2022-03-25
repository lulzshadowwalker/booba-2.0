part of '../../../../../helpers/lulz_imports.dart';

class DSignInBody extends StatelessWidget {
  const DSignInBody({
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Kitties section
          RotatedBox(
            quarterTurns: 2,
            child: Image.asset(LulzImages.catDraw,
                height: 670, width: 562, alignment: Alignment.bottomRight),
          ),

          /// Sign in form
          Transform(
            transform: Matrix4.rotationX(math.pi),
            alignment: Alignment.center,
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 104.w),
                width: 820.w,
                child: DSignInForm()),
          )
        ],
      ),
    );
  }
}
