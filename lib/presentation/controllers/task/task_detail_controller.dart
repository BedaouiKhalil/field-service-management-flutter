// lib/presentation/controllers/task/task_detail_controller.dart
import 'package:get/get.dart';
import 'package:fsm_mobile/data/model/task_model.dart';
import 'package:fsm_mobile/data/repositories/task_repository.dart';

class TaskDetailController extends GetxController {
  final TaskRepository _repository = TaskRepository();

  final RxBool isLoading = false.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;
  final RxBool isUpdatingStatus = false.obs;

  final Rxn<TaskModel> task = Rxn<TaskModel>();
  late int taskId;

  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments is int) {
      taskId = Get.arguments as int;
      getTaskDetails();
    } else {
      hasError.value = true;
      errorMessage.value = "No Task ID provided";
    }
    super.onInit();
  }

  Future<void> getTaskDetails() async {
    isLoading.value = true;
    hasError.value = false;

    try {
      final response = await _repository.fetchTaskDetails(taskId);

      if (response.isSuccess && response.data != null) {
        task.value = response.data;
      } else {
        hasError.value = true;
        errorMessage.value = response.message ?? 'An error occurred';
      }
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> updateTaskStatus(String newStatus) async {
    if (task.value == null) return false;

    try {
      isUpdatingStatus.value = true;
      final response = await _repository.updateTaskStatus(taskId, newStatus);

      if (response.isSuccess && response.data != null) {
        task.value = response.data;
        return true;
      } else {
        errorMessage.value = response.message ?? "Failed to update status";
        return false;
      }
    } catch (e) {
      errorMessage.value = "An unexpected error occurred";
      return false;
    } finally {
      isUpdatingStatus.value = false;
    }
  }
}
