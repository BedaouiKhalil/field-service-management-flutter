import 'package:flutter/material.dart';

@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final Color textSoft;
  final Color textMedium;
  final Color surfaceSoft;

  const AppThemeExtension({
    required this.textSoft,
    required this.textMedium,
    required this.surfaceSoft,
  });

  @override
  AppThemeExtension copyWith({
    Color? textSoft,
    Color? textMedium,
    Color? surfaceSoft,
  }) {
    return AppThemeExtension(
      textSoft: textSoft ?? this.textSoft,
      textMedium: textMedium ?? this.textMedium,
      surfaceSoft: surfaceSoft ?? this.surfaceSoft,
    );
  }

  @override
  AppThemeExtension lerp(
    ThemeExtension<AppThemeExtension>? other,
    double t,
  ) {
    if (other is! AppThemeExtension) return this;

    return AppThemeExtension(
      textSoft: Color.lerp(textSoft, other.textSoft, t)!,
      textMedium: Color.lerp(textMedium, other.textMedium, t)!,
      surfaceSoft: Color.lerp(surfaceSoft, other.surfaceSoft, t)!,
    );
  }
}