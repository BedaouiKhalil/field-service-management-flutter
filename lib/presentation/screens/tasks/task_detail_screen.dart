import 'package:flutter/material.dart';
import 'package:fsm_mobile/core/constants/app_colors.dart';
import 'package:fsm_mobile/core/constants/app_theme_extension.dart';
import 'package:fsm_mobile/presentation/controllers/task/task_detail_controller.dart';
import 'package:fsm_mobile/presentation/widgets/common/handling_data_widget.dart';
import 'package:fsm_mobile/presentation/widgets/task/build_info_tile.dart';
import 'package:fsm_mobile/presentation/widgets/task/description_card.dart';
import 'package:fsm_mobile/presentation/widgets/task/status_badge.dart';
import 'package:fsm_mobile/presentation/widgets/task/task_action_button.dart';
import 'package:get/get.dart';

class TaskDetailScreen extends GetView<TaskDetailController> {
  TaskDetailScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _handleStatusUpdate(String nextStatus) async {
    final success = await controller.updateTaskStatus(nextStatus);

    if (success) {
      _showFeedback(
        message: "Status updated successfully",
        color: AppColors.success,
      );
    } else {
      _showFeedback(
        message: controller.errorMessage.value,
        color: Theme.of(_scaffoldKey.currentContext!).colorScheme.error,
      );
    }
  }

  void _showFeedback({required String message, required Color color}) {
    final context = _scaffoldKey.currentContext;

    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message, style: const TextStyle(color: Colors.white)),
          backgroundColor: color,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appTheme = theme.extension<AppThemeExtension>()!;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text('Task Details')),
      body: Obx(
        () => HandlingDataWidget(
          isLoading: controller.isLoading.value,
          hasError: controller.hasError.value,
          errorMessage: controller.errorMessage.value,
          child: controller.task.value == null
              ? Center(
                  child: Text(
                    'No data available',
                    style: theme.textTheme.bodyMedium,
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StatusBadge(
                            status: controller.task.value!.status,
                            statusLabel: controller.task.value!.statusLabel,
                          ),
                          Text(
                            '#TASK-${controller.task.value!.id}',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: appTheme.textSoft,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      Text(
                        controller.task.value!.title,
                        style: theme.textTheme.displayLarge?.copyWith(
                          fontSize: 22,
                          height: 1.3,
                        ),
                      ),

                      const SizedBox(height: 16),

                      if (controller.task.value!.description != null &&
                          controller.task.value!.description!.isNotEmpty)
                        DescriptionCard(
                          title: 'Description',
                          description: controller.task.value!.description!,
                        ),

                      const SizedBox(height: 24),

                      Text(
                        'Assignment Details',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      BuildInfoTile(
                        icon: Icons.business_outlined,
                        title: 'Customer / Company',
                        subtitle:
                            controller.task.value!.customer?.name ?? 'N/A',
                      ),

                      const SizedBox(height: 10),

                      BuildInfoTile(
                        icon: Icons.engineering_outlined,
                        title: 'Assigned Technician',
                        subtitle:
                            controller.task.value!.technician?.fullName ??
                            'N/A',
                      ),

                      const SizedBox(height: 10),

                      BuildInfoTile(
                        icon: Icons.assignment_ind_outlined,
                        title: 'Created By',
                        subtitle:
                            controller.task.value!.creator?.fullName ?? 'N/A',
                      ),
                    ],
                  ),
                ),
        ),
      ),
      bottomNavigationBar: TaskActionButton(
        onStatusPressed: _handleStatusUpdate,
      ),
    );
  }
}
