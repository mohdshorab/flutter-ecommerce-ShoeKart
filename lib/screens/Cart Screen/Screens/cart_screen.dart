import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/cart_controller.dart';
import 'package:get/get.dart';
import '../../../controllers/authenticationService_controller.dart';
import '../../../widgets/custom_text_widget.dart';
import '../Widgets/cartTotal.dart';
import '../Widgets/cart_product_widget.dart';

class CartScreen extends StatelessWidget {
  User? user = FirebaseAuth.instance.currentUser;
  final controller = Get.put(AuthenticationServiceController());
  final cartController = Get.put(CartController());
  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        // isEmpty is a var which is responsible to check that cart products is empty or not
        body: (cartController.products.isEmpty)
            ? Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.dstATop),
                  image: const NetworkImage(
                      'https://images.unsplash.com/photo-1597045566677-8cf032ed6634?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
                  fit: BoxFit.cover,
                )),
                child: const Center(
                  child: CustomText(
                      text: 'No items added yet.',
                      size: 24,
                      color: Colors.black,
                      weight: FontWeight.bold),
                ),
              )
            : ListView(
                children: [
                  SizedBox(height: 700, child: CartProducts()),
                  CartTotal(),
                ],
              ),
      );
    });
  }
}
