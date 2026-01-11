import 'package:flutter/material.dart';
import 'app_colors.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: "Roboto",
  scaffoldBackgroundColor: AppColors.background,
  primaryColor: AppColors.primary,
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
    bodyMedium: TextStyle(
      fontSize: 14,
      color: AppColors.textLight,
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  fontFamily: "Roboto",
  scaffoldBackgroundColor: AppColors.primaryDark,
  primaryColor: AppColors.primary,
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
    bodyMedium: TextStyle(
      fontSize: 14,
      color: AppColors.white,
    ),
  ),
);
