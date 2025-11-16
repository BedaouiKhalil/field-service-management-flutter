import 'package:flutter/material.dart';
import 'package:fsm_mobile/core/constants/app_routes.dart';
import 'package:fsm_mobile/core/constants/onboarding_data.dart';
import 'package:fsm_mobile/data/model/onboarding_model.dart';
import 'package:fsm_mobile/presentation/screens/login_screen.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final RxList<OnboardingModel> pages = <OnboardingModel>[].obs;
  final RxInt currentPage = 0.obs;
  final PageController pageController = PageController();

  // GETTERS
  bool get isLastPage => currentPage.value == pages.length - 1;
  bool get isFirstPage => currentPage.value == 0;

  @override
  void onInit() {
    _loadPages();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void _loadPages() {
    pages.value = OnboardingData.pages;
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (isLastPage) {
      _completeOnboarding();
      return;
    }
    pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _completeOnboarding() {
    Get.offAllNamed(AppRoutes.login);
  }
}
