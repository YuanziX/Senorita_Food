import 'package:food/common/widgets/loaders/loaders.dart';
import 'package:food/data/repositories/brands/brand_repository.dart';
import 'package:food/features/shop/controllers/brand_controller.dart';
import 'package:food/features/shop/models/brand_model.dart';
import 'package:food/features/shop/models/product_model.dart';
import 'package:get/get.dart';

class BrandProductsController extends GetxController {
  static BrandProductsController get instance => Get.find();

  RxBool isLoading = true.obs;
  late BrandModel brand;
  final RxList<ProductModel> productsToShow = <ProductModel>[].obs;
  final RxList<ProductModel> allProducts = <ProductModel>[].obs;
  final BrandRepository brandRepository = BrandRepository.instance;

  @override
  void onInit() {
    setBrand();
    super.onInit();
  }

  Future<void> getBrandProducts(String brandId) async {
    try {
      isLoading.value = true;
      final products = await brandRepository.getBrandProducts(brandId);
      allProducts.assignAll(products);
      productsToShow.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //Stop Loading
      isLoading.value = false;
    }
  }

  void filterFood(String query) {
    if (query.isNotEmpty) {
      final List<ProductModel> searchList = [];
      for (var product in allProducts) {
        if (product.title.toLowerCase().contains(query.toLowerCase())) {
          searchList.add(product);
        }
      }
      productsToShow.assignAll(searchList);
      return;
    }
    productsToShow.assignAll(allProducts);
  }

  void setBrand() {
    brand = BrandController.instance.currentBrand;
  }
}
