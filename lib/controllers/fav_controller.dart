import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class FavController extends GetxController {
  // creating a list to store the products in the cart
  final _fav = [].obs;

// method to add product in the cart
  void addProduct(ProductModel product) {
    _fav.add(product);
    debugPrint('Product is added to fav');
    Get.snackbar('Added to Favourites', 'You liked ${product.name}',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1));
  }

// checking that product is saved in _fav or not
  bool isSaved(ProductModel product) => _fav.contains(product) ? true : false;

  // creating getter to get products or to get the products in fav screen
  // and also because we can't access pvt variables outside
  get favProducts => _fav;

  // method to remove product in the cart
  void removeProduct(ProductModel product) {
    _fav.remove(product);
    Get.snackbar('You removed ', 'removed ${product.name}',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2));
  }
}
