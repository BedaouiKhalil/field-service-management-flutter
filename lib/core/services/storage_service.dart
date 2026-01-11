// lib/core/services/storage_service.dart
import 'package:get_storage/get_storage.dart';
import '../constants/storage_keys.dart';

class StorageService {
  static final GetStorage _box = GetStorage();

  // ========== TOKEN ==========
  static void saveToken(String token) {
    _box.write(StorageKeys.token, token);
  }

  static String? getToken() {
    return _box.read(StorageKeys.token);
  }

  static void removeToken() {
    _box.remove(StorageKeys.token);
  }

  // ========== USER ==========
  static void saveUser(Map<String, dynamic> user) {
    _box.write(StorageKeys.user, user);
  }

  static Map<String, dynamic>? getUser() {
    return _box.read(StorageKeys.user);
  }

  static void removeUser() {
    _box.remove(StorageKeys.user);
  }

  // ========== First Time ==========
  static bool isFirstTime() {
    return _box.read(StorageKeys.firstTime) ?? true;
  }

  static void setFirstTime(bool value) {
    _box.write(StorageKeys.firstTime, value);
  }

  // ========== LOGOUT ==========
  static void logout() {
    bool firstTime = isFirstTime();

    _box.erase();

    setFirstTime(firstTime);
  }

  // ========== THEME ================
  static void saveTheme(String themeName) {
    _box.write(StorageKeys.theme, themeName);
  }

  static String? getTheme() {
    return _box.read(StorageKeys.theme);
  }
}
