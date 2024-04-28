import 'package:flutter/material.dart';
import 'package:food/features/shop/models/brand_model.dart';
import 'package:food/utils/helpers/helper_functions.dart';

class StoreCard extends StatelessWidget {
  final BrandModel store;
  final double _borderRadius = 16;
  final String _fallbackimg =
      'https://st2.depositphotos.com/1419868/12430/i/950/depositphotos_124302476-stock-photo-unoccupied-generic-store-front.jpg';
  const StoreCard({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: THelperFunctions.screenWidth() * 0.85,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(143, 148, 251, .2),
              blurRadius: 22,
              offset: Offset(0, 0),
            )
          ]),
      child: Column(
        children: [
          SizedBox(
            height: 175,
            width: THelperFunctions.screenWidth() * 0.85,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_borderRadius),
                topRight: Radius.circular(_borderRadius),
              ),
              child: Image.network(
                store.image == '' ? _fallbackimg : store.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 65,
            width: THelperFunctions.screenWidth() * 0.85,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        store.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: store.isOpen ?? false
                              ? const Color.fromARGB(255, 114, 209, 117)
                              : const Color.fromARGB(255, 238, 112, 103),
                          borderRadius: BorderRadius.circular(200),
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
                  const Text(
                    'PROD 1 • PROD 2 • PROD 3',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
