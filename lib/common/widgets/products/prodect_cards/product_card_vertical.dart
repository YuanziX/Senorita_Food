import 'package:flutter/material.dart';
import 'package:food/common/widgets/favourite_button.dart';
import 'package:food/common/widgets/texts/product_title_text.dart';
import 'package:food/features/shop/models/product_model.dart';
import 'package:food/features/shop/screens/store/widgets/add_to_cart_button.dart';
import 'package:food/features/shop/screens/store/widgets/shimmer_image.dart';
import 'package:food/utils/constants/colors.dart';
import 'package:food/utils/helpers/helper_functions.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../styles/TRoundedContainer.dart';
import '../../../styles/shadows.dart';
import '../../texts/product_price_text.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});

  final ProductModel product;

  final bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 140),
      transform: Matrix4.identity()..scale(isPressed ? 0.95 : 1.0),
      height: 260,
      width: 180,
      decoration: BoxDecoration(
        boxShadow: [TShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: (dark ? TColors.darkerGrey : TColors.white),
      ),
      child: Column(
        children: [
          TRoundedContainer(
            height: 180,
            width: 180,
            radius: 12,
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                ///Thumbnail Image
                Center(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                    child: ShimmerImage(
                      height: 180,
                      width: double.infinity,
                      imageUrl: product.thumbnail,
                    ),
                  ),
                ),

                ///Favourite Icon
                Positioned(
                  top: 10,
                  right: 10,
                  child: FavouriteButton(prodId: product.id),
                ),
              ],
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections / 2),

          ///Details
          Padding(
            padding: const EdgeInsets.only(left: TSizes.sm),
            child: TProductTitleText(
              title: product.title,
              smallSize: true,
            ),
          ),

          ///Spacer
          const Spacer(),

          ///Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: TSizes.sm,
                  ),
                  child: TProductPriceText(price: product.price.toString()),
                ),
              ),
              AddToCartButton(
                product: product,
                color: Colors.black.withOpacity(0.8),
                fontColor: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
