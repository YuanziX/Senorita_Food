import 'package:flutter/material.dart';
import 'package:food/features/shop/controllers/brand_controller.dart';
import 'package:food/features/shop/screens/store/widgets/search_bar.dart';
import 'package:food/features/shop/screens/store/widgets/store_card.dart';
import 'package:food/utils/constants/sizes.dart';
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
            MySearchBar(
              searchController: searchController,
              searchHint: 'Search for your favourite store',
              filterFunction: brandController.filterBrands,
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
