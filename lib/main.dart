import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'config/routes.dart';
import 'presentation/controllers/locale_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final LocaleController themeController = Get.put(LocaleController());

    return Obx(
      () => GetMaterialApp(
        title: 'FSM Mobile',
        debugShowCheckedModeBanner: false,
        theme: themeController.appTheme.value,
        initialRoute: '/',
        getPages: routes,
      ),
    );
  }
}
