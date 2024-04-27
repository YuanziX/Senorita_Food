import 'package:flutter/material.dart';
import 'package:food/features/personalisation/screens/settings/settings.dart';
import 'package:food/features/shop/screens/home/home.dart';
import 'package:food/features/shop/screens/store/store.dart';
import 'package:food/features/shop/screens/wishlist/wishlist.dart';
import 'package:food/utils/constants/colors.dart';
import 'package:food/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor:
              darkMode ? TColors.black : TColors.white.withOpacity(0.1),
          indicatorColor: darkMode
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            //NavigationDestination(icon: Icon(Iconsax.emoji_happy), label: 'Explore'),
            NavigationDestination(icon: Icon(Iconsax.shop_add), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'WishList'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    //const ExploreScreen(),
    const StoreScreen(),
    const FavouriteScreen(),
    const SettingScreen(),
  ];
}
