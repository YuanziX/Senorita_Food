import 'package:flutter/material.dart';
import 'package:food/common/widgets/appbar/appbar.dart';
import 'package:food/common/widgets/brands/brand_card.dart';
import 'package:food/common/widgets/layouts/gird_layout.dart';
import 'package:food/common/widgets/texts/section_heading.dart';
import 'package:food/features/shop/controllers/brand_controller.dart';
import 'package:food/features/shop/screens/brand/brand_products.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:food/utils/shimmers/brands_shimmer.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const TAppBar(title: Text('SHOP'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///HEading
              const TSectionHeading(title: 'SHOPS', showActionButton: true),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Brands Grid
              Obx(
                () {
                  if (brandController.isLoading.value) {
                    return const TBrandsShimmer();
                  }
                  if (brandController.allBrands.isEmpty) {
                    return Center(
                        child: Text('No Data Found!',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(color: Colors.white)));
                  }
                  return TGirdLayout(
                    itemCount: brandController.allBrands.length,
                    mainAxisExtent: 80,
                    itemBuilder: (_, index) {
                      final brand = brandController.allBrands[index];
                      return TBrandCard(
                          showBorder: true,
                          brand: brand,
                          onTap: () =>
                              Get.to(() => BrandProducts(brand: brand)));
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
