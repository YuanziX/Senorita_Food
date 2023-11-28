import 'package:flutter/material.dart';
import 'package:food/common/widgets/appbar/appbar.dart';
//import 'package:food/common/widgets/images/t_rounded_images.dart';
import 'package:food/common/widgets/products/prodect_cards/product_card_horizontal.dart';
import 'package:food/common/widgets/texts/section_heading.dart';
import 'package:food/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:food/utils/constants/image_strings.dart';
import 'package:food/utils/constants/sizes.dart';


class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> banners = [
      TImages.banner1,
      TImages.banner2,
      TImages.banner3,
    ];
    return Scaffold(
      appBar: const TAppBar(title: Text('Sports'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Banner
              PromoSlider(banners: banners),
              /*const TRoundedImage(
                  width: double.infinity,
                  imageUrl: TImages.banner8,
                  applyImageRadius: true),*/
              const SizedBox(height: TSizes.spaceBtwSections),

              //Sub-Categories
              Column(
                children: [
                  // Heading
                  TSectionHeading(
                    title: 'Sports Shirts',
                    onPressed: () {},
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => 
                            const SizedBox(width: TSizes.spaceBtwItems),
                        itemBuilder: (context, index) =>
                            const TProductCardHorizontal()),
                            
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
