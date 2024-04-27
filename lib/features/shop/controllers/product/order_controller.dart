import 'package:flutter/material.dart';
import 'package:food/common/widgets/loaders/loaders.dart';
import 'package:food/common/widgets/success_screen/success_screen.dart';
import 'package:food/data/repositories/authentication_repo.dart';
import 'package:food/data/repositories/order/order_repo.dart';
import 'package:food/features/personalisation/controllers/address_controller.dart';
import 'package:food/features/shop/controllers/product/cart_controller.dart';
import 'package:food/features/shop/controllers/product/checkout_controller.dart';
import 'package:food/features/shop/models/order_model.dart';
import 'package:food/navigation_menu.dart';
import 'package:food/utils/constants/enums.dart';
import 'package:food/utils/constants/image_strings.dart';
import 'package:food/utils/popups/fullScreenLoader.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find(); 

  /// Varaibles
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  // Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // Add methods for order processing
  void processOrder(double totalAmount) async {
    try {
      // Start Loader
      TFullScreenLoader.openLoadingDialog(
          'Processing your order', TImages.daceranimation);
      // Get user authentication Id
      final userId = AuthenticationRepository.instance.authUser?.uid;
      if (userId!.isEmpty) return;
      // Add details
      final order = OrderModel(
        //generating unique id
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        // Set date as needed
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );
      // Save the orders to Firestore
      await orderRepository.saveOrder(order, userId);
      //Update the cart status
      cartController.clearCart();
      //Show sucess screen
      Get.off(() => SuccessScreen(
            image: TImages.successfulPaymentIcon,
            title: 'Payment Sucess',
            subtitle: 'Your item will be ready!',
            onPressed: () => Get.offAll(() => const NavigationMenu()),
          ));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
