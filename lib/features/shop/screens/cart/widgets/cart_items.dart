import 'package:flutter/material.dart';
import 'package:food/common/widgets/products/cart/add_remove_button.dart';
import 'package:food/common/widgets/products/cart/cart_item.dart';
import 'package:food/utils/constants/sizes.dart';

import '../../../../../common/widgets/texts/product_price_text.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key, 
   this.showAddRemoveButtons =true,
    });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_,__) => const SizedBox(height: TSizes.spaceBtwSections),
          itemCount: 2,
          itemBuilder: (_,index) => Column(
            children: [
              ///cart item
              const TCartItem(),
              if(showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems),

              ///AddRemove
              if(showAddRemoveButtons)
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 70),
                      ///Add and remove
                      TProductQuantityAddRemoveButton(),
                    ],
                  ),
                  TProductPriceText(price: '250')
                    
                ],
              )
            ],
          ),
           );
  }
}