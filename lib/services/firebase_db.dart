import 'package:flutter_application_1/controllers/authenticationService_controller.dart';
import 'package:get/get.dart';
import '../models/product_model.dart';

class FireBaseDB {

  var controller = Get.put(AuthenticationServiceController());
  String collection = "products";

// will return a stream and it will give us a list of products essentially > take the collection > get a snapshot > take all docs > map it to a fn fromSnapshot(in product model) into productModel.
  Stream<List<ProductModel>> getAllProducts() => controller.firebaseFirestore
          .collection(collection)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs
            .map((doc) => ProductModel.fromSnapshot(doc))
            .toList();
      });
}
