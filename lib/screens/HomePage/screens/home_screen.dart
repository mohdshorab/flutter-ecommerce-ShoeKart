import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/authenticationService_controller.dart';
import 'package:flutter_application_1/controllers/cart_controller.dart';
import 'package:flutter_application_1/controllers/product_controller.dart';
import 'package:flutter_application_1/screens/HomePage/widgets/product_widget.dart';
import 'package:get/get.dart';
import '../../../widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  User? user = FirebaseAuth.instance.currentUser;
  final controller = Get.put(AuthenticationServiceController());
  final productsController = Get.put(ProductsController());
  final cartController = Get.put(CartController());
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CreateDrawer(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.5), BlendMode.dstATop),
          image: const NetworkImage(
              'https://images.unsplash.com/photo-1554103494-90f9e0883a85?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
          fit: BoxFit.cover,
        )),
        child: ProductWidget(),
      ),
    );
  }
}
