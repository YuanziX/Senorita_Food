import 'package:flutter/material.dart';
import 'package:food/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:food/common/widgets/custom_shapes/container/search_container.dart';
import 'package:food/common/widgets/texts/section_heading.dart';
import 'package:food/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:food/features/shop/screens/home/widgets/home_categories.dart';
import 'package:food/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:food/utils/constants/image_strings.dart';
import 'package:food/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            TPrimaryHeaderContainer(
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
                  )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: PromoSlider(
                  banners: [TImages.banner1, TImages.banner2, TImages.banner3],
                ))
          ],
        ),
      ),
    );
  }
}
