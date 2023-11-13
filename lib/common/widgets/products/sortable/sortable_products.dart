import 'package:flutter/material.dart';
import 'package:food/common/widgets/layouts/gird_layout.dart';
import 'package:food/common/widgets/products/prodect_cards/product_card_vertical.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///DropDown
        DropdownButtonFormField(
          decoration:const InputDecoration(prefixIcon: Icon(Iconsax.sort)) ,
          onChanged: (value){},
          items:['Higher Price','Lower Price','Popularity','Newest','Sale'].
          map((option) => DropdownMenuItem(value: option,child: Text(option))).toList(), 
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          TGirdLayout(itemCount: 10, itemBuilder: (_,index)=> const TProductCardVertical())
      ],
    );
  }
}