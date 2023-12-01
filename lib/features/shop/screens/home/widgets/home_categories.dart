import 'package:flutter/material.dart';
import 'package:food/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:food/features/shop/screens/sub_category/sub_categories.dart';
import 'package:food/utils/constants/image_strings.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 15,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImageText(
              image: TImages.RiceIcon,
              title: ' Fried Rice',
              onTap: () => Get.to(() => const SubCategoriesScreen()));
        },
      ),
    );
  }
}
