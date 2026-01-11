import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fsm_mobile/data/model/onboarding_model.dart';

class OnboardingSlider extends StatelessWidget {
  final OnboardingModel onboardingModel;

  const OnboardingSlider({super.key, required this.onboardingModel});

  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SvgPicture.asset(
              onboardingModel.image,
              fit: BoxFit.contain,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            onboardingModel.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              onboardingModel.subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 16),
            ),
          ),
        ],
      );
  }
}

