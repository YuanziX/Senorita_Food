import 'package:flutter/material.dart';
import 'package:food/common/widgets/favourite_button.dart';
import 'package:food/features/shop/models/product_model.dart';
import 'package:food/features/shop/screens/store/widgets/add_to_cart_button.dart';
import 'package:food/features/shop/screens/store/widgets/shimmer_image.dart';

class PopularProductBigCard extends StatelessWidget {
  final ProductModel productModel;
  const PopularProductBigCard({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ShimmerImage(
              imageUrl: productModel.thumbnail,
              height: 145,
              width: double.infinity,
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: FavouriteButton(
              prodId: productModel.id,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Color.fromARGB(212, 255, 255, 255),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  productModel.title,
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                        color: Colors.black,
                      ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                color: Color.fromARGB(212, 255, 255, 255),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '₹${productModel.price}',
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                        color: Colors.black,
                      ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: AddToCartButton(
              product: productModel,
              color: const Color.fromARGB(212, 255, 255, 255),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
