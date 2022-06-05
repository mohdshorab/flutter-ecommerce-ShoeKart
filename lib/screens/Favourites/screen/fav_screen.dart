import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/fav_controller.dart';
import 'package:flutter_application_1/widgets/custom_text_widget.dart';
import 'package:flutter_application_1/screens/Favourites/widget/fav_product.dart';
import 'package:get/get.dart';

class FavScreen extends StatelessWidget {
  final favController = Get.put(FavController());
  FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: (favController.favProducts.isEmpty)
              ? Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.dstATop),
                      image: const NetworkImage(
                          'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: const Center(
                      child: CustomText(
                          text: 'No item added to favourites yet.',
                          size: 24,
                          color: Colors.black,
                          weight: FontWeight.bold)),
                )
              : ListView(
                  children: [
                    FavProducts(),
                  ],
                ),
        ));
  }
}
