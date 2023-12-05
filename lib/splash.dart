import 'package:flutter/material.dart';
import 'package:food/features/authentication/screens/login/login.dart';
import 'package:food/features/authentication/screens/onboarding/onboarding.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // video controller
  late VideoPlayerController _controller;

  final deviceStorage = GetStorage();

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(
      'assets/nike-animation.mp4',
    )
      ..initialize().then((_) {
        setState(() {});
      })
      ..setVolume(0.0);

    _playVideo();
  }

  void _playVideo() async {
    // playing video
    _controller.play();

    // add delay till video is complete
    await Future.delayed(const Duration(seconds: 4));

    // Check if it's the first time
    deviceStorage.writeIfNull('isFirstTime', true);
    bool isFirstTime = deviceStorage.read('isFirstTime') ?? true;

    // Navigating to the appropriate screen
    Get.off(() => isFirstTime ? const OnBoardingScreen() : const LoginScreen());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(
                  _controller,
                ),
              )
            : Container(),
      ),
    );
  }
}
