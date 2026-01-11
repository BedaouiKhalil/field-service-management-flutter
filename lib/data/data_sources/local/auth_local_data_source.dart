import '../../../core/services/storage_service.dart';

class AuthLocalDataSource {
  static Future<void> saveAuthData(Map<String, dynamic> response) async {
    if (response['token'] != null) {
      StorageService.saveToken(response['token']);
    }
    
    if (response['data'] != null) {
      StorageService.saveUser(response['data']);
    }
  }
  
  static Map<String, dynamic>? getCurrentUser() {
    return StorageService.getUser();
  }
  
  static bool isLoggedIn() {
    return StorageService.getToken() != null;
  }
  
  static Future<void> logout() async {
    StorageService.removeToken();
    StorageService.removeUser();
  }
  
  static String? getToken() {
    return StorageService.getToken();
  }
}