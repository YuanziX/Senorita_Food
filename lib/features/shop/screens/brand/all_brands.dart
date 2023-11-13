import 'package:flutter/material.dart';
import 'package:food/common/widgets/appbar/appbar.dart';
import 'package:food/common/widgets/brands/brand_card.dart';
import 'package:food/common/widgets/layouts/gird_layout.dart';
import 'package:food/common/widgets/texts/section_heading.dart';
import 'package:food/features/shop/screens/brand/brand_products.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Brand'),showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            ///HEading
            const TSectionHeading(title: 'Brands',showActionButton: true),
            const SizedBox(height: TSizes.spaceBtwItems),

            ///Brands
            TGirdLayout(
              itemCount: 8, 
              mainAxisExtent: 80,
              itemBuilder:(context,index) => TBrandCard(showBorder: true, onTap: () => Get.to(() => const BrandProducts()),)),
          ],
        ),
        ),
      ),
    );
  }
}