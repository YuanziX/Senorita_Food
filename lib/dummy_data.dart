import 'package:food/features/shop/models/banner_model.dart';
import 'package:food/features/shop/models/brand_model.dart';
import 'package:food/features/shop/models/product_attribute_model.dart';
import 'package:food/features/shop/models/product_model.dart';
import 'package:food/features/shop/models/product_variation_model.dart';
import 'package:food/routes/routes.dart';
import 'package:food/utils/constants/image_strings.dart';

class TDummyData {
  // Banners

  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(
        imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: true),
    BannerModel(
        imageUrl: TImages.banner3,
        targetScreen: TRoutes.favourites,
        active: true),
    BannerModel(
        imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: true),
    BannerModel(
        imageUrl: TImages.banner5,
        targetScreen: TRoutes.settings,
        active: true),
    BannerModel(
        imageUrl: TImages.banner6,
        targetScreen: TRoutes.userAddress,
        active: true),
    BannerModel(
        imageUrl: TImages.banner8,
        targetScreen: TRoutes.checkout,
        active: false),
  ];

  static final List<ProductModel> products = [
    ProductModel(id: '001',
     title: 'Green Nike sports shoe', 
     stock: 24, 
     price: 160, 
     isFeatured: true,
     thumbnail: TImages.productImage3,
     description: 'Green shoes',
     brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike',productsCount: 260,isFeatured: true),
     images: [TImages.productImage1,TImages.productImage23],
     salePrice: 180,
     sku: 'ARBR4568',
     categoryId: '1',
     productAttributes: [ProductAttributeModel(name: 'Color',values: ['Green','Black']),
     ProductAttributeModel(name: 'Size',values: ['EU 30','EU 32'])],
     productVariations: [
      ProductVariationModel(id: '1',
      stock: 34,
      price: 134,
      salePrice: 120,
      image: TImages.productImage22,
      description: 'Best one',
       attributeValues: {'Color':'Green','Size':'EU 34'}),
       ProductVariationModel(id: '2',
      stock: 34,
      price: 134,
      salePrice: 120,
      image: TImages.productImage23,
      description: 'Best one',
       attributeValues: {'Color':'Black','Size':'EU 32'}),
     ],
     productType: 'ProductType.variable'),


     ProductModel(id: '002',
     title: 'Green Nike sports shoe', 
     stock: 24, 
     price: 160, 
     isFeatured: true,
     thumbnail: TImages.productImage0,
     description: 'Green Shoes',
     brand: BrandModel(id: '2', image: TImages.nikeLogo, name: 'Nike',productsCount: 260,isFeatured: true),
     images: [TImages.productImage1,TImages.productImage23],
     salePrice: 180,
     sku: 'ARBR4569',
     categoryId: '2',
     productAttributes: [ProductAttributeModel(name: 'Color',values: ['Green','Black']),
     ProductAttributeModel(name: 'Size',values: ['EU 30','EU 32'])],
     productVariations: [
      ProductVariationModel(id: '1',
      stock: 34,
      price: 134,
      salePrice: 120,
      image: TImages.productImage1,
      description: 'Best one',
       attributeValues: {'Color':'Green','Size':'EU 30'}),
      //  ProductVariationModel(id: '2',
      // stock: 34,
      // price: 134,
      // salePrice: 120,
      // image: TImages.productImage23,
      // description: 'Best one',
      //  attributeValues: {'Color':'Black','Size':'EU 32'}),
     ],
     productType: 'ProductType.variable'),
     
  ];
}