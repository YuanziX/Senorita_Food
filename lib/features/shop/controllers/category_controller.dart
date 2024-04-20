import 'package:food/common/widgets/loaders/loaders.dart';
import 'package:food/data/products/product_repository.dart';
import 'package:food/data/repositories/categories/category_repo.dart';
import 'package:food/features/shop/models/category_model.dart';
import 'package:food/features/shop/models/product_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryrepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  // Load Category data
  Future<void> fetchCategories() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      //Fetch categories from data Source (FireStore, API, etc.)
      final categories = await _categoryrepository.getAllCategories();

      //Update categories List
      allCategories.assignAll(categories);

      //Filter featured categories
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }

  // Load selected Category data
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final subCategories =
          await _categoryrepository.getSubCategories(categoryId);
      return subCategories;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // Get Category or sub Category Products
  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryId, int limit = 4}) async {
    // Fetch limited 4 products against each subCategory;
    final products = await ProductRepository.instance
        .getProductsForCategory(categoryId: categoryId, limit: limit);
    return products;
  }
}
