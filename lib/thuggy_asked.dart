import 'package:flutter/material.dart';
import 'package:food/features/shop/models/product_model.dart';
import 'package:food/features/shop/screens/product_details/product_detail.dart';
import 'package:food/utils/constants/image_strings.dart';
import 'package:get/get.dart';

class ProductCardButton extends StatelessWidget {
  const ProductCardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => Get.to(ProductDetail(product: ProductModel.empty()))),
      child: Container(
        width: double.infinity, // Full width
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), // Curved edges
          color: Colors.grey[200], // Background color
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          child: Image.asset(
                            TImages.promoBanner2,
                            width: 200, // Set a specific width here
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15, 10, 0, 0),
                            child: Container(
                              width: 45,
                              height: 24,
                              decoration: BoxDecoration(
                                color: const Color(0x93FFFFFF),
                                borderRadius: BorderRadius.circular(27),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star_rounded,
                                    color: Color(0xFFEDA44C),
                                    size: 16,
                                  ),
                                  Text(
                                    '4.5',
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                175, 10, 0, 0),
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: const Color(0x93FFFFFF),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.favorite_rounded,
                                    color: Theme.of(context).primaryColor,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pear House',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$1150',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFEDA44C),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 3, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                    child: Icon(
                      Icons.location_pin,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 15,
                    ),
                  ),
                  const Text(
                    'Cartagena, Colombia',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 90,
                          height: 25,
                          decoration: BoxDecoration(
                            color: const Color(0x00FFFFFF),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: const Color(0x52C0D9F4),
                              width: 1,
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(3, 0, 3, 0),
                                child: Icon(
                                  Icons.home_work_sharp,
                                  color: Colors.black,
                                  size: 12,
                                ),
                              ),
                              Text(
                                '3 habitaciones',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            color: const Color(0x00FFFFFF),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: const Color(0x52C0D9F4),
                              width: 1,
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(3, 0, 3, 0),
                                child: Icon(
                                  Icons.wifi,
                                  color: Colors.black,
                                  size: 12,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                child: Text(
                                  'Wifi',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 60,
                          height: 25,
                          decoration: BoxDecoration(
                            color: const Color(0x00FFFFFF),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: const Color(0x52C0D9F4),
                              width: 1,
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(3, 0, 3, 0),
                                child: Icon(
                                  Icons.directions_car,
                                  color: Colors.black,
                                  size: 12,
                                ),
                              ),
                              Text(
                                'Garage',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
