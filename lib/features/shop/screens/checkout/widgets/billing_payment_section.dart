import 'package:flutter/material.dart';
import 'package:food/common/styles/TRoundedContainer.dart';
import 'package:food/common/widgets/texts/section_heading.dart';
import 'package:food/features/shop/controllers/product/checkout_controller.dart';
import 'package:food/features/shop/models/payment_method_model.dart';
import 'package:food/utils/constants/colors.dart';
import 'package:food/utils/constants/image_strings.dart';
import 'package:food/utils/constants/sizes.dart';
import 'package:food/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(
            title: 'Payment Method',
            buttonTitle: 'Change',
            onPressed: () => controller
                .selectedPaymentMethod(context as PaymentMethodModel?)),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Obx(
          () => Row(
            children: [
              TRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: dark ? TColors.light : TColors.white,
                padding: const EdgeInsets.all(TSizes.sm),
                child: const Image(
                    image: AssetImage(TImages.paytm), fit: BoxFit.contain),
              ),
              const SizedBox(width: TSizes.spaceBtwItems / 2),
              Text(controller.selectedPaymentMethod.value.name,
                  style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        )
      ],
    );
  }
}
