import 'package:flutter/material.dart';
import 'package:food/common/widgets/favourite_button.dart';
import 'package:food/features/shop/controllers/product/cart_controller.dart';
import 'package:food/features/shop/models/product_model.dart';
import 'package:food/features/shop/screens/store/widgets/shimmer_image.dart';
import 'package:food/utils/helpers/helper_functions.dart';
import 'package:food/features/shop/screens/home/widgets/add_to_cart_round_button.dart';
import 'package:get/get.dart';

class PopularProductSmallCard extends StatelessWidget {
  final ProductModel productModel;
  const PopularProductSmallCard({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: THelperFunctions.screenWidth() * 0.4,
      decoration: BoxDecoration(
        color: THelperFunctions.isDarkMode(context)
            ? Colors.black54
            : const Color.fromARGB(212, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8.0),
                    child: Text(
                      '₹${productModel.price}',
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                            color: Colors.black,
                          ),
                    ),
                  ),
                ),
              ),
              Obx(() {
                if (CartController.instance
                        .getProductQuantityInCart(productModel.id) ==
                    0) {
                  return Positioned(
                    bottom: 5,
                    left: 50,
                    right: 50,
                    child: GestureDetector(
                      onTap: () => CartController.instance
                          .addOneProductToCart(productModel),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(212, 255, 255, 255),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 2),
                          child: Text(
                            'Add',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  );
                }

                return Positioned(
                  bottom: 5,
                  left: 30,
                  right: 30,
                  child: AddToCartRoundButton(
                    product: productModel,
                  ),
                );
              })
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Text(
              productModel.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
