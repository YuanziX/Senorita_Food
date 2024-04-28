import 'dart:convert';

import 'package:food/features/shop/models/brand_model.dart';
import 'package:food/utils/constants/api_constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  // Variables
  final _endpoint = '$dbLink/brand';

  // Get all Categories
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final request = await http.get(Uri.parse(_endpoint));
      Map data = jsonDecode(request.body);
      List<BrandModel> brands = [];

      for (var item in data['data']) {
        brands.add(BrandModel.fromJson(item));
      }
      return brands;
    } catch (e) {
      print(e);
      throw 'Something went wrong. Please try again';
    }
  }

  // Get brands for Category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    return [];
  }
}
