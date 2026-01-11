import 'package:get/get.dart';
import '../../core/constants/app_theme.dart';
import '../../core/services/storage_service.dart';

class LocaleController extends GetxController {
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    String? savedTheme = StorageService.getTheme();
    
    if (savedTheme == 'dark') {
      isDarkMode.value = true;
      Get.changeTheme(darkTheme);
    } else {
      isDarkMode.value = false;
      Get.changeTheme(lightTheme);
    }
  }

  void toggleTheme() {
    if (isDarkMode.value) {
      Get.changeTheme(lightTheme);
      StorageService.saveTheme('light');
      isDarkMode.value = false;
    } else {
      Get.changeTheme(darkTheme);
      StorageService.saveTheme('dark');
      isDarkMode.value = true;
    }
  }
}