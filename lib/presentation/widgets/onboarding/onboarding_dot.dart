import 'package:flutter/material.dart';
import 'package:fsm_mobile/presentation/controllers/onboarding_controller.dart';
import 'package:get/get.dart';

class OnboardingDot extends GetView<OnboardingController> {
  const OnboardingDot({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          controller.pages.length,
          (i) => Container(
            width: i == controller.currentPage.value ? 30 : 10,
            height: 10,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: i == controller.currentPage.value
                  ? theme.colorScheme.primary
                  : theme.colorScheme.primary.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
