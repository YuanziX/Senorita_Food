import 'package:flutter/material.dart';
import 'package:food/common/widgets/appbar/appbar.dart';
import 'package:food/common/widgets/icons/t_circular_icon.dart';
import 'package:food/common/widgets/images/t_rounded_images.dart';
import 'package:food/common/widgets/layouts/gird_layout.dart';
import 'package:food/common/widgets/loaders/animation_loader.dart';
import 'package:food/common/widgets/products/prodect_cards/product_card_vertical.dart';
import 'package:food/features/shop/controllers/product/favourite_controller.dart';
//import 'package:food/features/shop/screens/home/home.dart';
import 'package:food/navigation_menu.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:food/utils/helpers/cloud_helper_function.dart';
import 'package:food/utils/shimmers/vertical_product_shimmer.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/image_strings.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouriteController.instance;
    return Scaffold(
      appBar: TAppBar(
        title:
            Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const NavigationMenu()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: //Column(
          //   children: [
          //     const TRoundedImage(
          //         width: double.infinity,
          //         imageUrl: TImages.promoBanner5,
          //         applyImageRadius: true),
          //     const SizedBox(height: TSizes.spaceBtwItems),
              Obx(
                () => FutureBuilder(
                    future: controller.favouriteProducts(),
                    builder: (context, snapshot) {
                      // Nothing found widget
                      final emptyWidget = TAnimationLoaderWidget(
                        text: 'Whoops! Your WishList is empty..',
                        animation: TImages
                            .daceranimation, // Add animation image LATERrrrr
                        showAction: true,
                        actionText: 'Let\'s add some',
                        onActionPressed: () =>
                            Get.off(() => const NavigationMenu()),
                      );
                      const loader = TVerticalProductShimmer(itemCount: 6);
                      final widget =
                          TCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot,
                              loader: loader,
                              nothingFound: emptyWidget);
                      if (widget != null) return widget;
                      final products = snapshot.data!;
                      return TGirdLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) =>
                              TProductCardVertical(product: products[index]));
                    }),
              )
            //],
          ),
        ),
      );
    //);
  }
}
