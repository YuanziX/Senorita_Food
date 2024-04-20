import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food/features/shop/models/category_model.dart';
import 'package:food/firebase_storage_service.dart';
import 'package:food/utils/exceptions/firebase_exception.dart';
import 'package:food/utils/exceptions/paltform_exception.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  // Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapShot = await _db.collection('Categories').get();
      final list = snapShot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Get sub categories
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final snapshot = await _db
          .collection("Categories")
          .where('ParentId', isEqualTo: categoryId)
          .get();
      final result =
          snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Upload Categories to the Cloud Firestore
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      final storage = Get.put(TFirebaseStorageService());

      //Loop through each category
      for (var category in categories) {
        //Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);

        //Upload image and get its url
        final url =
            await storage.uploadImageData('Categories', file, category.name);

        //Assign URL to Category.image attribute
        category.image = url;

        //Storage Category in Firestore
        await _db
            .collection("Categories")
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
