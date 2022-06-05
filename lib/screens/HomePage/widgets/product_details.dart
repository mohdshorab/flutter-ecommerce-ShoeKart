import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/cart_controller.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:flutter_application_1/widgets/custom_text_widget.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel product;

  final cartController = Get.put(CartController());
  ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        title: Text(product.name),
        centerTitle: true,
        // actions: [CartIcon()],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                    width: 200.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(product.image)))),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Center(
                        child: CustomText(
                            text: product.name.toUpperCase(),
                            size: 26,
                            color: Colors.red,
                            weight: FontWeight.bold)),
                    Center(
                        child: CustomText(
                            text: product.brand,
                            size: 22,
                            color: Colors.grey,
                            weight: FontWeight.normal)),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const CustomText(
                              text: 'Details',
                              size: 20,
                              color: Colors.black,
                              weight: FontWeight.normal),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomText(
                              text: product.description,
                              size: 16,
                              color: Colors.black,
                              weight: FontWeight.normal),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    // ---------------------------------------------------------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Card(
                        elevation: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: CustomText(
                                text: "INR ${product.price}",
                                color: Colors.black,
                                size: 18,
                                weight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              height: 40,
                              child: TextButton(
                                onPressed: () {
                                  cartController.addProduct(product);
                                },
                                style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Colors.red,
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                    )),
                                child: const Text(
                                  'Add To Cart',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
