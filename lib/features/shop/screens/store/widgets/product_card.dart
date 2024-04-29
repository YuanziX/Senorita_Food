import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food/features/shop/models/product_model.dart';
import 'package:food/features/shop/screens/store/widgets/add_to_cart_button.dart';
import 'package:food/features/shop/screens/store/widgets/shimmer_image.dart';
import 'package:food/utils/helpers/helper_functions.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text('₹${product.price.toString()}'),
                const Spacer(),
                AddToCartButton(product: product)
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ShimmerImage(
              height: 150,
              width: THelperFunctions.screenWidth() * 0.4,
              imageUrl: product.thumbnail,
            ),
          ),
        ],
      ),
    );
  }
}
