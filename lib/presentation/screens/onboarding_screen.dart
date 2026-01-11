import 'package:flutter/material.dart';
import 'package:fsm_mobile/presentation/controllers/onboarding_controller.dart';
import 'package:fsm_mobile/presentation/widgets/common/primary_button.dart';
import 'package:fsm_mobile/presentation/widgets/onboarding/onboarding_dot.dart';
import 'package:fsm_mobile/presentation/widgets/onboarding/onboarding_slider.dart';
import 'package:fsm_mobile/utils/exit_app.dart';
import 'package:get/get.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) return;
        
        final shouldExit = await alertExitApp();
        
        if (shouldExit && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 40,
              bottom: 15,
            ),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: controller.onPageChanged,
                    itemCount: controller.pages.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: OnboardingSlider(
                              onboardingModel: controller.pages[index],
                            ),
                          ),
                          const SizedBox(height: 80),
                          OnboardingDot(),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Obx(
                  () => PrimaryButton(
                    text: controller.isLastPage ? "Get Started" : "Next",
                    onPressed: controller.nextPage,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}