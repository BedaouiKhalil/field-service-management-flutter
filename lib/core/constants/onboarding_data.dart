

import 'package:fsm_mobile/core/constants/app_imgae_asset.dart';
import 'package:fsm_mobile/data/model/onboarding_model.dart';

class OnboardingData {
  static const List<OnboardingModel> pages = [
    OnboardingModel(
      title: 'Manage Field Operations',
      subtitle: 'Track, schedule, and monitor field agents in real time.',
      image: AppImageAsset.onBoardingImageOne,
    ),
    OnboardingModel(
      title: 'Assign & Monitor Tasks',
      subtitle: 'Create and assign work orders with just a few taps.',
      image: AppImageAsset.onBoardingImageTwo,
    ),
    OnboardingModel(
      title: 'Analyze Performance',
      subtitle: 'Gain insights to improve efficiency and decision-making.',
      image: AppImageAsset.onBoardingImageThree,
    ),
  ];


  static const double imageHeightRatio = 0.6;
  static const Duration animationDuration = Duration(milliseconds: 300);
}
