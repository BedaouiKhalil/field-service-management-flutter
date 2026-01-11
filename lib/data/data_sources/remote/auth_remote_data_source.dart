import 'dart:convert';
import '../../../core/services/api_service.dart';
import '../../../core/constants/api_routes.dart';

class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await ApiService.post(ApiRoutes.login, {
      'email': email,
      'password': password,
    });

    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> logout() async {
    final response = await ApiService.post(ApiRoutes.logout, {}, auth: true);

    return jsonDecode(response.body);
  }
}
