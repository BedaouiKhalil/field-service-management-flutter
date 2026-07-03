import 'package:fsm_mobile/core/constants/http_status.dart';
import 'package:fsm_mobile/data/data_sources/remote/task_remote_data_source.dart';
import 'package:fsm_mobile/data/model/api_response.dart';
import 'package:fsm_mobile/data/model/task_model.dart';

class TaskRepository {
  final TaskRemoteDataSource _remoteDataSource = TaskRemoteDataSource();

  Future<ApiResponse<Map<String, dynamic>>> fetchTasks({int page = 1}) async {
    try {
      final response = await _remoteDataSource.getTasks(page: page);
      final statusCode = response['status'] as int;

      if (HttpStatus.isSuccess(statusCode)) {
        final List<dynamic> tasksJson = response['data'] as List<dynamic>;
        final List<TaskModel> tasks = tasksJson
            .map((json) => TaskModel.fromJson(json))
            .toList();

        final int currentPage = response['meta']['current_page'] as int;
        final int lastPage = response['meta']['last_page'] as int;

        return ApiResponse.success(
          data: {'tasks': tasks, 'hasMore': currentPage < lastPage},
        );
      } else {
        return ApiResponse.error(
          message: response['message'] as String? ?? 'Failed to load tasks',
          statusCode: statusCode,
        );
      }
    } catch (e) {
      return ApiResponse.error(message: 'Network error: ${e.toString()}');
    }
  }

  Future<ApiResponse<TaskModel>> fetchTaskDetails(int id) async {
    try {
      final response = await _remoteDataSource.showTask(id);
      final statusCode = response['status'] as int;

      if (HttpStatus.isSuccess(statusCode)) {
        final Map<String, dynamic> taskJson =
            response['data'] as Map<String, dynamic>;
        final TaskModel task = TaskModel.fromJson(taskJson);

        return ApiResponse.success(data: task);
      } else {
        return ApiResponse.error(
          message:
              response['message'] as String? ?? 'Failed to load task details',
          statusCode: statusCode,
        );
      }
    } catch (e) {
      return ApiResponse.error(message: 'Network error: ${e.toString()}');
    }
  }

  Future<ApiResponse<TaskModel>> updateTaskStatus(int id, String status) async {
    try {
      final response = await _remoteDataSource.updateTaskStatus(id, status);
      final statusCode = response['status'] as int;

      if (HttpStatus.isSuccess(statusCode)) {
        final Map<String, dynamic> taskJson =
            response['data'] as Map<String, dynamic>;
        final TaskModel updatedTask = TaskModel.fromJson(taskJson);

        return ApiResponse.success(data: updatedTask);
      } else {
        return ApiResponse.error(
          message: response['message'] as String? ?? 'Failed to update status',
          statusCode: statusCode,
        );
      }
    } catch (e) {
      return ApiResponse.error(message: 'Network error: ${e.toString()}');
    }
  }
}
