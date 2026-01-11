import 'package:flutter/widgets.dart';
import 'package:fsm_mobile/data/model/user_model.dart';
import 'package:get/get.dart';
import '../../data/repositories/Auth_repository.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final AuthRepository _repository = AuthRepository();

  late TextEditingController email;
  late TextEditingController password;

  RxBool isLoading = false.obs;
  RxBool isLoggedIn = false.obs;
  RxBool hasError = false.obs;
  RxBool isPasswordVisible = false.obs;
  RxString errorMessage = ''.obs;

  UserModel? _currentUser;

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }

  UserModel? get currentUser => _currentUser;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<bool> login() async {
    final String emailText = email.text.trim();
    final String passwordText = password.text.trim();

    if (!formstate.currentState!.validate()) {
      return false;
    }

    isLoading.value = true;
    try {
      final response = await _repository.login(emailText, passwordText);

      if (response.isSuccess) {
        _currentUser = response.data;
        return true;
      }

      errorMessage.value = response.message ?? 'Login failed';
      hasError.value = true;
      return false;
    } catch (e) {
      errorMessage.value = 'Network error: ${e.toString()}';
      hasError.value = true;
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await _repository.logout();
    isLoggedIn.value = false;
    Get.offAllNamed('/login');
    Get.snackbar(
      'Info',
      'Logged out successfully',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  UserModel? getCurrentUser() {
    return _repository.getCurrentUser();
  }
}
