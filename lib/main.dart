import 'package:flutter/material.dart';
import 'package:fsm_mobile/core/constants/app_theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'config/routes.dart';
import 'presentation/controllers/locale_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LocaleController());

    return GetMaterialApp(
      title: 'FSM Mobile',
      debugShowCheckedModeBanner: false,
      theme: lightTheme, 
      darkTheme: darkTheme,
      initialRoute: '/',
      getPages: routes,
    );
  }
}
