import 'package:flutter/material.dart';
import 'package:food/common/widgets/appbar/appbar.dart';
import 'package:food/common/widgets/images/t_circular_image.dart';
import 'package:food/common/widgets/texts/section_heading.dart';
import 'package:food/features/personalisation/screens/profile/widgets/profile_menu.dart';
import 'package:food/utils/constants/image_strings.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: Text('Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const TCircularImage(
                      image: TImages.user, width: 80, height: 80),
                  TextButton(
                      onPressed: () {},
                      child: const Text('Change Profile Picture')),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),
            const TSectionHeading(
                title: 'Profile Information', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems),
            TProfileMenu(title: 'Name', value: 'Naga Charan', onPressed: () {}),
            TProfileMenu(
                title: 'UserName', value: 'Naga_Charan', onPressed: () {}),

            const SizedBox(height: TSizes.spaceBtwItems / 2),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            //Heading Personal Info

            const TSectionHeading(
                title: 'Personal Information', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems),

            TProfileMenu(
                title: 'User ID',
                value: '42069',
                icon: Iconsax.copy,
                onPressed: () {}),
            TProfileMenu(
                title: 'E-mail',
                value: 'nagacharan@gmail.com',
                onPressed: () {}),
            TProfileMenu(
                title: 'Ph.no', value: '+91 9119119110', onPressed: () {}),
            TProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
            TProfileMenu(
                title: 'D.O.B', value: '01 Jan, 2001', onPressed: () {}),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),
            Center(
              child: TextButton(
                onPressed: () => Get.back(),
                child: const Text('Close Account',
                    style: TextStyle(color: Colors.red)),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
