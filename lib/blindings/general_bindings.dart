//import 'package:flutter/services.dart';
import 'package:food/features/authentication/controllers/signup/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
