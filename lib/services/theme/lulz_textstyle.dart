part of '../../helpers/lulz_imports.dart';

class LulzTextStyle {
  /// font sizes - PerfectFifth - base = 18
  static const double _xl3 = 91.13;
  static const double _xl2 = 60.75;
  static const double _xl = 40.5;
  static const double _l = 27;
  static const double _md = 18;
  static const double _sm = 12;
  static const double _xsm = 9;
  static const double _xsm2 = 5.33;
  
  static final TextTheme _textTheme = ThemeData.dark().textTheme;

  /// I didn't know much about text styles in design in general
  /// when I made the mockup, so this is what I'm going with.
  /// docs: ( https://api.flutter.dev/flutter/material/TextTheme-class.html#:~:text=headline1%20%20%20%2096.0%20%20light,10.0%20%20regular%20%201.5 )
  static final TextStyle? xl3 = _textTheme.headline1
      ?.copyWith(fontSize: _xl3, fontWeight: FontWeight.w700);
  static final TextStyle? xl2 = _textTheme.headline2
      ?.copyWith(fontSize: _xl2, fontWeight: FontWeight.w700);

  static final TextStyle? xl = _textTheme.headline3
      ?.copyWith(fontSize: _xl, fontWeight: FontWeight.w700);
  static final TextStyle? l =
      _textTheme.headline4?.copyWith(fontSize: _l, fontWeight: FontWeight.w700);
  static final TextStyle? md = _textTheme.subtitle1?.copyWith(fontSize: _md);
  static final TextStyle? sm = _textTheme.subtitle2?.copyWith(fontSize: _sm);
  static final TextStyle? xsm = _textTheme.subtitle2?.copyWith(fontSize: _xsm);
  static final TextStyle? xsm2 =
      _textTheme.subtitle2?.copyWith(fontSize: _xsm2);
  static final TextStyle? button = _textTheme.subtitle2?.copyWith(
    fontSize: _md,
    fontWeight: FontWeight.w700,
  );
}
