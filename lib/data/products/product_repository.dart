import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:food/features/shop/models/product_model.dart';
import 'package:food/utils/constants/api_constants.dart';
import 'package:food/utils/exceptions/firebase_exception.dart';
import 'package:food/utils/exceptions/paltform_exception.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();
  final _allProductsEndPoint = '$dbLink/products';
  final _popularProductsEndPoint = '$dbLink/products/popuplarproduct';

  // FireStore instance for database interaction
  final _db = FirebaseFirestore.instance;

  // Get all products
  Future<List<ProductModel>> getAllProducts() async {
    try {
      Dio dio = Dio();
      final response = await dio.get(_allProductsEndPoint);
      final List<ProductModel> products = [];
      for (var product in response.data['data']) {
        products.add(ProductModel.fromJson(product));
      }
      return products;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Get all products
  Future<List<ProductModel>> getPopularProducts() async {
    try {
      Dio dio = Dio();
      final response = await dio.get(_popularProductsEndPoint);
      final List<ProductModel> products = [];
      for (var product in response.data['data']) {
        products.add(ProductModel.fromJson(product));
      }
      return products;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querysnapshot = await query.get();
      final List<ProductModel> productList = querysnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> getFavouriteProducts(
      List<String> productIds) async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
      return snapshot.docs
          .map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
