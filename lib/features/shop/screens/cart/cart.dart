import 'package:flutter/material.dart';
import 'package:food/common/widgets/appbar/appbar.dart';
import 'package:food/common/widgets/loaders/animation_loader.dart';
import 'package:food/features/shop/controllers/product/cart_controller.dart';
import 'package:food/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:food/features/shop/screens/checkout/checkout.dart';
import 'package:food/navigation_menu.dart';
import 'package:food/utils/constants/image_strings.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title:
              Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: Obx(
        () {
          ///Nothing found widget
          final emptyWidget = TAnimationLoaderWidget(
            text: 'Whoops! Cart is Empty',
            animation: TImages.cartanimation,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          if (controller.cartItems.isEmpty) {
            return emptyWidget;
          } else {
            return const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),

                ///Items
                child: TCartItems(),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const CheckOutScreen()),
                child: Obx(
                  () => Text('CheckOut \$${controller.totalCartPrice.value}'),
                ),
              ),
            ),
    );
  }
}
