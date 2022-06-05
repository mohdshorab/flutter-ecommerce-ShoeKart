import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String image;
  final String name;
  final String brand;
  final double price;
  final String description;

  const ProductModel(
      {required this.description,
      required this.id,
      required this.image,
      required this.name,
      required this.brand,
      required this.price});

//  static method which return a product, taking snapshot from firestore and then take the value from this snapshot and convert it to the instance of product object.
  static ProductModel fromSnapshot(DocumentSnapshot snap) {
    ProductModel product = ProductModel(
      id: snap['id'],
      image: snap['image'],
      name: snap['name'],
      brand: snap['brand'],
      price: snap['price'],
      description: snap['description'],
    );
    return product;
  }
}
