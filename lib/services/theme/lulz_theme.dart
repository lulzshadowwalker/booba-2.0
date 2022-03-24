part of '../../helpers/lulz_imports.dart';

class LulzTheme {
  static final String? _fontFamily = GoogleFonts.openSans().fontFamily;

  /// Dark Theme
  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      /// * Text Selection
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: LulzColors.accent3,
          selectionColor: LulzColors.accent3.withOpacity(0.65),
          selectionHandleColor: LulzColors.accent3),

      /// * Input Field
      inputDecorationTheme: InputDecorationTheme(
        fillColor: LulzColors.whiteText,
        filled: true,
        prefixIconColor: LulzColors.accent3,
        suffixIconColor: LulzColors.accent3,
        hintStyle: LulzTextStyle.button?.copyWith(color: LulzColors.accent3),
      ),

      /// * ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: LulzColors.accent3,
          textStyle: LulzTextStyle.button?.copyWith(fontSize: LulzTextStyle._l),
          minimumSize: const Size(double.infinity, 52),
          padding: const EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),

      /// * OutlinedButton
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          primary: LulzColors.accent3,
          textStyle: LulzTextStyle.button?.copyWith(fontSize: LulzTextStyle._l),
          minimumSize: const Size(double.infinity, 52),
          padding: const EdgeInsets.all(10.0),
          side: BorderSide(
            width: 5,
            color: LulzColors.accent3,
          ),
          backgroundColor: LulzColors.whiteText,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),

      /// * Scaffold Background Color
      scaffoldBackgroundColor: LulzColors.backgroundDark,

      /// * Text Theme
      textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: _fontFamily,

            /// TODO maybe change them both to [whiteText]
            displayColor: LulzColors.whiteText,
            bodyColor: LulzColors.textAlt,
          ),
    );
  }
}
