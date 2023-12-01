import 'package:flutter/material.dart';
//import 'package:food/common/styles/spacing_styles.dart';
import 'package:food/common/widgets/login_signup/form_divider.dart';
import 'package:food/features/authentication/screens/login/widgets/login_form.dart';
import 'package:food/features/authentication/screens/login/widgets/login_header.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:food/widgets/login_Bg_img.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/text_strings.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
            padding: EdgeInsets.all(20),
              child: Column(
                children: [
                 const TLoginHeader(),
                  
                  ///Form
                  const TLoginForm(),

                  TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
            const SizedBox(height: TSizes.spaceBtwSections),

            const TSocialButtons()


                  
                ],
              ),
            ),
          
        ),),
      ],
    );
  }
}









