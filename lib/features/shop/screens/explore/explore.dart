import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food/common/widgets/brands/brand_card.dart';
import 'package:food/common/widgets/layouts/gird_layout.dart';
import 'package:food/common/widgets/texts/section_heading.dart';
import 'package:food/features/shop/models/brand_model.dart';
import 'package:food/features/shop/screens/brand/all_brands.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:food/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  dynamic _selectedIndex = {};

  final CarouselController _carouselController = CarouselController();

  final List<dynamic> _products = [
    {
      'title': 'Adidas Originals \nby Alexander Wang',
      'image':
          'https://images.unsplash.com/photo-1589188056053-28910dc61d38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2264&q=80',
      'description': 'Limited collection'
    },
    {
      'title': 'Adidas Originals \nby Alexander Wang',
      'image':
          'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzV8fGFkaWRhc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
      'description': 'Limited collection'
    },
    {
      'title': 'Adidas Originals \nby Alexander Wang',
      'image':
          'https://images.unsplash.com/photo-1582588678413-dbf45f4823e9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2265&q=80',
      'description': 'Limited collection'
    },
    {
      'title': 'Adidas Originals \nby Alexander Wang',
      'image':
          'https://images.unsplash.com/photo-1589188056053-28910dc61d38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2264&q=80',
      'description': 'Limited collection'
    }
  ];

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      // appBar: TAppBar(
      //   showBackArrow: false,
      //   title: Text('Featured Shops',
      //       style: Theme.of(context).textTheme.headlineMedium),
      // ),
      floatingActionButton: _selectedIndex.length > 0
          ? FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.arrow_forward_ios),
            )
          : null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
            child: TSectionHeading(
              title: 'Featured Shops',
              showActionButton: true,
              onPressed: () => Get.to(() => const AllBrandsScreen()),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TGirdLayout(
              itemCount: 2,
              mainAxisExtent: 60,
              itemBuilder: (_, index) {
                return TBrandCard(showBorder: true, brand: BrandModel.empty());
              },
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                      height: 450.0,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.70,
                      enlargeCenterPage: true,
                      pageSnapping: true,
                      onPageChanged: (index, reason) {
                        setState(() {});
                      }),
                  items: _products.map((movie) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_selectedIndex == movie) {
                                _selectedIndex = {};
                              } else {
                                _selectedIndex = movie;
                              }
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: _selectedIndex == movie
                                    ? Border.all(
                                        color: Colors.blue.shade500, width: 3)
                                    : null,
                                boxShadow: _selectedIndex == movie
                                    ? [
                                        BoxShadow(
                                            color: Colors.blue.shade100,
                                            blurRadius: 30,
                                            offset: const Offset(0, 10))
                                      ]
                                    : [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            blurRadius: 20,
                                            offset: const Offset(0, 5))
                                      ]),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    height: 320,
                                    margin: const EdgeInsets.only(top: 10),
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Image.network(movie['image'],
                                        fit: BoxFit.cover),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    movie['title'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.apply(
                                            color: dark
                                                ? Colors.black
                                                : Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    movie['description'],
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList()),
            ),
          ),
        ],
      ),
    );
  }
}
