import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/fav_controller.dart';
import 'package:flutter_application_1/screens/HomePage/widgets/product_details.dart';
import 'package:get/get.dart';

import '../../../models/product_model.dart';

class FavProducts extends StatelessWidget {
  final favController = Get.put(FavController());
  FavProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // to update whenever there is a change in a product list
    return Obx(() => SizedBox(
          height: 500,
          child: ListView.builder(
              itemCount: favController.favProducts.length,
              itemBuilder: (context, index) {
                return CartProductCard(
                  controller: favController,
                  // take the list of product from the controller,
                  product: favController.favProducts[index],
                  index: index,
                );
              }),
        ));
  }
}

class CartProductCard extends StatelessWidget {
  final FavController controller;
  final ProductModel product;
  final int index;

  const CartProductCard(
      {Key? key,
      required this.controller,
      required this.product,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: GestureDetector(
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
              IconButton(
                onPressed: () {
                  if (controller.isSaved(product)) {
                    controller.removeProduct(product);
                  }
                },
                icon: Icon(
                    controller.isSaved(product)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: controller.isSaved(product) ? Colors.red : null),
              ),
            ],
          ),
        ),
        onTap: () {
          Get.to(ProductDetails(product: product),
              transition: Transition.rightToLeft);
        },
      ),
    );
  }
}
