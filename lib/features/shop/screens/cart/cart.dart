import 'package:flutter/material.dart';
import 'package:food/common/widgets/appbar/appbar.dart';
import 'package:food/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:food/features/shop/screens/checkout/checkout.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:get/get.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:TAppBar(showBackArrow:true,title: Text('Cart',style: Theme.of(context).textTheme.headlineSmall)),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        ///Items
        child: TCartItems(),

        ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => const CheckOutScreen()),child: const Text('CheckOut ₹250.0')),
      ),
    );
  }
}


