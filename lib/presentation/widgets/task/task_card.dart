import 'package:flutter/material.dart';
import 'package:fsm_mobile/core/constants/app_routes.dart';
import 'package:fsm_mobile/core/constants/app_theme_extension.dart';
import 'package:fsm_mobile/data/model/task_model.dart';
import 'package:fsm_mobile/presentation/widgets/task/status_badge.dart';
import 'package:get/get.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appTheme = theme.extension<AppThemeExtension>()!;

    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      color: theme.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: theme.dividerColor),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Get.toNamed(AppRoutes.taskDetails, arguments: task.id);
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      task.title,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  StatusBadge(
                    status: task.status,
                    statusLabel: task.statusLabel,
                  ),
                ],
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 16,
                    color: appTheme.textSoft,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Client: ',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: appTheme.textSoft,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    task.customer?.name ?? "N/A",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                ],
              ),

              if (task.description != null && task.description!.isNotEmpty) ...[
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: appTheme.surfaceSoft,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    task.description!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 13,
                      height: 1.4,
                      color: appTheme.textSoft,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
