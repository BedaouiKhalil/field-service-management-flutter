import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fsm_mobile/data/model/task_model.dart';
import 'package:fsm_mobile/data/repositories/task_repository.dart';

class TaskController extends GetxController {
  final TaskRepository _repository = TaskRepository();

  final ScrollController scrollController = ScrollController();

  RxBool isLoading = false.obs;
  RxBool hasError = false.obs;
  RxString errorMessage = ''.obs;
  RxBool isLoadingMore = false.obs;
  RxList<TaskModel> tasksList = <TaskModel>[].obs;

  int _currentPage = 1;
  bool _hasMoreData = true;

  @override
  void onInit() {
    getTasks();
    _setupScrollController();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void _setupScrollController() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        getMoreTasks();
      }
    });
  }

  Future<void> getTasks() async {
    _currentPage = 1;
    _hasMoreData = true;
    isLoading.value = true;
    hasError.value = false;

    try {
      final response = await _repository.fetchTasks(page: _currentPage);

      if (response.isSuccess && response.data != null) {
        final List<TaskModel> initialTasks =
            response.data!['tasks'] as List<TaskModel>;
        _hasMoreData = response.data!['hasMore'] as bool;

        tasksList.assignAll(initialTasks);
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

  Future<void> getMoreTasks() async {
    if (isLoadingMore.value || !_hasMoreData) return;

    isLoadingMore.value = true;
    _currentPage++;

    try {
      final response = await _repository.fetchTasks(page: _currentPage);

      if (response.isSuccess && response.data != null) {
        final List<TaskModel> newTasks =
            response.data!['tasks'] as List<TaskModel>;
        _hasMoreData = response.data!['hasMore'] as bool;
        tasksList.addAll(newTasks);
      } else {
        _currentPage--;
      }
    } catch (e) {
      _currentPage--;
    } finally {
      isLoadingMore.value = false;
    }
  }
}
