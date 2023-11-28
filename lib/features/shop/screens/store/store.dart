import 'package:flutter/material.dart';
import 'package:food/common/widgets/appbar/appbar.dart';
import 'package:food/common/widgets/appbar/tabbar.dart';
import 'package:food/common/widgets/custom_shapes/container/search_container.dart';
import 'package:food/common/widgets/layouts/gird_layout.dart';
import 'package:food/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:food/common/widgets/brands/brand_card.dart';
import 'package:food/common/widgets/texts/section_heading.dart';
import 'package:food/features/shop/screens/brand/all_brands.dart';
import 'package:food/features/shop/screens/store/widgets/category_tab.dart';
import 'package:food/utils/constants/colors.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:food/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Store',style: Theme.of(context).textTheme.headlineMedium),
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
              backgroundColor: THelperFunctions.isDarkMode(context)? TColors.black:TColors.white,
              expandedHeight: 350,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ///Search
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const TSearchContainer(text: 'Search in Store',showBorder: true,showBackground: false,padding: EdgeInsets.zero),
                    const SizedBox(height: TSizes.spaceBtwSections),
    
                    ///Featured Brands
                    TSectionHeading(title: 'Featured Brands',showActionButton: true,onPressed: () => Get.to(() => const AllBrandsScreen())),
                    const SizedBox(height: TSizes.spaceBtwItems/1.5),
    
                    TGirdLayout(
                      itemCount: 2,
                      mainAxisExtent: 80, 
                      itemBuilder: (_, index){
    
                      return const TBrandCard(showBorder: true);
                    },
                    ),
                  ],
                ),
              ),
              ///tabs
              bottom: const TTabBar(
                tabs:[
                Tab(child: Text('Maggie')),
                Tab(child: Text('Biryani Spot')),
                Tab(child: Text('FastFood')),
                Tab(child: Text('Bakery')),
                Tab(child: Text('Shakes')),
                ],
              ),
              ),
          ];
        }, body: const TabBarView(
          children: [TCategoryTab(),
            TCategoryTab(),
            TCategoryTab(),
            TCategoryTab(),
            TCategoryTab(),
         
          
        ],
        ),
      ),
      ),
    );
  }
}




