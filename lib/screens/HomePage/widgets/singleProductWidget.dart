import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/cart_controller.dart';
import 'package:flutter_application_1/controllers/fav_controller.dart';
import 'package:flutter_application_1/controllers/product_controller.dart';
import 'package:flutter_application_1/screens/HomePage/widgets/product_details.dart';
import 'package:flutter_application_1/widgets/custom_text_widget.dart';
import 'package:get/get.dart';

import '../../../models/product_model.dart';

class SingleProductWidget extends StatelessWidget {
  final ProductModel product;
  final cartController = Get.put(CartController());
  final productController = Get.put(ProductsController());
  final favController = Get.put(FavController());

  SingleProductWidget({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      textDirection: TextDirection.rtl,
      fit: StackFit.loose,
      children: [
        GestureDetector(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      offset: const Offset(3, 2),
                      blurRadius: 7)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Image.network(
                        product.image,
                        width: double.infinity,
                        height: 150,
                      )),
                ),
                Text(
                  product.name,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                CustomText(
                  text: product.brand,
                  color: Colors.grey,
                  size: 16,
                  weight: FontWeight.normal,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: CustomText(
                        text: "INR ${product.price}",
                        size: 16,
                        weight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    IconButton(
                        icon: const Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          cartController.addProduct(product);
                        })
                  ],
                ),
              ],
            ),
          ),
          onTap: () {
            Get.to(ProductDetails(
              product: product,
            ));
          },
        ),
        Positioned(
          right: 0,
          child: Obx(() => CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: favController.isSaved(product)
                      ? const Icon(
                          Icons.favorite_rounded,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        ),
                  onPressed: () {
                    if (favController.isSaved(product)) {
                      favController.removeProduct(product);
                    } else {
                      favController.addProduct(product);
                    }
                  },
                ),
              )),
        )
      ],
    );
  }
}
