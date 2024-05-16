import 'package:flutter/material.dart';
import 'package:food/features/shop/controllers/category_controller.dart';
import 'package:food/features/shop/models/category_model.dart';
import 'package:food/features/shop/screens/home/widgets/category_products.dart';
import 'package:get/get.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryCard({Key? key, required this.categoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              CategoryController.instance.setCategory(categoryModel);
              Get.to(() => const CategoryProductsScreen());
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.network(
                  categoryModel.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            categoryModel.name,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
