import 'package:flutter/material.dart';
import 'package:food/common/styles/TRoundedContainer.dart';
import 'package:food/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import 'brand_card.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key, 
    required this.images,
  });

final List<String> images;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children:[
        ///Brands with Product Count
        const TBrandCard(showBorder: false),
        const SizedBox(height: TSizes.spaceBtwItems),

        ///Brand top 3 Product Images
        Row(children: 
          images.map((image) => brandTopProductImageWidget(image, context)).toList(),
        ),
        
        
        ],
        
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image,context){
  return Expanded(child: TRoundedContainer(
    height: 100,
    backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkGrey : TColors.light,
    margin: const EdgeInsets.only(right: TSizes.sm),
    padding: const EdgeInsets.all(TSizes.md),
    child: Image(fit: BoxFit.contain,image: AssetImage(image)),
    
  ),);
}
