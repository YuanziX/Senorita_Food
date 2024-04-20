import 'package:flutter/material.dart';
import 'package:food/common/widgets/appbar/appbar.dart';
import 'package:food/common/widgets/brands/brand_card.dart';
import 'package:food/common/widgets/products/sortable/sortable_products.dart';
import 'package:food/features/shop/controllers/brand_controller.dart';
import 'package:food/features/shop/models/brand_model.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:food/utils/helpers/cloud_helper_function.dart';
import 'package:food/utils/shimmers/vertical_product_shimmer.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(title: Text(brand.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///BRandDetail
              TBrandCard(showBorder: true, brand: brand),
              const SizedBox(height: TSizes.spaceBtwSections),

              FutureBuilder(
                  future: controller.getBrandsProducts(brandId: brand.id),
                  builder: (context, snapshot) {
                    const loader = TVerticalProductShimmer();
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    // Record Found!
                    final brandProducts = snapshot.data!;
                    return TSortableProducts(products: brandProducts);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
