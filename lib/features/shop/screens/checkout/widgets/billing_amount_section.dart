//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food/features/shop/controllers/product/cart_controller.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:food/utils/helpers/pricing_calculator.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartcontroller = CartController.instance;
    final subTotal = cartcontroller.totalCartPrice.value;
    return Column(
      children: [
        ///SUbtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text(subTotal.toString()),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        ///Shipping fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text(
                '₹${TPricingCalculator.calculateShippingCost(subTotal, 'IND')}',
                style: Theme.of(context).textTheme.labelLarge)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        ///Tax fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text(
                '₹${TPricingCalculator.calculateTax(subTotal, 'IND')}',
                style: Theme.of(context).textTheme.labelLarge)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        ///Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text(
                '₹${TPricingCalculator.calculateTotalPrice(subTotal, 'IND')}',
                style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
      ],
    );
  }
}
