import 'package:flutter/material.dart';
import 'package:food/features/shop/controllers/product/cart_controller.dart';
import 'package:food/features/shop/models/product_model.dart';
import 'package:food/utils/constants/colors.dart';
import 'package:get/get.dart';

class AddToCartButton extends StatelessWidget {
  final ProductModel product;
  const AddToCartButton({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = CartController.instance;
    return Obx(() {
      return Container(
        child: cartController.getProductQuantityInCart(product.id) == 0
            ? GestureDetector(
                onTap: () => cartController.addOneProductToCart(product),
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  color: TColors.primary.withOpacity(0.8),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 34),
                    child: Text(
                      'ADD',
                    ),
                  ),
                ),
              )
            : Container(
                width: 98,
                decoration: BoxDecoration(
                  color: TColors.primary.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          cartController.removeOneProductFromCart(product),
                      child: Container(
                        color: Colors.transparent,
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          child: Text(
                            '-',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        cartController
                            .getProductQuantityInCart(product.id)
                            .toString(),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => cartController.addOneProductToCart(product),
                      child: Container(
                        color: Colors.transparent,
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          child: Text(
                            '+',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      );
    });
  }
}
