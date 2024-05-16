import 'package:flutter/material.dart';
import 'package:food/features/shop/controllers/brand_controller.dart';
import 'package:food/features/shop/models/brand_model.dart';
import 'package:food/features/shop/screens/store/widgets/shimmer_image.dart';
import 'package:food/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class StoreCard extends StatelessWidget {
  final BrandModel store;
  final double _borderRadius = 16;
  final String _fallbackimg =
      'https://st2.depositphotos.com/1419868/12430/i/950/depositphotos_124302476-stock-photo-unoccupied-generic-store-front.jpg';
  const StoreCard({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BrandController.instance.setCurrentBrand(store);
        Get.toNamed('/store/products', arguments: store.id);
      },
      child: Container(
        height: 240,
        width: THelperFunctions.screenWidth() * 0.85,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: THelperFunctions.isDarkMode(context)
                ? Colors.black54
                : Colors.white,
            boxShadow: THelperFunctions.isDarkMode(context)
                ? null
                : const [
                    BoxShadow(
                      color: Color.fromRGBO(143, 148, 251, .2),
                      blurRadius: 22,
                      offset: Offset(0, 0),
                    )
                  ]),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_borderRadius),
                topRight: Radius.circular(_borderRadius),
              ),
              child: ColorFiltered(
                colorFilter: store.isOpen ?? false
                    ? const ColorFilter.mode(
                        Colors.transparent, BlendMode.multiply)
                    : const ColorFilter.mode(Colors.grey, BlendMode.saturation),
                child: ShimmerImage(
                  height: 175,
                  width: THelperFunctions.screenWidth() * 0.85,
                  imageUrl: store.image == '' ? _fallbackimg : store.image,
                ),
              ),
            ),
            SizedBox(
              height: 65,
              width: THelperFunctions.screenWidth() * 0.85,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          store.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'PROD 1 • PROD 2 • PROD 3',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: store.isOpen ?? false
                            ? const Color.fromARGB(255, 114, 209, 117)
                            : const Color.fromARGB(255, 238, 112, 103),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        store.isOpen ?? false ? 'OPEN' : 'CLOSED',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
