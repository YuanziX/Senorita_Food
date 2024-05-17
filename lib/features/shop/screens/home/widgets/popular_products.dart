import 'package:flutter/material.dart';
import 'package:food/common/widgets/layouts/gird_layout.dart';
import 'package:food/common/widgets/products/prodect_cards/product_card_vertical.dart';
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
          for (var prod in homeController.products.sublist(0, 4))
            Column(
              children: [
                PopularProductBigCard(productModel: prod),
                const SizedBox(height: 20),
              ],
            ),
          const SizedBox(height: 20),

          // Display the rest of the products
          TGirdLayout(
            mainAxisExtent: 260,
            itemCount: homeController.products.length - 5,
            itemBuilder: (_, index) => TProductCardVertical(
              product: homeController.products[index + 5],
            ),
          ),
        ],
      );
    });
  }
}
