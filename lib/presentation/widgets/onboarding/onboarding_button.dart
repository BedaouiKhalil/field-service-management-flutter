import 'package:flutter/material.dart';
import 'package:fsm_mobile/core/constants/app_colors.dart';
import 'package:fsm_mobile/presentation/controllers/onboarding_controller.dart';
import 'package:get/get.dart';

class OnboardingButton extends GetView<OnboardingController> {
  const OnboardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: controller.nextPage,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            controller.isLastPage ? "Get Started" : "Next",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
