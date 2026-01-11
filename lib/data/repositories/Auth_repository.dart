import 'package:fsm_mobile/core/constants/http_status.dart';
import 'package:fsm_mobile/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:fsm_mobile/data/model/api_response.dart';
import 'package:fsm_mobile/data/model/user_model.dart';
import '../data_sources/local/auth_local_data_source.dart';

class AuthRepository {
  final AuthRemoteDataSource _remoteDataSource = AuthRemoteDataSource();

  Future<ApiResponse<UserModel>> login(String email, String password) async {
    try {
      final response = await _remoteDataSource.login(email, password);
      final statusCode = response['status'] as int;

      if (HttpStatus.isSuccess(statusCode)) {
        await AuthLocalDataSource.saveAuthData(response);
        final userJson = response['data'] as Map<String, dynamic>;
        final user = UserModel.fromJson(userJson);

        return ApiResponse.success(
          data: user,
          message: response['message'] ?? 'Login successful',
          statusCode: statusCode,
        );
      } else {
        return ApiResponse.error(
          message: response['message'] ?? 'Erreur de connexion',
          statusCode: statusCode,
        );
      }
    } catch (e) {
      return ApiResponse.error(message: 'Erreur réseau: ${e.toString()}');
    }
  }

  Future<ApiResponse<void>> logout() async {
    try {
      await _remoteDataSource.logout();
      await AuthLocalDataSource.logout();

      return ApiResponse.success(data: null, message: 'Déconnexion réussie');
    } catch (e) {
      return ApiResponse.error(message: 'Erreur lors de la déconnexion');
    }
  }

  bool isLoggedIn() => AuthLocalDataSource.isLoggedIn();

  UserModel? getCurrentUser() {
    final userData = AuthLocalDataSource.getCurrentUser();
    if (userData != null) {
      return UserModel.fromJson(userData);
    }
    return null;
  }
}
