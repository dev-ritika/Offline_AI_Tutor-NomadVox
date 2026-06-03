import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:offline_ai_tutor/core/utils/constants/color_consts.dart';

class ThemeConfig {
  ThemeConfig._();

  static ThemeData appThemeData() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: ColorConsts.primaryColor,
        surface: ColorConsts.backgroundColor,
      ),

      // primaryColor: ColorConsts.primaryColor,
      scaffoldBackgroundColor: ColorConsts.backgroundColor,
      primaryTextTheme: primaryTextTheme,
      textTheme: primaryTextTheme,

      inputDecorationTheme: InputDecorationThemeData(
        hintStyle: primaryTextTheme.bodyLarge,

        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorConsts.primaryColor),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorConsts.primaryColor, width: 2),
        ),
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: ColorConsts.backgroundColor,
        foregroundColor: ColorConsts.textPrimaryColor,
        centerTitle: false,
        titleTextStyle: primaryTextTheme.titleMedium,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: const WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
            ),
          ),

          backgroundColor: const WidgetStatePropertyAll(
            ColorConsts.primaryColor,
          ),

          foregroundColor: const WidgetStatePropertyAll(
            ColorConsts.textPrimaryColor,
          ),

          textStyle: WidgetStatePropertyAll(primaryTextTheme.titleSmall),
        ),
      ),
    );
  }

  static TextTheme get primaryTextTheme => TextTheme(
    //splash screen logo style
    displayLarge: GoogleFonts.syne(
      color: ColorConsts.textPrimaryColor,
      fontSize: 36,
      fontWeight: FontWeight.bold,
    ),

    //muted text med
    bodyLarge: GoogleFonts.dmSans(
      color: ColorConsts.whiteColor35,
      fontSize: 16,
    ),

    //muted text med
    bodyMedium: GoogleFonts.dmSans(
      color: ColorConsts.whiteColor35,
      fontSize: 12,
    ),

    //muted text small
    bodySmall: GoogleFonts.dmSans(
      color: ColorConsts.whiteColor35,
      fontSize: 10,
    ),

    //large titles
    titleLarge: GoogleFonts.syne(
      color: ColorConsts.textPrimaryColor,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),

    titleMedium: GoogleFonts.syne(
      color: ColorConsts.textPrimaryColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),

    //small titles
    titleSmall: GoogleFonts.dmSans(
      color: ColorConsts.textPrimaryColor,
      fontSize: 13,
      fontWeight: FontWeight.w500,
    ),

    headlineSmall: GoogleFonts.dmSans(
      color: ColorConsts.buttonPLinearColor1,
      fontSize: 10,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.5,
    ),

    // headlineLarge: GoogleFonts.syne(
    //   color: ColorConsts.textPrimaryColor,
    //   fontSize: 30,
    //   fontWeight: FontWeight.bold,
    // ),
  );
}
