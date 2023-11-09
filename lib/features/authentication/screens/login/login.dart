import 'package:flutter/material.dart';
import 'package:food/common/styles/spacing_styles.dart';
import 'package:food/common/widgets_login_signup/form_divider.dart';
import 'package:food/features/authentication/screens/login/widgets/login_form.dart';
import 'package:food/features/authentication/screens/login/widgets/login_header.dart';
import 'package:food/common/widgets_login_signup/social_buttons.dart';
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
        child: Padding(
            padding: TSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              children: [
                ///Logo,Title and SubTitle
                const TLoginHeader(),

                ///Form
                const TLoginForm(),

                ///Divider
                TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
                const SizedBox(height: TSizes.spaceBtwSections),

                const TSocialButtons()
              ],
            )),
      ),
    );
  }
}
