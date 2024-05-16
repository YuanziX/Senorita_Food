import 'package:flutter/material.dart';
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
      ],
    );
  }
}
