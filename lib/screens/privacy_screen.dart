import 'package:flutter/material.dart';


class PrivacyScreen extends StatelessWidget {

  const PrivacyScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            "Privacy And Policy",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      body: Container(
        color: Colors.yellow.shade50,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 10, right: 10),
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(
                  bottom: 20, top: 20,
                ),
                child:  Text(
                  'PRIVACY POLICY STATEMENT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black, fontSize: 22.0, fontWeight:FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.5),
                child: Divider(color: Colors.black),
              ),
              Text(
                'We know that you care how information about you is used and shared, and we appreciate your trust that we will do so carefully and sensibly. This Privacy Notice describes how ShoeKart.com and its affiliates (collectively "ShoeKart") collect and process your personal information through ShoeKart websites, devices, products, services, online and physical stores, and applications that reference this Privacy Notice (together "ShoeKart Services"). ',
                style: TextStyle(
                    color: Colors.black, fontSize:16.0, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 20.0),
              Divider(
          // color:Colors.yellow.shade50,
          height: 20,
          thickness: 2,
          indent: 10,
          endIndent: 10,
        ),
              Text(
                'What Personal Information About Customers Does ShoeKart Collect?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight:FontWeight.w500,
                ),
              ),
              SizedBox(height: 3.0),
              Text(
                'Information You Give Us: We receive and store any information you provide in relation to ShoeKart Services. Click here to see examples of what we collect. You can choose not to provide certain information, but then you might not be able to take advantage of many of our ShopApp Services.',
                style: TextStyle(
                  color:Colors.black,
                  fontSize:16,
                  fontWeight:FontWeight.w300,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}