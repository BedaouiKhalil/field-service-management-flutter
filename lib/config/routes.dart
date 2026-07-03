import 'package:fsm_mobile/core/constants/app_routes.dart';
import 'package:fsm_mobile/presentation/bindings/auth_binding.dart';
import 'package:fsm_mobile/presentation/bindings/onboarding_binding.dart';
import 'package:fsm_mobile/presentation/bindings/task/task_binding.dart';
import 'package:fsm_mobile/presentation/bindings/task/task_detail_binding.dart';
import 'package:fsm_mobile/presentation/screens/home_screen.dart';
import 'package:fsm_mobile/presentation/screens/login_screen.dart';
import 'package:fsm_mobile/presentation/screens/onboarding_screen.dart';
import 'package:fsm_mobile/presentation/screens/tasks/task_detail_screen.dart';
import 'package:fsm_mobile/presentation/screens/tasks/task_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>> routes = [
  GetPage(
    name: "/",
    page: () => const OnboardingScreen(),
    binding: OnboardingBinding(),
  ),
  GetPage(
    name: AppRoutes.login,
    page: () => LoginScreen(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: AppRoutes.tasks,
    page: () => TaskScreen(),
    binding: TaskBinding(),
  ),
  GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
  GetPage(
    name: AppRoutes.taskDetails,
    page: () => TaskDetailScreen(),
    binding: TaskDetailBinding(),
  ),
];
