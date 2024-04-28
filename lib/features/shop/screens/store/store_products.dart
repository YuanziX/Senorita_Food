import 'package:flutter/material.dart';
import 'package:food/features/shop/controllers/brand_products_controller.dart';
import 'package:food/features/shop/screens/store/widgets/dotted_divider.dart';
import 'package:food/features/shop/screens/store/widgets/product_card.dart';
import 'package:food/features/shop/screens/store/widgets/search_bar.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:get/get.dart';

class StoreProductsScreen extends StatelessWidget {
  const StoreProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BrandProductsController brandProductsController =
        Get.put(BrandProductsController());
    final TextEditingController searchController = TextEditingController();
    brandProductsController.getBrandProducts(Get.arguments.toString());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
        child: ListView(
          children: [
            Center(
              child: Text(
                brandProductsController.brand.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 2 * TSizes.spaceBtwItems),
            MySearchBar(
              searchController: searchController,
              searchHint: 'Search for your favourite items',
              filterFunction: brandProductsController.filterFood,
            ),
            const SizedBox(height: 2 * TSizes.defaultSpace),
            Obx(() {
              if (brandProductsController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Obx(() {
                return Column(
                  children: [
                    for (var item in brandProductsController.productsToShow)
                      Column(
                        children: [
                          ProductCard(product: item),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            child: DottedDivider(),
                          ),
                        ],
                      ),
                  ],
                );
              });
            }),
          ],
        ),
      ),
    );
  }
}
