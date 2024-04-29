import 'package:flutter/material.dart';
import 'package:food/utils/helpers/helper_functions.dart';

class TitleDivider extends StatelessWidget {
  final String title;

  const TitleDivider({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: THelperFunctions.screenWidth() * 0.8,
        child: Row(
          children: [
            const Expanded(child: Divider()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Expanded(child: Divider()),
          ],
        ));
  }
}
