import 'package:flutter/material.dart';
import 'package:food/common/widgets/layouts/gird_layout.dart';
import 'package:food/common/widgets/products/prodect_cards/product_card_vertical.dart';
import 'package:food/common/widgets/texts/section_heading.dart';
import 'package:food/features/shop/controllers/category_controller.dart';
import 'package:food/features/shop/models/category_model.dart';
import 'package:food/features/shop/screens/all_products/all_products.dart';
import 'package:food/features/shop/screens/store/widgets/category_brands.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:food/utils/helpers/cloud_helper_function.dart';
import 'package:food/utils/shimmers/vertical_product_shimmer.dart';
import 'package:get/get.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Brands
              CategoryBrands(category: category),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Products
              FutureBuilder(
                  future:
                      controller.getCategoryProducts(categoryId: category.id),
                  builder: (context, snapshot) {
                    // Helper function: Handle Loader, No Loader, Or Error Message
                    final response =
                        TCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot,
                            loader: const TVerticalProductShimmer());
                    if (response != null) return response;

                    // Record found
                    final products = snapshot.data!;
                    return Column(
                      children: [
                        TSectionHeading(
                          title: 'You might like',
                          onPressed: () => Get.to(AllProducts(
                            title: category.name,
                            futureMethod: controller.getCategoryProducts(
                                categoryId: category.id, limit: -1),
                          )),
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        TGirdLayout(
                            itemCount: products.length,
                            itemBuilder: (_, index) =>
                                TProductCardVertical(product: products[index])),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
