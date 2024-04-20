import 'package:flutter/material.dart';
import 'package:food/common/widgets/brands/brand_showcase.dart';
import 'package:food/features/shop/controllers/brand_controller.dart';
import 'package:food/features/shop/models/category_model.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:food/utils/helpers/cloud_helper_function.dart';
import 'package:food/utils/shimmers/boxes_shimmer.dart';
import 'package:food/utils/shimmers/list_tile_shimmer.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandsforCategory(category.id),
        builder: (context, snapshot) {
          // Handle Loader, No Record , Or No Error Message
          const loader = Column(
            children: [
              TListTileShimmer(),
              SizedBox(height: TSizes.spaceBtwItems),
              TBoxesShimmer(),
              SizedBox(height: TSizes.spaceBtwSections),
            ],
          );
          final widget = TCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, loader: loader);
          if (widget != null) return widget;

          // Record found
          final brands = snapshot.data!;
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: brands.length,
              itemBuilder: (_, index) {
                final brand = brands[index];
                return FutureBuilder(
                    future: controller.getBrandsProducts(
                        brandId: brand.id, limit: 3),
                    builder: (context, snapshot) {
                      // Handle Loader, No Record, Or Error Message
                      final widget =
                          TCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot, loader: loader);
                      if (widget != null) return widget;

                      // Record Found !
                      final products = snapshot.data!;
                      return TBrandShowCase(
                          brand: brand,
                          images: products.map((e) => e.thumbnail).toList());
                    });
              },
              );
          
        }
        );
  }
}
