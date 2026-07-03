import 'package:flutter/material.dart';
import 'package:fsm_mobile/presentation/widgets/task/task_card.dart';
import 'package:get/get.dart';
import 'package:fsm_mobile/presentation/controllers/task/task_controller.dart';
import 'package:fsm_mobile/presentation/widgets/common/handling_data_widget.dart';

class TaskScreen extends GetView<TaskController> {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.getTasks,
          ),
        ],
      ),
      body: Obx(
        () => HandlingDataWidget(
          isLoading: controller.isLoading.value,
          hasError: controller.hasError.value,
          errorMessage: controller.errorMessage.value,
          child: controller.tasksList.isEmpty
              ? Center(
                  child: Text(
                    'No tasks found.',
                    style: theme.textTheme.bodyMedium,
                  ),
                )
              : ListView.builder(
                  controller: controller.scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  itemCount:
                      controller.tasksList.length +
                      (controller.isLoadingMore.value ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < controller.tasksList.length) {
                      return TaskCard(task: controller.tasksList[index]);
                    }

                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
