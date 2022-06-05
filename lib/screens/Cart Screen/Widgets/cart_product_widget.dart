import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/cart_controller.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:flutter_application_1/screens/HomePage/widgets/product_details.dart';

import 'package:get/get.dart';

class CartProducts extends StatelessWidget {
  final cartController = Get.put(CartController());
  CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // to update whenever there is a change in a product dic
    return Obx(() => SizedBox(
          height: 500,
          child: ListView.builder(
              itemCount: cartController.products.length,
              itemBuilder: (context, index) {
                return CartProductCard(
                  controller: cartController,
                  // take the list of product from the controller, then look at keys and take the one
                  product: cartController.products.keys.toList()[index],
                  //  this time taking values , so key will be the product and values will be quantity
                  quantity: cartController.products.values.toList()[index],
                  index: index,
                );
              }),
        ));
  }
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final ProductModel product;
  final int quantity;
  final int index;

  const CartProductCard(
      {Key? key,
      required this.controller,
      required this.product,
      required this.quantity,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: GestureDetector(
        onTap: () {
          Get.to(ProductDetails(product: product),
              transition: Transition.rightToLeft);
        },
        child: Card(
          elevation: 20,
          shadowColor: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(product.image),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(product.name),
              ),
              TextButton(
                  onPressed: () {
                    controller.removeProduct(product);
                  },
                  child: const Icon(Icons.remove)),
              Text('$quantity'),
              TextButton(
                  onPressed: () {
                    controller.addProduct(product);
                  },
                  child: const Icon(Icons.add))
            ],
          ),
        ),
      ),
    );
  }
}
