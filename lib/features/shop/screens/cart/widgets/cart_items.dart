import 'package:flutter/material.dart';
import 'package:food/common/widgets/products/cart/add_remove_button.dart';
import 'package:food/common/widgets/products/cart/cart_item.dart';
import 'package:food/features/shop/controllers/product/cart_controller.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/texts/product_price_text.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key, 
   this.showAddRemoveButtons =true,
    });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(
      () => ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (_,__) => const SizedBox(height: TSizes.spaceBtwSections),
            itemCount: cartController.cartItems.length,
            itemBuilder: (_,index) => Obx(()
              { final item = cartController.cartItems[index];
                return Column(
                children: [
                  ///cart item
                  TCartItem(cartItem: item),
                  if(showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems),
                
                  ///AddRemove
                  if(showAddRemoveButtons)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 70),
                          ///Add and remove
                          TProductQuantityAddRemoveButton(
                            quantity: item.quantity,
                            add: () => cartController.addOneToCart(item),
                          remove: () => cartController.removeOneFromCart(item),
                          ),
                        ],
                      ),
                      //total price
                      TProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                        
                    ],
                  )
                ],
              );}
            ),
             ),
    );
  }
}