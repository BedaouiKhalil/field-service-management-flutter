import 'package:flutter/material.dart';
import 'package:fsm_mobile/presentation/controllers/onboarding_controller.dart';
import 'package:fsm_mobile/presentation/widgets/onboarding/onboarding_button.dart';
import 'package:fsm_mobile/presentation/widgets/onboarding/onboarding_dot.dart';
import 'package:fsm_mobile/presentation/widgets/onboarding/onboarding_slider.dart';
import 'package:get/get.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
                  onPageChanged: (val) {
                    controller.onPageChanged(val);
                  },
                  itemCount: controller.pages.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OnboardingSlider(
                          onboardingModel: controller.pages[index],
                        ),
                        const SizedBox(height: 80),
                        OnboardingDot(),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              OnboardingButton(),
            ],
          ),
        ),
      ),
    );
  }
}
