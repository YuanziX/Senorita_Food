import 'dart:convert';

import 'package:food/features/shop/models/brand_model.dart';
import 'package:food/features/shop/models/product_model.dart';
import 'package:food/utils/constants/api_constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  // Variables
  final _brandEndpoint = '$dbLink/brand';
  final _productEndpoint = '$dbLink/products';
  final dio = Dio();

  Future<List<BrandModel>> getAllBrands() async {
    try {
      final request = await http.get(Uri.parse(_brandEndpoint));
      Map data = jsonDecode(request.body);
      List<BrandModel> brands = [];

      for (var item in data['data']) {
        brands.add(BrandModel.fromJson(item));
      }
      return brands;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Get products for Brand
  Future<List<ProductModel>> getBrandProducts(String brandId) async {
    try {
      final request = await dio.post(
        '$_productEndpoint/bybrand',
        data: {
          'brandid': brandId,
        },
      );
      List<ProductModel> products = [];
      for (var item in request.data['data']) {
        products.add(ProductModel.fromJson(item));
      }
      return products;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Get brands for Category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    return [];
  }
}
