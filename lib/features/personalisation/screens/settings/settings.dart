import 'package:flutter/material.dart';
import 'package:food/common/widgets/appbar/appbar.dart';
import 'package:food/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:food/common/widgets/layouts/listTiltes/setting_menu_tile.dart';
import 'package:food/common/widgets/layouts/listTiltes/user_profile.dart';
import 'package:food/common/widgets/texts/section_heading.dart';
import 'package:food/features/personalisation/screens/address/address.dart';
import 'package:food/features/personalisation/screens/profile/widgets/profile.dart';
import 'package:food/utils/constants/colors.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // AppBar
                  TAppBar(
                      title: Text('Account',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: TColors.white))),
                  // User Profile card
                  TUserProfileTile(
                      onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            // body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(children: [
                const TSectionHeading(
                  title: 'Account Settings',
                  showActionButton: false,
                ),
                TSettingsMenuTile(
                  icon: Iconsax.safe_home,
                  title: 'My Address',
                  subtitle: 'Set Shopping delivery Address',
                  onTap: () => Get.to(() => const UserAddressScreen()),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                TSettingsMenuTile(
                  icon: Iconsax.shopping_cart,
                  title: 'My Cart',
                  subtitle: 'Add, remove products and move to checkout',
                  onTap: () {},
                ),
                TSettingsMenuTile(
                  icon: Iconsax.bag_tick,
                  title: 'My Orders',
                  subtitle: 'In-progress and completed orders',
                  onTap: () {},
                ),
                TSettingsMenuTile(
                  icon: Iconsax.bank,
                  title: 'Bank Account',
                  subtitle: 'Withdraw balance to registered bankaccount',
                  onTap: () {},
                ),
                TSettingsMenuTile(
                  icon: Iconsax.discount_shape,
                  title: 'My Coupons',
                  subtitle: 'List of all discounted coupons',
                  onTap: () {},
                ),
                TSettingsMenuTile(
                  icon: Iconsax.notification,
                  title: 'Notifications',
                  subtitle: 'Set any kind of notification message',
                  onTap: () {},
                ),
                TSettingsMenuTile(
                  icon: Iconsax.security_card,
                  title: 'Account Privacy',
                  subtitle: 'Manage data usage and connected accounts',
                  onTap: () {},
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                const TSectionHeading(
                    title: 'App Settings', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),
                const TSettingsMenuTile(
                  icon: Iconsax.document_upload,
                  title: 'Load Data',
                  subtitle: 'Upload your data to cloud firebase',
                ),
                TSettingsMenuTile(
                  icon: Iconsax.location,
                  title: 'Geolocation',
                  subtitle: 'Set recommendation based on location',
                  trailing: Switch(value: true, onChanged: (value) {}),
                ),
                TSettingsMenuTile(
                  icon: Iconsax.security_user,
                  title: 'Safe Mode',
                  subtitle: 'Search result is safe for all ages',
                  trailing: Switch(value: false, onChanged: (value) {}),
                ),
                TSettingsMenuTile(
                  icon: Iconsax.image,
                  title: 'HD Image Quality',
                  subtitle: 'Set image quality to be seen',
                  trailing: Switch(value: false, onChanged: (value) {}),
                ),
                // Logout
                const SizedBox(height: TSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () {}, child: const Text('logout')),
                ),
                const SizedBox(height: TSizes.spaceBtwSections * 2.5),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
