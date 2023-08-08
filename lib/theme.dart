import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => _themeData(Brightness.light);
  static ThemeData get dark => _themeData(Brightness.dark);

  static ThemeData _themeData(Brightness brightness) {
    // デフォルトの`deepPurple`指定であれば`ThemeData.light`のコンストラクタ指定で十分だが
    // テンプレート利用時に`seedColor`を変更しやすいように`fromSeed`で書いておく
    final themeData = ThemeData.from(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        brightness: brightness,
      ),
    );

    return themeData.copyWith(
      // `ThemeData.from`で生成されるTextThemeに対してapplyしたいので`copyWith`で繋げない
      textTheme: themeData.textTheme.apply(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      dividerTheme: const DividerThemeData(space: 0),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}
