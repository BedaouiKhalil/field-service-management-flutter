import 'package:flutter/material.dart';
import 'package:fsm_mobile/presentation/controllers/onboarding_controller.dart';
import 'package:get/get.dart';

class OnboardingDot extends GetView<OnboardingController> {
  const OnboardingDot({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        controller.pages.length,
        (i) => Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: i == controller.currentPage.value ? theme.primaryColor : theme.primaryColor.withValues(alpha: 0.3),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          width: i == controller.currentPage.value ? 30 : 10,
          height: 10,
        ),
      ),
    ));
  }
}
