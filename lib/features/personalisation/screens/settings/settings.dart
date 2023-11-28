import 'package:flutter/material.dart';
import 'package:food/common/widgets/appbar/appbar.dart';
import 'package:food/common/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:food/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:food/common/widgets/layouts/listTiltes/setting_menu_tile.dart';
import 'package:food/common/widgets/layouts/listTiltes/user_profile.dart';
import 'package:food/common/widgets/texts/section_heading.dart';
import 'package:food/features/personalisation/screens/address/address.dart';
import 'package:food/features/personalisation/screens/profile/widgets/profile.dart';
import 'package:food/features/shop/screens/cart/cart.dart';
import 'package:food/features/shop/screens/orders/order.dart';
import 'package:food/utils/constants/colors.dart';
import 'package:food/utils/constants/image_strings.dart';
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
                const SizedBox(height: TSizes.spaceBtwItems),
                TSettingsMenuTile(
                  icon: Iconsax.safe_home,
                  title: 'My Address',
                  subtitle: 'Set Shopping delivery Address',
                  onTap: () => Get.to(() => const UserAddressScreen()),
                ),
                TSettingsMenuTile(
                  icon: Iconsax.shopping_cart,
                  title: 'My Cart',
                  subtitle: 'Add, remove products and move to checkout',
                  onTap: () => Get.to(() => const CartScreen()),
                ),
                TSettingsMenuTile(
                  icon: Iconsax.bag_tick,
                  title: 'My Orders',
                  subtitle: 'In-progress and completed orders',
                  onTap: () => Get.to(() => const OrderScreen()),
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
                // About Dev
                const SizedBox(height: TSizes.spaceBtwSections),
                const TSectionHeading(
                    title: 'Developers', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),
                TSettingsMenuTile(
                  icon: Iconsax.discount_shape,
                  title: 'Naga Charan',
                  subtitle: 'Flutter Front End',
                  onTap: () {
                    CustomBottomSheet.show(context, 'Developer', [
                      Developer(
                        name: 'Naga Charan',
                        photoAsset: TImages.userProfileImage2,
                        role: 'Flutter Front End',
                        instagramHandle: 'Instagram',
                        linkedinHandle: 'linkedin',
                        instagramUrl:
                            'https://www.instagram.com/charantangella/',
                        linkedinUrl:
                            'https://www.linkedin.com/in/naga-charan-tangella-0482b5234/',
                      ),
                    ]);
                  },
                ),
                TSettingsMenuTile(
                  icon: Iconsax.discount_shape,
                  title: 'Venu Charan',
                  subtitle: 'Flutter Front End',
                  onTap: () {
                    CustomBottomSheet.show(context, 'Venu Charan', [
                      Developer(
                        name: 'Venu Charan',
                        photoAsset: TImages.userProfileImage3,
                        role: 'Flutter Front End',
                        instagramHandle: 'insta',
                        linkedinHandle: 'linkedin',
                        instagramUrl:
                            'https://www.instagram.com/charantangella/',
                        linkedinUrl:
                            'https://www.linkedin.com/in/naga-charan-tangella-0482b5234/',
                      ),
                    ]);
                  },
                ),
                // App Settings
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
