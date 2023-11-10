import 'package:flutter/material.dart';
import 'package:food/common/widgets/login_signup/form_divider.dart';
import 'package:food/common/widgets/login_signup/social_buttons.dart';
import 'package:food/features/authentication/screens/signup/widgets/signup_form.dart';
//import 'package:food/utils/constants/colors.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:food/utils/constants/text_strings.dart';
import 'package:get/get.dart';
//import 'package:iconsax/iconsax.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen
({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(TTexts.signupTitle,style: Theme.of(context).textTheme.headlineMedium),

            ///Form
            TSignupForm(),
            const SizedBox(height: TSizes.spaceBtwSections),

            ///Divider
            TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
            const SizedBox(height: TSizes.spaceBtwSections),

            ///Social Buttons
            const TSocialButtons(),
          ]),
          ),
        ),
    );
  }
}

