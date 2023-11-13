import 'package:flutter/material.dart';
import 'package:food/common/styles/TRoundedContainer.dart';
import 'package:food/common/widgets/texts/section_heading.dart';
import 'package:food/utils/constants/colors.dart';
import 'package:food/utils/constants/image_strings.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:food/utils/helpers/helper_functions.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return  Column(
      children: [
        TSectionHeading(title: 'Payment Method',buttonTitle: 'Change',onPressed: () {}),
        const SizedBox(height: TSizes.spaceBtwItems/2),
        Row(children: [
          TRoundedContainer(
            width: 60,
            height: 35,
            backgroundColor: dark ? TColors.light : TColors.white,
            padding: const EdgeInsets.all(TSizes.sm),
            child: const Image(image: AssetImage(TImages.paytm),fit: BoxFit.contain),
          ),
          const SizedBox(width: TSizes.spaceBtwItems/2),
          Text('Paytm',style: Theme.of(context).textTheme.bodyLarge),
        ],)
      ],
    );
  }
}