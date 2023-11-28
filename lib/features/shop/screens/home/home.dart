import 'package:flutter/material.dart';
import 'package:food/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:food/common/widgets/custom_shapes/container/search_container.dart';
import 'package:food/common/widgets/products/prodect_cards/product_card_vertical.dart';
import 'package:food/common/widgets/texts/section_heading.dart';
import 'package:food/features/shop/screens/all_products/all_products.dart';
import 'package:food/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:food/features/shop/screens/home/widgets/home_categories.dart';
import 'package:food/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:food/utils/constants/image_strings.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/layouts/gird_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //Appbar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  //SearchBar
                  TSearchContainer(text: 'Search in Store'),
                  SizedBox(height: TSizes.spaceBtwSections),

                  //Categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TSectionHeading(
                            title: 'Popular Categories',
                            showActionButton: false,
                            textColor: Colors.white),
                        SizedBox(height: TSizes.spaceBtwItems),

                        //Categories
                        THomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    //Heading
                    TSectionHeading(
                      title: 'Popular Products',
                      onPressed: () => Get.to(() => const AllProducts()),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    TGirdLayout(
                        itemCount: 2,
                        itemBuilder: (_, index) =>
                            const TProductCardVertical()),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    const PromoSlider(banners: [
                      TImages.promoBanner3,
                      TImages.promoBanner1,
                      TImages.promoBanner2
                    ]),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),

                    TGirdLayout(
                        itemCount: 4,
                        itemBuilder: (_, index) =>
                            const TProductCardVertical()),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
