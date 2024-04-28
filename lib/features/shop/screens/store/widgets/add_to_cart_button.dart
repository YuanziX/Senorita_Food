import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food/features/shop/controllers/product/cart_controller.dart';
import 'package:food/features/shop/models/product_model.dart';
import 'package:food/utils/constants/colors.dart';
import 'package:get/get.dart';

class AddToCartButton extends StatelessWidget {
  final ProductModel product;
  const AddToCartButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    CartController cartController = CartController.instance;
    return Obx(() {
      return Container(
        child: cartController.getProductQuantityInCart(product.id) == 0
            ? InkWell(
                onTap: () => cartController.addOneProductToCart(product),
                child: Container(
                  decoration: BoxDecoration(
                    color: TColors.accent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 34),
                    child: Text(
                      'ADD',
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ),
              )
            : Row(
                children: [
                  GestureDetector(
                    onTap: () =>
                        cartController.removeOneProductFromCart(product),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: TColors.accent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Text(
                          '-',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: TColors.accent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      child: Text(
                        cartController
                            .getProductQuantityInCart(product.id)
                            .toString(),
                        style: const TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => cartController.addOneProductToCart(product),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: TColors.accent,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Text(
                          '+',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      );
    });
  }
}
