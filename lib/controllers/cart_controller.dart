import 'package:flutter_application_1/models/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  // creating a dict to store the products in the cart
  // key is the product and value is the quantity
  final _products = {}.obs;

// method to add product in the cart
  void addProduct(ProductModel product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }
    Get.snackbar('Product Added', 'You have added ${product.name}',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1));
  }

  // creating getter to get products or to get the products in cart screen
  // and also because we can't access pvt variables outside
  get products => _products;

  //  getter to get the subtotal of a single product
  get productSubTotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();

//  getter to get the subtotal of all product
  get total => _products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  // method to remove product in the cart
  void removeProduct(ProductModel product) {
    //  if product quantity is one then remove product fromcart completely else decrease the quantity
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
    Get.snackbar('Product removed', 'You have removed ${product.name}',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2));
  }
}
