import 'package:flutter/material.dart';
import 'package:food/features/shop/controllers/home_controller.dart';
import 'package:food/features/shop/screens/home/widgets/popular_product_big_card.dart';
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

      return Column(
        children: [
          // Display the first three products differently
          for (var prod in homeController.products.sublist(0, 5))
            Column(
              children: [
                PopularProductBigCard(productModel: prod),
                const SizedBox(height: 20),
              ],
            ),
        ],
      );
    });
  }
}
