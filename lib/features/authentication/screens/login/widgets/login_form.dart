import 'package:flutter/material.dart';
import 'package:food/features/authentication/controllers/login/login_controller.dart';
import 'package:food/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:food/features/authentication/screens/signup/signup.dart';
//import 'package:food/features/authentication/screens/signup/signup.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:food/utils/constants/text_strings.dart';
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.message), labelText: TTexts.email),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // Password
            Obx(
              () => TextFormField(
                validator: (value) => TValidator.validateEmptyText('Password',value),
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
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
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignIn(),
                    child: const Text(TTexts.signIn))),
            const SizedBox(height: TSizes.spaceBtwItems * 1.5),

            /*create Account
                  SizedBox(
                    width:double.infinity,
                    child: OutlinedButton(onPressed: () => Get.to(()=> const SignupScreen()) , 
                    child: const Text(TTexts.createAccount))),*/

            Column(
              children: [
                const Text("Don't have an account?",
                    style: TextStyle(fontSize: 10)),
                TextButton(
                    onPressed: () => Get.to(const SignupScreen()),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: const Text(TTexts.signup,
                        style: TextStyle(fontSize: 15))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}