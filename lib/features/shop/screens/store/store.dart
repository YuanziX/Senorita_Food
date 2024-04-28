import 'package:flutter/material.dart';
import 'package:food/common/widgets/appbar/appbar.dart';
import 'package:food/common/widgets/appbar/tabbar.dart';
import 'package:food/common/widgets/custom_shapes/container/search_container.dart';
import 'package:food/common/widgets/layouts/gird_layout.dart';
import 'package:food/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:food/common/widgets/texts/section_heading.dart';
import 'package:food/features/shop/controllers/brand_controller.dart';
import 'package:food/features/shop/controllers/category_controller.dart';
import 'package:food/features/shop/screens/store/widgets/store_card.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:food/utils/helpers/helper_functions.dart';
import 'package:food/utils/shimmers/store_shimmer.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
        child: ListView(
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search for stores',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      icon: const Icon(Icons.search, color: Colors.grey),
                    ),
                    onChanged: (value) {
                      brandController.filterBrands(value);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2 * TSizes.spaceBtwItems),
            Obx(() {
              if (brandController.isLoading.value) {
                return const TStoreShimmer();
              }
              if (brandController.brandsToShow.isEmpty &&
                  !brandController.isLoading.value) {
                brandController.getAllBrands();
              }
              return Column(
                children: [
                  for (var item in brandController.brandsToShow)
                    Column(
                      children: [
                        StoreCard(store: item),
                        const SizedBox(height: 1.25 * TSizes.spaceBtwItems),
                      ],
                    )
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
