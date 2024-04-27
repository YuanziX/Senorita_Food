import 'package:flutter/material.dart';
import 'package:food/common/styles/TRoundedContainer.dart';
import 'package:food/common/widgets/icons/t_circular_icon.dart';
import 'package:food/features/shop/models/product_model.dart';
import 'package:food/features/shop/screens/product_details/product_detail.dart';
import 'package:food/utils/constants/colors.dart';
import 'package:food/utils/constants/image_strings.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:food/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CardDetail extends StatelessWidget {
  const CardDetail({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetail(product: product)),
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ProductDetail(product: product),
      //   ),
      // );

      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: dark ? TColors.darkerGrey : TColors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 1,
                    color: Color(0x520E151B),
                    offset: Offset(0, 1),
                  )
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Image.asset(
                        TImages.promoBanner2,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: TColors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Burgirr',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.apply(
                                          color: dark
                                              ? Colors.black
                                              : Colors.black),
                                ),
                                Text(
                                  '\$6.20',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.apply(
                                          color: dark
                                              ? Colors.black
                                              : Colors.black),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'This is the burgir that he ate in the boat stoopid',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.apply(
                                      color:
                                          dark ? Colors.black : Colors.black),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: TSizes.sm),
                                ),

                                ///Add to cart button
                                Container(
                                  decoration: const BoxDecoration(
                                    color: TColors.dark,
                                    borderRadius: BorderRadius.only(
                                      topLeft:
                                          Radius.circular(TSizes.cardRadiusMd),
                                      bottomRight: Radius.circular(
                                          TSizes.productImageRadius),
                                    ),
                                  ),
                                  child: const SizedBox(
                                      width: TSizes.iconLg * 1.2,
                                      height: TSizes.iconLg * 1.2,
                                      child: Center(
                                          child: Icon(Iconsax.add,
                                              color: TColors.white))),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            top: 24,
            right: 24,
            child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
          ),
          Positioned(
            top: 33,
            left: 29,
            child: TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
