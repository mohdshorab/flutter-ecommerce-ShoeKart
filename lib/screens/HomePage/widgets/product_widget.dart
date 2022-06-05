import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/controllers/product_controller.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:get/get.dart';

import 'singleProductWidget.dart';

class ProductWidget extends StatelessWidget {
  final productController = Get.put(ProductsController());
  ProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((() => GridView.count(
      crossAxisCount:2,
      childAspectRatio: .63,
      padding: const EdgeInsets.all(10),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 10,
      children: productController.products.map((ProductModel product){
        return SingleProductWidget(product: product);
      }).toList())));    
  }
}