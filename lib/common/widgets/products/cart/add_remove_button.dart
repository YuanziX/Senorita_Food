import 'package:flutter/material.dart';
import 'package:food/common/widgets/icons/t_circular_icon.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:food/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class TProductQuantityAddRemoveButton extends StatelessWidget {
  const TProductQuantityAddRemoveButton({
    super.key, required this.quantity, this.add, this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
          backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
          onPressed: remove,
          ),
          const SizedBox(width: TSizes.spaceBtwItems),

          Text(quantity.toString(),style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(width: TSizes.spaceBtwItems),
          
          TCircularIcon(
            icon: Iconsax.add,
            width: 32,
            height: 32,
            size: TSizes.md,
            color: TColors.white,
            backgroundColor: TColors.primary,
            onPressed: add,
      ),
      ],
    );
  }
}
