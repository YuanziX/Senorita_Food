//import 'dart:math';

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:food/data/repositories.authentication/authentication_repo.dart';
import 'package:food/data/repositories.authentication/user/user_repo.dart';
import 'package:food/data/repositories.authentication/user/usermodel.dart';
import 'package:food/features/authentication/controllers/signup/network_manager.dart';
import 'package:food/features/authentication/screens/signup/verify_email.dart';
import 'package:food/utils/constants/image_strings.dart';
import 'package:food/utils/popups/full_screen_loader.dart';
import 'package:food/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // formValidation

  /// -- SIGNUP
  void signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...',TImages.daceranimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form Validation
      if (signupFormKey.currentState!.validate()) return;

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create an account you must have read and accept the Privacy Policy & Terms of Use.');
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());
      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
firstName: firstName.text.trim(),
lastName: lastName.text.trim(),
username: username.text.trim(),
email: email.text.trim(),
phoneNumber: phoneNumber.text.trim(),
profilePicture: ' ',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //Remove loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify email to continue.');

      // Move to Verify Email Screen
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      
// Remove Loader
      TFullScreenLoader.stopLoading();

//show some generic error
TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }
}
