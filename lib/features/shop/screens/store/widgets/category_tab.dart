import 'package:flutter/material.dart';
import 'package:food/common/widgets/brands/brand_showcase.dart';
import 'package:food/common/widgets/layouts/gird_layout.dart';
import 'package:food/common/widgets/products/prodect_cards/product_card_vertical.dart';
import 'package:food/common/widgets/texts/section_heading.dart';
import 'package:food/utils/constants/image_strings.dart';
import 'package:food/utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
      Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(children: [
              ///Brands
              const TBrandShowCase(images: [TImages.productImage3,TImages.productImage2,TImages.productImage1]),
              const TBrandShowCase(images: [TImages.productImage3,TImages.productImage2,TImages.productImage1]),
              const SizedBox(height: TSizes.spaceBtwItems),

    
              ///Products
              TSectionHeading(title: 'You might like',onPressed: () {}),
              const SizedBox(height: TSizes.spaceBtwItems),
    
              TGirdLayout(itemCount:4, itemBuilder: (_,index) => const TProductCardVertical()),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
            ),
            ),
      ],
    );
  }
}