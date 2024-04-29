import 'package:flutter/material.dart';
import 'package:food/features/shop/models/product_model.dart';

class PopularProductCard extends StatelessWidget {
  final ProductModel productModel;
  const PopularProductCard({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(productModel.thumbnail),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            productModel.title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 5),
          Text(
            productModel.price.toString(),
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: Colors.red,
                ),
          ),
        ],
      ),
    );
  }
}
