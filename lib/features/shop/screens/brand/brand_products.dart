import 'package:flutter/material.dart';
import 'package:food/common/widgets/appbar/appbar.dart';
import 'package:food/common/widgets/brands/brand_card.dart';
import 'package:food/common/widgets/products/sortable/sortable_products.dart';
import 'package:food/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(title: Text('Nike')),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children:[
          ///BRandDetail
          TBrandCard(showBorder: true),
          SizedBox(height: TSizes.spaceBtwSections),

          TSortableProducts()
          ],
        ),
        ),
        
      ),
    );
  }
}