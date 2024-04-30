import 'package:flutter/material.dart';
import 'package:food/features/shop/controllers/home_controller.dart';
import 'package:food/features/shop/screens/home/widgets/popular_product_big_card.dart';
import 'package:food/features/shop/screens/home/widgets/popular_product_small_card.dart';
import 'package:food/utils/shimmers/popular_products_shimmer.dart';
import 'package:get/get.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return Obx(() {
      if (homeController.isLoading.value) {
        return const TPopularProductsShimmer();
      }

      // Check if there are fewer than 3 products
      if (homeController.products.length < 3) {
        return Column(
          children: [
            for (var prod in homeController.products)
              Column(
                children: [
                  PopularProductBigCard(productModel: prod),
                  const SizedBox(height: 20),
                ],
              ),
          ],
        );
      }

      return Column(
        children: [
          // Display the first three products differently
          for (var prod in homeController.products.sublist(0, 3))
            Column(
              children: [
                PopularProductBigCard(productModel: prod),
                const SizedBox(height: 20),
              ],
            ),
          // Display the rest of the products in a GridView
          for (int i = 3; i < homeController.products.length; i += 2)
            Column(
              children: [
                if (i + 1 < homeController.products.length)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PopularProductSmallCard(
                          productModel: homeController.products[i]),
                      PopularProductSmallCard(
                          productModel: homeController.products[i + 1]),
                    ],
                  )
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PopularProductSmallCard(
                          productModel: homeController.products[i]),
                    ],
                  ),
                const SizedBox(height: 20)
              ],
            ),
        ],
      );
    });
  }
}
