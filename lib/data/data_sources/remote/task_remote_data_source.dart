import 'dart:convert';
import '../../../core/services/api_service.dart';
import '../../../core/constants/api_routes.dart';

class TaskRemoteDataSource {
  Future<Map<String, dynamic>> getTasks({int page = 1}) async {
    final response = await ApiService.get(
      ApiRoutes.tasks,
      auth: true,
      queryParams: {
        'page': page.toString(),
      },
    );
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> showTask(int id) async {
    final response = await ApiService.get(
      '${ApiRoutes.tasks}/$id',
      auth: true,
    );
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> updateTaskStatus(int id, String status) async {
    final response = await ApiService.patch(
      '${ApiRoutes.tasks}/$id/status',
      auth: true,
      body: {
        'status': status,
      },
    );
    return jsonDecode(response.body);
  }
}
