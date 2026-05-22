import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:offline_ai_tutor/core/utils/constants/color_consts.dart';

class ThemeConfig {
  ThemeConfig._();

  static ThemeData appThemeData() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorConsts.primaryColor,
        surface: ColorConsts.backgroundColor,
      ),
      // primaryColor: ColorConsts.primaryColor,
      scaffoldBackgroundColor: ColorConsts.backgroundColor,
      primaryTextTheme: primaryTextTheme,
      textTheme: primaryTextTheme,

      appBarTheme: AppBarTheme(
        backgroundColor: ColorConsts.backgroundColor,
        foregroundColor: ColorConsts.textPrimaryColor,
        centerTitle: false,
        titleTextStyle: GoogleFonts.syne(
          color: ColorConsts.textPrimaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
            ),
          ),

          backgroundColor: WidgetStatePropertyAll(ColorConsts.primaryColor),

          foregroundColor: WidgetStatePropertyAll(ColorConsts.textPrimaryColor),

          textStyle: WidgetStatePropertyAll(
            GoogleFonts.dmSans(
              color: ColorConsts.textPrimaryColor,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
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
