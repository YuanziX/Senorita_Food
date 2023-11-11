import 'package:flutter/material.dart';
import 'package:food/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:food/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:food/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:food/utils/helpers/helper_functions.dart';

class ProductDeatail extends StatelessWidget {
  const ProductDeatail({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final dark = THelperFunctions.isDarkMode(context);
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider

            TProductImageSlider(),

            /// Product Details

            Padding(
              padding: EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  // - Ratings & share buttton
                  TRatingandShare(),
                  // Price Title Stock and Brand
                  TProductMetaData(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
