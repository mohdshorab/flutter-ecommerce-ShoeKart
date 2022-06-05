import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/cart_controller.dart';
import 'package:flutter_application_1/screens/Cart%20Screen/Screens/cart_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CartIcon extends StatelessWidget {
  final cartController = Get.put(CartController());
  CartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Badge(
        badgeContent:
            Obx(() => Text(cartController.products.length.toString())),
        badgeColor: Colors.white,
        child:
         
        
        IconButton(
            onPressed: () {
              Get.to(CartScreen());
            },
            icon: const Icon(FontAwesomeIcons.cartShopping)),
      ),
    );
  }
}
