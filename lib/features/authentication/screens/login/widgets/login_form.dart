import 'package:flutter/material.dart';
import 'package:food/features/authentication/controllers/login/login_controller.dart';
import 'package:food/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:food/features/authentication/screens/signup/signup.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:food/utils/constants/text_strings.dart';
import 'package:food/utils/helpers/helper_functions.dart';
import 'package:food/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(143, 148, 251, .2),
                blurRadius: 20,
                offset: Offset(0, 0),
              )
            ]),
        width: THelperFunctions.screenWidth() * 0.98,
        child: Column(
          children: [
            // Email
            Container(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: TextFormField(
                controller: controller.email,
                validator: (value) => TValidator.validateEmail(value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.message),
                  labelText: TTexts.email,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),

            // Password
            Container(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Obx(
                () => TextFormField(
                  validator: (value) =>
                      TValidator.validateEmptyText('Password', value),
                  controller: controller.password,
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                    labelText: TTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(
                        controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye,
                      ),
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ///Remember Me
                    Obx(() => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value)),
                    const Text(TTexts.rememberMe),
                  ],
                ),

                ///Forgot Password
                TextButton(
                    onPressed: () => Get.to(const ForgotPassword()),
                    child: const Text(TTexts.forgetPassword)),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            ///SignIn Button
            SizedBox(
              width: THelperFunctions.screenWidth() * 0.4,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: const Text(TTexts.signIn),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems * 1.5),

            const Text("Don't have an account?",
                style: TextStyle(fontSize: 12)),
            TextButton(
              onPressed: () => Get.to(const SignupScreen()),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: const Text(
                TTexts.signup,
                style: TextStyle(fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
