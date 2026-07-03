import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fsm_mobile/core/constants/app_colors.dart';
import 'package:fsm_mobile/presentation/controllers/task/task_detail_controller.dart';

class TaskActionButton extends GetView<TaskDetailController> {
  final Function(String) onStatusPressed;

  const TaskActionButton({super.key, required this.onStatusPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Obx(() {
      if (controller.task.value == null || controller.isLoading.value) {
        return const SizedBox.shrink();
      }

      final status = controller.task.value!.status;

      String buttonText = '';
      String nextStatus = '';

      Color buttonColor = theme.colorScheme.primary;

      if (status == 'pending') {
        buttonText = 'Start Task';
        buttonColor = theme.colorScheme.primary;
        nextStatus = 'in_progress';
      } else if (status == 'in_progress') {
        buttonText = 'Complete Task';
        buttonColor = AppColors.success;
        nextStatus = 'completed';
      } else {
        return const SizedBox.shrink();
      }

      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.cardColor,
          border: Border(top: BorderSide(color: theme.dividerColor)),
        ),
        child: SafeArea(
          child: Obx(
            () => ElevatedButton(
              style: theme.elevatedButtonTheme.style?.copyWith(
                backgroundColor: WidgetStatePropertyAll(buttonColor),
              ),
              onPressed: controller.isUpdatingStatus.value
                  ? null
                  : () => onStatusPressed(nextStatus),
              child: controller.isUpdatingStatus.value
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2.5,
                      ),
                    )
                  : Text(buttonText),
            ),
          ),
        ),
      );
    });
  }
}
