import 'package:flutter/material.dart';
import 'package:fsm_mobile/core/constants/app_theme_extension.dart';

class DescriptionCard extends StatelessWidget {
  final String title;
  final String description;

  const DescriptionCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appTheme = theme.extension<AppThemeExtension>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: theme.dividerColor,
            ),
          ),
          child: Text(
            description,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: appTheme.textSoft,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}