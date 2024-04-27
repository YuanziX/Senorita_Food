import 'package:flutter/material.dart';
import 'package:food/common/widgets/images/t_rounded_images.dart';
import 'package:food/common/widgets/products/cart/add_to_cart_button.dart';
import 'package:food/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:food/common/widgets/texts/product_title_text.dart';
import 'package:food/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:food/features/shop/controllers/product/product_controller.dart';
import 'package:food/features/shop/models/product_model.dart';
import 'package:food/features/shop/screens/product_details/product_detail.dart';
import 'package:food/utils/constants/colors.dart';
import 'package:food/utils/enums/enums.dart';
import 'package:food/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
//import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../styles/TRoundedContainer.dart';
import '../../../styles/shadows.dart';
import '../../texts/product_price_text.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});

  final ProductModel product;

//   @override
//   _TProductCardVerticalState createState() => _TProductCardVerticalState();
// }

// class _TProductCardVerticalState extends State<TProductCardVertical> {
   final bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(
        product.price, product.salePrice);
    return GestureDetector(
      onTap: () => Get.to(()=> ProductDetail(product: product)),
      // onTapDown: (_) {
      //   setState(() {
      //     isPressed = true;
      //   });
      // },
      // onTapUp: (_) {
      //   setState(() {
      //     isPressed = false;
      //   });
      //   Get.to(() => ProductDetail(product: widget.product));
      // },
      // onTapCancel: () {
      //   setState(() {
      //     isPressed = false;
      //   });
      // },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 140),
        transform: Matrix4.identity()..scale(isPressed ? 0.95 : 1.0),
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: 
          //isPressed ? TColors.dark.withOpacity(0.8) : 
              (dark ? TColors.darkerGrey : TColors.white),
        ),
        child: Column(
          children: [
            TRoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  ///Thumbnail Image
                  Center(
                    child: TRoundedImage(
                      height: 180,
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                      isNetworkImage: true,
                    ),
                  ),

                  ///Sale Tag
                  if (salePercentage != null)
                    Positioned(
                      top: 12,
                      child: TRoundedContainer(
                        radius: TSizes.sm,
                        backgroundColor: TColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: TSizes.sm, vertical: TSizes.xs),
                        child: Text('$salePercentage%',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: TColors.black)),
                      ),
                    ),

                  ///Favourite Icon
                  Positioned(
                    top: 0,
                    right: 0,
                    child: TFavouriteIcon(productId: product.id),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections / 2),

            ///Details
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(
                    title: product.title,
                    smallSize: true,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  TBrandTitleWithVerifiedIcon(
                    title: product.brand!.name,
                  ),
                ],
              ),
            ),

            ///Spacer
            const Spacer(),

            ///Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: TSizes.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left: TSizes.sm),
                        child: TProductPriceText(
                            price: controller.getProductPrice(product),
                            isLarge: true),
                      ),
                    ],
                  ),
                ),

                ///Add to cart button
                // Container(
                //   decoration: const BoxDecoration(
                //     color: TColors.dark,
                //     borderRadius: BorderRadius.only(
                //       topLeft: Radius.circular(TSizes.cardRadiusMd),
                //       bottomRight: Radius.circular(TSizes.productImageRadius),
                //     ),
                //   ),
                //   child: const SizedBox(
                //       width: TSizes.iconLg * 1.2,
                //       height: TSizes.iconLg * 1.2,
                //       child: Center(
                //           child: Icon(Iconsax.add, color: TColors.white))),
                ProductCardAddToCartButton(product: product),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
