import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_theme_extension.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: "Roboto",

  brightness: Brightness.light,

  scaffoldBackgroundColor: AppColors.background,

  primaryColor: AppColors.primary,

  cardColor: AppColors.white,

  dividerColor: const Color(0xFFE5E7EB),

  shadowColor: Colors.black12,

  iconTheme: const IconThemeData(color: AppColors.primaryDark),

  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    error: AppColors.error,
    surface: AppColors.white,
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
  ),

  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 0,
    backgroundColor: AppColors.background,
    iconTheme: IconThemeData(color: AppColors.primaryDark),
    titleTextStyle: TextStyle(
      color: AppColors.primary,
      fontWeight: FontWeight.bold,
      fontSize: 26,
    ),
  ),

  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: AppColors.textDark,
    ),
    displayMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: AppColors.textDark,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.textDark,
    ),
    bodyMedium: TextStyle(fontSize: 14, color: AppColors.textLight),
  ),

  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: AppColors.white,

    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),

    labelStyle: TextStyle(color: AppColors.textLightMedium),

    floatingLabelStyle: TextStyle(color: AppColors.primary),

    hintStyle: TextStyle(color: AppColors.textLightMedium),

    prefixIconColor: AppColors.primary,

    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide.none,
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide.none,
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: AppColors.primary, width: 2),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      minimumSize: const Size(double.infinity, 50),
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
    ),
  ),
  extensions: const [
    AppThemeExtension(
      textSoft: AppColors.textLight,
      textMedium: AppColors.textLightMedium,
      surfaceSoft: AppColors.primaryExtraLight,
    ),
  ],
);

final ThemeData darkTheme = ThemeData(
  fontFamily: "Roboto",

  brightness: Brightness.dark,

  scaffoldBackgroundColor: AppColors.primaryDark,

  primaryColor: AppColors.primary,

  cardColor: AppColors.primaryDark.withValues(alpha: 0.5),

  dividerColor: Colors.white24,

  shadowColor: Colors.black54,

  iconTheme: const IconThemeData(color: Colors.white),

  colorScheme: const ColorScheme.dark(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    error: AppColors.error,
    surface: Color(0xFF2A3645),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
  ),

  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 0,
    backgroundColor: AppColors.primaryDark,
    iconTheme: IconThemeData(color: AppColors.white),
    titleTextStyle: TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
  ),

  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: AppColors.white,
    ),
    displayMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: AppColors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    bodyMedium: TextStyle(fontSize: 14, color: AppColors.white),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF2A3645),

    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),

    labelStyle: const TextStyle(color: AppColors.textLightSoft),

    floatingLabelStyle: const TextStyle(color: AppColors.primary),

    hintStyle: const TextStyle(color: AppColors.textLightSoft),

    prefixIconColor: AppColors.primary,

    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide.none,
    ),

    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide.none,
    ),

    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: AppColors.primary, width: 2),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      minimumSize: const Size(double.infinity, 50),
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
    ),
  ),
  extensions: const [
  AppThemeExtension(
    textSoft: AppColors.textLightSoft,
    textMedium: AppColors.textLightMedium,
    surfaceSoft: AppColors.primaryDark,
  ),
],
);
