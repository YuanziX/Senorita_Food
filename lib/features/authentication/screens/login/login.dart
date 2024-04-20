import 'package:flutter/material.dart';
import 'package:food/common/widgets/custom_shapes/container/primary_login_header_container.dart';
import 'package:food/common/widgets/login_signup/form_divider.dart';
import 'package:food/features/authentication/screens/login/widgets/login_form.dart';
import 'package:food/features/authentication/screens/login/widgets/login_header.dart';
import 'package:food/common/widgets/login_signup/social_buttons.dart';
//import 'package:food/utils/constants/colors.dart';
//import 'package:food/utils/constants/image_strings.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:food/utils/constants/text_strings.dart';
//import 'package:food/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Logo,Title and SubTitle
            const TPrimaryLoginHeaderContainer(
                child: 
                Column(children: [TLoginHeader()])
                ),

            ///Form

            const Padding(
              padding: EdgeInsets.all(20),
              child: 
              TLoginForm(),
            ),

            ///Divider
            TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
            const SizedBox(height: TSizes.spaceBtwSections),

            const TSocialButtons()
          ],
        ),
      ),
    );
  }
}