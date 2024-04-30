import 'package:flutter/material.dart';
import 'package:food/utils/helpers/helper_functions.dart';
import 'package:food/utils/shimmers/shimmer.dart';

class TPopularProductsShimmer extends StatelessWidget {
  const TPopularProductsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < 3; i++)
          const Column(
            children: [
              TShimmerEffect(
                height: 120,
                width: double.infinity,
                radius: 10,
              ),
              SizedBox(height: 20),
            ],
          ),
        for (int i = 0; i < 3; i++)
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TShimmerEffect(
                      width: THelperFunctions.screenWidth() * 0.4, height: 170),
                  TShimmerEffect(
                      width: THelperFunctions.screenWidth() * 0.4, height: 170)
                ],
              ),
              const SizedBox(height: 20),
            ],
          )
      ],
    );
  }
}
