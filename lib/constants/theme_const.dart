import 'package:doctor_app/constants/colors_const.dart';
import 'package:flutter/material.dart';

class ThemeConst {
  ThemeConst._();

  static getApplicationTheme() {
    const int blackPrimaryValue = 0xFF000000;
    const MaterialColor primaryBlack = MaterialColor(
      blackPrimaryValue,
      <int, Color>{
        50: Color(0xFF000000),
        100: Color(0xFF000000),
        200: Color(0xFF000000),
        300: Color(0xFF000000),
        400: Color(0xFF000000),
        500: Color(blackPrimaryValue),
        600: Color(0xFF000000),
        700: Color(0xFF000000),
        800: Color(0xFF000000),
        900: Color(0xFF000000),
      },
    );

    const inputStyle = TextStyle(
      fontFamily: "Kumbhsans",
      fontSize: 14,
      color: Color(0xFF363636),
      fontWeight: FontWeight.w500,
    );

    return ThemeData(
      primaryColor: ColorsConst.primary,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      primarySwatch: primaryBlack,
      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
            color: const Color(0xFF2550E7),
            borderRadius: BorderRadius.circular(8)),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.white,
        labelPadding: EdgeInsets.zero,
        unselectedLabelColor: const Color(0xFFB0B0B0),
      ),
      colorScheme: const ColorScheme.light(
        primary: ColorsConst.primary,
        secondary: ColorsConst.primary,
        error: Colors.red,
      ),
      textTheme: const TextTheme(
          bodySmall: TextStyle(
              fontSize: 14,
              fontFamily: "Aloevera",
              color: Color(0xFF363636),
              fontWeight: FontWeight.w400)),
      chipTheme: ChipThemeData(
        backgroundColor: const Color(0x241677FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        side: const BorderSide(color: Color(0x291677FF)),
        padding: EdgeInsets.zero,
        labelPadding: const EdgeInsets.symmetric(horizontal: 4),
      ),
      dividerColor: const Color(0xFFB0B0B0),
      fontFamily: "Kumbhsans",
      textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(Color(0xFF2550E7)),
      )),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(8),
        side: const MaterialStatePropertyAll(BorderSide(
          color: ColorsConst.primary,
        )),
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
        minimumSize: const MaterialStatePropertyAll(Size(double.infinity, 50)),
      )),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              elevation: const MaterialStatePropertyAll(0),
              side: const MaterialStatePropertyAll(BorderSide(
                color: ColorsConst.primary,
              )),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
              backgroundColor:
                  const MaterialStatePropertyAll(ColorsConst.primary),
              minimumSize:
                  const MaterialStatePropertyAll(Size(double.infinity, 50)),
              foregroundColor: const MaterialStatePropertyAll(Colors.white),
              textStyle: const MaterialStatePropertyAll(TextStyle(
                fontFamily: "Kumbhsans",
                fontSize: 18,
                fontWeight: FontWeight.w800,
              )))),
      switchTheme: const SwitchThemeData(
          materialTapTargetSize: MaterialTapTargetSize.padded,
          trackOutlineColor: MaterialStatePropertyAll(ColorsConst.primary)),
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(30)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(30)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(30)),
          filled: true,
          fillColor: const Color(0xFFF7F6FB),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          prefixIconColor: const Color(0xFF0077B5),
          suffixIconColor: const Color(0xFFB0B0B0),
          labelStyle: inputStyle,
          hintStyle: inputStyle),
    );
  }
}
