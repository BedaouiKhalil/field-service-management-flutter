import 'package:flutter/material.dart';
import 'package:fsm_mobile/core/constants/app_colors.dart';
import 'package:fsm_mobile/core/constants/app_theme_extension.dart';

enum StatusBadgeSize { small, medium, large }

class StatusBadge extends StatelessWidget {
  final String status;
  final String statusLabel;
  final StatusBadgeSize size;

  const StatusBadge({
    super.key,
    required this.status,
    required this.statusLabel,
    this.size = StatusBadgeSize.medium,
  });

  Color backgroundColor(BuildContext context) {
    final theme = Theme.of(context);
    final appTheme = theme.extension<AppThemeExtension>()!;

    switch (status.toLowerCase()) {
      case 'completed':
        return AppColors.success.withValues(alpha: 0.15);

      case 'in_progress':
        return theme.colorScheme.primary.withValues(alpha: 0.15);

      case 'cancelled':
        return theme.colorScheme.error.withValues(alpha: 0.15);

      case 'pending':
      default:
        return AppColors.warning.withValues(alpha: 0.15);
    }
  }

  Color textColor(BuildContext context) {
    final theme = Theme.of(context);

    switch (status.toLowerCase()) {
      case 'completed':
        return AppColors.success;

      case 'in_progress':
        return theme.colorScheme.primary;

      case 'cancelled':
        return theme.colorScheme.error;

      case 'pending':
      default:
        return AppColors.warning;
    }
  }

  EdgeInsets get padding {
    switch (size) {
      case StatusBadgeSize.small:
        return const EdgeInsets.symmetric(horizontal: 8, vertical: 3);

      case StatusBadgeSize.medium:
        return const EdgeInsets.symmetric(horizontal: 10, vertical: 4);

      case StatusBadgeSize.large:
        return const EdgeInsets.symmetric(horizontal: 14, vertical: 6);
    }
  }

  double get fontSize {
    switch (size) {
      case StatusBadgeSize.small:
        return 10;

      case StatusBadgeSize.medium:
        return 11;

      case StatusBadgeSize.large:
        return 13;
    }
  }

  BorderRadius get borderRadius {
    switch (size) {
      case StatusBadgeSize.small:
        return BorderRadius.circular(5);

      case StatusBadgeSize.medium:
        return BorderRadius.circular(6);

      case StatusBadgeSize.large:
        return BorderRadius.circular(8);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context).extension<AppThemeExtension>()!;

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor(context),
        borderRadius: borderRadius,
      ),
      child: Text(
        statusLabel,
        style: TextStyle(
          color: textColor(context),
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
