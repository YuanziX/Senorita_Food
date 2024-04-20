import 'package:flutter/material.dart';
import 'package:food/common/widgets/appbar/appbar.dart';
import 'package:food/common/widgets/appbar/tabbar.dart';
import 'package:food/common/widgets/custom_shapes/container/search_container.dart';
import 'package:food/common/widgets/layouts/gird_layout.dart';
import 'package:food/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:food/common/widgets/brands/brand_card.dart';
import 'package:food/common/widgets/texts/section_heading.dart';
import 'package:food/features/shop/controllers/brand_controller.dart';
import 'package:food/features/shop/controllers/category_controller.dart';
import 'package:food/features/shop/screens/brand/all_brands.dart';
import 'package:food/features/shop/screens/brand/brand_products.dart';
import 'package:food/features/shop/screens/store/widgets/category_tab.dart';
import 'package:food/utils/constants/colors.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:food/utils/helpers/helper_functions.dart';
import 'package:food/utils/shimmers/brands_shimmer.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            TCartCounterIcon(onPressed: () {}),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 350,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ///Search
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(
                          text: 'Search in Store',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      ///Featured Brands
                      TSectionHeading(
                          title: 'Featured Shops',
                          showActionButton: true,
                          onPressed: () =>
                              Get.to(() => const AllBrandsScreen())),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      // Brands Grid
                      Obx(() {
                        if (brandController.isLoading.value) {
                          return const TBrandsShimmer();
                        }
                        if (brandController.featuredBrands.isEmpty) {
                          return Center(
                              child: Text('No Data Found!',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(color: Colors.white)));
                        }
                        return TGirdLayout(
                          itemCount: brandController.featuredBrands.length,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            final brand = brandController.featuredBrands[index];
                            return TBrandCard(
                                showBorder: true,
                                brand: brand,
                                onTap: () =>
                                    Get.to(() => BrandProducts(brand: brand)));
                          },
                        );
                      }),
                    ],
                  ),
                ),

                ///tabs
                bottom: TTabBar(
                    tabs: categories
                        .map((category) => Tab(child: Text(category.name)))
                        .toList()),
                //[Tab(child: Text('Maggie')),
                //   Tab(child: Text('Biryani Spot')),
                //   Tab(child: Text('FastFood')),
                //   Tab(child: Text('Bakery')),
                //   Tab(child: Text('Shakes')),
                // ],
              ),
            ];
          },
          body: TabBarView(
              children: categories
                  .map((category) => TCategoryTab(category: category))
                  .toList()),
          //   [TCategoryTab(),
          //   TCategoryTab(),
          //   TCategoryTab(),
          //   TCategoryTab(),
          //   TCategoryTab(),
          // ],
        ),
      ),
    );
  }
}
