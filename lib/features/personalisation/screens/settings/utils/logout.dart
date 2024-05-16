import 'package:food/routes/routes.dart';
import 'package:food/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';

void logout() {
  TLocalStorage.instance().clearAll();
  Get.offAllNamed(TRoutes.signIn);
}
