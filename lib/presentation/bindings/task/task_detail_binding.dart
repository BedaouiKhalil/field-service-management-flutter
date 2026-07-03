import 'package:get/get.dart';
import 'package:fsm_mobile/presentation/controllers/task/task_detail_controller.dart';

class TaskDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskDetailController>(() => TaskDetailController());
  }
}