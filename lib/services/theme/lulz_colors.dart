part of '../../helpers/lulz_imports.dart';

class LulzColors {
  static Color colorFromHex(String hexColor, [String opacity = 'FF']) {
    /// #FFFFFF -> FFFFFF
    final String color = hexColor.replaceAll('#', '');

    /// FFFFFFFF -> 0xFFFFFFFF
    return Color(int.parse(opacity + color, radix: 16));
  }

  static Color backgroundDark = colorFromHex('#14141F');
  static Color backgroundDarkDimmed = colorFromHex('#0C0C12');
  static Color accent1 = colorFromHex('#6E3CBC');
  static Color accent2 = colorFromHex('#B00B69');
  static Color accent2Transparent = accent2.withOpacity(0.1);
  static Color accent3 = colorFromHex('#F87171');
  static Color accent4 = colorFromHex('#46EEFA');
  static Color accent4Transparent = accent4.withOpacity(0.1);
  static Color textAlt = colorFromHex('#8D98CD');
  static Color muted = colorFromHex('#ACBBCA');
  static Color whiteText = colorFromHex('#E0E7FF');
  static Color whiteCatDraw = colorFromHex('#EFEEED');
  static Color green = colorFromHex('#80FA46');
  static Color greenTransparent = green.withOpacity(0.1);
  static Color whiteTransparent = colorFromHex('#EBEAF0').withOpacity(0.35);
  static Color blue = colorFromHex('#00495C');

  /// bongoTap splash screen background color
  static Color bongoTapWhite = colorFromHex('FCFBFB');

  static const LinearGradient gradient1 = LinearGradient(
    colors: [Color(0xfff87171), Color(0xffb00b69)],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
}
