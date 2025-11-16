import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fsm_mobile/data/model/onboarding_model.dart';

class OnboardingSlider extends StatelessWidget {
  final OnboardingModel onboardingModel;

  const OnboardingSlider({super.key, required this.onboardingModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: 350,
          child: SvgPicture.asset(onboardingModel.image, fit: BoxFit.contain),
        ),
        const SizedBox(height: 50),
        Text(
          onboardingModel.title,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(height: 20),
        Text(
          onboardingModel.subtitle,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18),
        ),
      ],
    );
  }
}
