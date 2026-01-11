import 'package:fsm_mobile/core/constants/app_routes.dart';
import 'package:fsm_mobile/presentation/bindings/auth_binding%20.dart';
import 'package:fsm_mobile/presentation/bindings/onboarding_binding.dart';
import 'package:fsm_mobile/presentation/screens/home_screen.dart';
import 'package:fsm_mobile/presentation/screens/login_screen.dart';
import 'package:fsm_mobile/presentation/screens/onboarding_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: "/", page: () => const OnboardingScreen(), binding: OnboardingBinding()),
  GetPage(name: AppRoutes.login, page: () => LoginScreen(), binding: AuthBinding()),
  GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
];
