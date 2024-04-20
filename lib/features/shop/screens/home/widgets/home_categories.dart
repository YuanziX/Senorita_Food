import 'package:flutter/material.dart';
import 'package:food/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:food/features/shop/controllers/category_controller.dart';
import 'package:food/features/shop/screens/sub_category/sub_categories.dart';
import 'package:food/utils/shimmers/category_shimmer.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(() {
      if (categoryController.isLoading.value) return const TCategoryShimmer();

      if (categoryController.featuredCategories.isEmpty) {
        return Center(
            child: Text('No Data Found',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: Colors.white)));
      } else {}
      return SizedBox(
        height: 130,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return TVerticalImageText(
                image: category.image,
                title: category.name,
                onTap: () =>
                    Get.to(() => SubCategoriesScreen(category: category)));
          },
        ),
      );
    });
  }
}
