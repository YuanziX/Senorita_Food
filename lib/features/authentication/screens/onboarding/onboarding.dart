import 'package:food/features/authentication/controllers_onboarding/onboarding_controller.dart';
import 'package:food/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
//import 'package:food/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//import 'package:food/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:food/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:food/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:food/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
//import 'package:iconsax/iconsax.dart';
import 'package:food/utils/constants/image_strings.dart';
//import 'package:food/utils/constants/sizes.dart';
import 'package:food/utils/constants/text_strings.dart';
//import 'package:food/utils/device/device_utility.dart';




class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen
({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    

    return Scaffold(
      body: Stack(
        children: [
          //horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
                ),
                OnBoardingPage( 
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
                ),
                OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
                ),
            ],
          ),
        
         const  OnBoardingSkip(),
        
        const OnBoardingDotNavigation(),

        const OnBoardingNextButton()
        
        
        ]
     ),
    );
  }
}









