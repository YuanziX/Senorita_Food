import 'package:flutter/material.dart';
import 'package:food/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:food/common/widgets/custom_shapes/container/search_container.dart';
//import 'package:food/common/widgets/layouts/gird_layout%20copy.dart';
import 'package:food/common/widgets/products/prodect_cards/product_card_vertical.dart';
import 'package:food/common/widgets/texts/section_heading.dart';
import 'package:food/features/shop/controllers/product/product_controller.dart';
import 'package:food/features/shop/screens/all_products/all_products.dart';
import 'package:food/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:food/features/shop/screens/home/widgets/home_categories.dart';
import 'package:food/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:food/utils/shimmers/vertical_product_shimmer.dart';
//import 'package:food/venu_asked.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/layouts/gird_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //Appbar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  //SearchBar
                  TSearchContainer(text: 'Search in Store'),
                  SizedBox(height: TSizes.spaceBtwSections),

                  PromoSlider(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            //Categories
            const SizedBox(height: TSizes.spaceBtwInputFields),
            const Padding(
              padding: EdgeInsets.only(left: TSizes.defaultSpace),
              child: Column(
                children: [
                  TSectionHeading(
                      title: 'Popular Categories',
                      showActionButton: false,
                      textColor: Colors.purple),
                  SizedBox(height: TSizes.spaceBtwItems),

                  //Categories
                  THomeCategories(),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  //Heading
                  TSectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => AllProducts(
                          title: 'Popular Products',
                          futureMethod: controller.fetchAllFeaturedProducts(),
                        )),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  
                  // Obx(() {
                  //   if (controller.isLoading.value) {
                  //     return const TVerticalProductShimmer();
                  //   }
                  //   if (controller.featuredProducts.isEmpty) {
                  //     return Center(
                  //         child: Text('No Data Found!',
                  //             style: Theme.of(context).textTheme.bodyMedium));
                  //   }
                  // TGirdLayout2(
                  //     itemCount: controller.featuredProducts.length,
                  //     itemBuilder: (_, index) => CardDetail(product: controller.featuredProducts[index],)),
                  
                      
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  Obx(() {
                    if (controller.isLoading.value) {
                      return const TVerticalProductShimmer();
                    }
                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                          child: Text('No Data Found!',
                              style: Theme.of(context).textTheme.bodyMedium));
                    }
                    return TGirdLayout(
                        itemCount: controller.featuredProducts.length,
                        itemBuilder: (_, index) => TProductCardVertical(
                            product: controller.featuredProducts[index]));
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
